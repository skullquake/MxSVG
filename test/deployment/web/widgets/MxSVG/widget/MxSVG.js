require(
	{
                packages:[
                        {
                                name:'_svg',
                                location:'/widgets/MxSVG/lib/svg.js-3.0.16/',
                                main:'svg.min'
                        }
		]
	},
	[
		"_svg"
	],
	function(
		_svg
	){
		require(
			{
				packages:[
					{
						name:'_svgdraggy',
						location:'/widgets/MxSVG/lib/svg.pan-zoom.js/',
						main:'svg.draggy'
					},
					{
						name:'_svgpanzoom',
						location:'/widgets/MxSVG/lib/svg.pan-zoom.js/',
						main:'svg.pan-zoom.min'
					}
				]
			},
			[
				"dojo/_base/declare",
				"mxui/widget/_WidgetBase",
				"dijit/_TemplatedMixin",
				"mxui/dom",
				"dojo/dom",
				"dojo/dom-prop",
				"dojo/dom-geometry",
				"dojo/dom-class",
				"dojo/dom-style",
				"dojo/dom-construct",
				"dojo/_base/array",
				"dojo/_base/lang",
				"dojo/text",
				"dojo/html",
				"dojo/_base/event",
				"dojo/mouse",
				"dojo/on",
				"MxSVG/lib/jquery-1.11.2",
				//"_svgdraggy",
				//"_svgpanzoom",
				"dojo/text!MxSVG/widget/template/MxSVG.html"
			],
			function(
				declare,
				_WidgetBase,
				_TemplatedMixin,
				dom,
				dojoDom,
				dojoProp,
				dojoGeometry,
				dojoClass,
				dojoStyle,
				dojoConstruct,
				dojoArray,
				lang,
				dojoText,
				dojoHtml,
				dojoEvent,
				mouse,
				on,
				_jQuery,
				//_svgdraggy,
				//_svgpanzoom,
				widgetTemplate
			){
				"use strict";
				var $ = _jQuery.noConflict(true);
				window.$=$;
				return declare(
					"MxSVG.widget.MxSVG",
					[
						_WidgetBase,
						_TemplatedMixin
					],
					{
						templateString:widgetTemplate,
						widgetBase:null,
						_handles:null,
						_contextObj:null,
						//------------------------------
						str_click_mf:null,
						//------------------------------
						str_click_entity:null,
						str_click_entity_id_attr:null,
						str_click_entity_class_attr:null,
						str_click_assoc:null,
						//------------------------------
						str_data_entity:null,
						str_data_assoc:null,
						str_data_entity_id_attr:null,
						str_data_entity_class_attr:null,
						str_data_entity_fill_attr:null,
						//------------------------------
						str_highlightcolor_correlated:null,
						str_highlightcolor_uncorrelated:null,
						//------------------------------
						arr_nod_all:[],
						arr_nod_correlated:[],
						arr_nod_uncorrelated:[],
						int_zoomLvl:1,
						int_zoomLvlOriginal:null,
						int_zoomInc:1,
						_objectChangeHandler:null,
						//------------------------------
						dom_btngroup:null,
						dom_btnzoomin:null,
						dom_btnzoomout:null,
						dom_btnzoomreset:null,
						//------------------------------
						constructor:function(){
							this._handles=[];
						},
						postCreate:function(){
						},
						update:function(obj,callback){
							if(this._objectChangeHandler !== null) {
								this.unsubscribe(this._objectChangeHandler);
							}
							if(obj){
								this._objectChangeHandler = this.subscribe({
								guid: obj.getGuid(),
								callback:dojo.hitch(this, function () {
									this._updateRendering(callback);
								})
							});
							}else{}
			


							this._contextObj=obj;
							if(this.dom_svg==null){
								this.dom_svg=dojo.create(
									'div',
									{
										'id':this.id+'_svgdiv'
									}
								);
								this.domNode.appendChild(this.dom_svg);
								dojo.connect(
									this.dom_svg,
									'click',
									dojo.hitch(this,function(tgt){
										this.clickElement(tgt);
									})
								);
								dojo.connect(
									this.dom_btnzoomin,
									'click',
									dojo.hitch(this,this.zoomIn)
								);
								dojo.connect(
									this.dom_btnzoomout,
									'click',
									dojo.hitch(this,this.zoomOut)
								);
								dojo.connect(
									this.dom_btnzoomreset,
									'click',
									dojo.hitch(this,this.zoomReset)
								);


							}
							this._updateRendering(callback);
							this._executeCallback(callback, "update");
						},
						resize: function (box) {
						},
						uninitialize: function () {
						},
						destroy:function () {
						},
						addZoom:function(){
							this.svg=new SVG(dojo.query('svg',this.dom_svg)[0]).size("100%", 900);
							window.svg=this.svg;
							window.nodes=this.nodes;
							this.nodes=this.svg.group();
							this.int_zoomLvl=this.svg.zoom();
							this.int_zoomLvlOriginal=this.svg.zoom();
							
/*
							this.svg.children().forEach(function(child,childidx){
								child.draggy()
								//child.panZoom();
							});
							//this.nodes.group().draggy();
							//this.nodes.panZoom();
*/
						},
						zoomIn:function(){
							this.int_zoomLvl+=this.int_zoomInc;
							this.svg.zoom(this.int_zoomLvl);
						},
						zoomOut:function(){
							this.int_zoomLvl-=this.int_zoomInc;
							this.svg.zoom(this.int_zoomLvl);
						},
						zoomReset:function(){
							this.int_zoomLvl=this.int_zoomLvlOriginal;
							this.svg.zoom(this.int_zoomLvl);
						},
						_updateRendering: function (callback) {
							if (this._contextObj !== null) {
								this.loaded=true;
								var fileurl="/file?guid="+this._contextObj.getGuid()+"&changeDate="+(new Date().getTime());
								this.dom_svg.src=fileurl;
								$(this.dom_svg).load(fileurl,dojo.hitch(this,function(d){
									window.setTimeout(
										dojo.hitch(this,this.addZoom),
										1000
									);
								}))
								dojoStyle.set(this.domNode, "display", "block");
								//setup data entities
								new Promise((resolve,reject)=>{
									mx.data.get({
										guid:this._contextObj.getGuid(),
										//path:'Main.Tgt_FileDocument',
										path:this.str_data_assoc,
										filter:{
											offset:0,
											amount:4096
										},
										callback:function(objs){
											resolve(objs);
										},
										error:function(e){
											reject(e);
										}
									});

								})
								.then(
									dojo.hitch(this,function(arr_obj){
										window.objs=arr_obj;
										//this.str_data_entity
										if(this.str_data_entity_fill_attr){
											try{
												arr_obj.forEach(dojo.hitch(this,function(obj,objidx){
													var str_color=obj.get(this.str_data_entity_fill_attr);
													if(
														str_color!=null&&
														str_color!=''
													){
														var query='';
														if(
															obj.get(this.str_data_entity_class_attr)!=null&&
															obj.get(this.str_data_entity_class_attr)!=''
														){
															query+='.'+obj.get(this.str_data_entity_class_attr)
														}
														if(
															obj.get(this.str_data_entity_id_attr)!=null&&
															obj.get(this.str_data_entity_id_attr)!=''
														){
															query+='#'+obj.get(this.str_data_entity_id_attr)
														}
														if(query!=''){
															var arr_nod=dojo.query(this.dom_svg).query(query);
															arr_nod.forEach(dojo.hitch(this,function(obj_nod,obj_nod_idx){
																$(obj_nod).css('fill',str_color);
															}));
														}
													}else{
														console.error(
															this.id+
															': '+
															this.str_data_entity_fill_attr+
															' null|empty'
														);
													}
												}));
											}catch(e){
												console.error(this.id+':'+e.toString());
											}
										}
										//hover
										if(
											(this.str_highlightcolor_correlated!=null||this.str_highlightcolor_correlated!='')&&
											!(
												this.str_data_entity_id_attr==null&&
												this.str_data_entity_class_attr==null
											)
										){
											this.arr_nod_correlated=[];
											arr_obj.forEach(dojo.hitch(this,function(obj,objidx){
												var query='';
												if(
													obj.get(this.str_data_entity_class_attr)!=null&&
													obj.get(this.str_data_entity_class_attr)!=''
												){
													query+='.'+obj.get(this.str_data_entity_class_attr)
												}
												if(
													obj.get(this.str_data_entity_id_attr)!=null&&
													obj.get(this.str_data_entity_id_attr)!=''
												){
													query+='#'+obj.get(this.str_data_entity_id_attr)
												}
												if(query!=''){
													var arr_nod_query=dojo.query(this.dom_svg).query(query);
													arr_nod_query.forEach(dojo.hitch(this,function(obj_nod,obj_nod_idx){
														this.arr_nod_correlated.push(obj_nod);
														obj_nod.oldfill=$(obj_nod).css('fill');
														on(
															obj_nod,
															mouse.enter,
															dojo.hitch(this,function(evt){
																$(evt.target).css('fill',this.str_highlightcolor_correlated);
															})
														);
														on(
															obj_nod,
															mouse.leave,
															dojo.hitch(this,function(evt){
																$(evt.target).css('fill',evt.target.oldfill);
															})
														);

													}));
												}
											}));
											//apply hover for uncorrelated...
											if(
												this.str_highlightcolor_uncorrelated!=null&&
												this.str_highlightcolor_uncorrelated!=''
											){
												this.arr_nod_uncorrelated=[];
												this.arr_nod_all=dojo.query('rect',this.dom_svg);
												this.arr_nod_all.forEach(dojo.hitch(this,function(nod,nodidx){
													if(
														this.arr_nod_correlated.find(
															function(nod_uncorrelated,nod_uncorrelated_idx){
															if(nod_uncorrelated==nod){
															    return true;
															}else{
															    return false;
															}
														    }
														)
													){
													}else{
														this.arr_nod_uncorrelated.push(nod);
													}
												}));
												this.arr_nod_uncorrelated.forEach(dojo.hitch(this,function(obj_nod,obj_nodidx){
														//$(nod).css('fill','yellow');
														obj_nod.oldfill=$(obj_nod).css('fill');
														on(
															obj_nod,
															mouse.enter,
															dojo.hitch(this,function(evt){
																$(evt.target).css('fill',this.str_highlightcolor_uncorrelated);
															})
														);
														on(
															obj_nod,
															mouse.leave,
															dojo.hitch(this,function(evt){
																$(evt.target).css('fill',evt.target.oldfill);
															})
														);

												}));
											}else{
											}
										}
									}),
									dojo.hitch(this,function(err){
										alert(err);
									})
								);
							} else {
								dojoStyle.set(this.domNode, "display", "none");
								dojo.empty(this.dom_svg);
							}
							this._executeCallback(callback, "_updateRendering");
						},
						clickElement:function(tgt){
							if(tgt!=null){
								new Promise((resolve,reject)=>{
									if(this.obj_click==null){
										if(
											this.str_click_mf!=null&&
											this.str_click_entity!=null&&
											//this.str_click_entity_attr!=null&&
											!(
												this.str_click_entity_id_attr==null&&
												this.str_click_entity_class_attr==null
											)&&
											this.str_click_assoc!=null
										){
											mx.data.create(
												{
													entity:this.str_click_entity,
													callback:dojo.hitch(this,function(obj){
														obj.addReference(
															this.str_click_assoc,
															this._contextObj.getGuid()
														);
														resolve(obj)
													}),
													error:dojo.hitch(this,function(e){
														reject(e);
													})
												}
											);
										}else{
											reject('Invalid interaction attributes');
										}
									}else{
										resolve(obj_click);
									}
								})
								.then(
									dojo.hitch(this,function(obj){
										if(this.str_click_entity_id_attr!=null){
											var tgtid=$(tgt.target).attr('id');
											if(tgtid!=null){
												obj.set(this.str_click_entity_id_attr,tgtid);
											}else{
											}
										}
										if(this.str_click_entity_class_attr!=null){
											var tgtclass=$(tgt.target).attr('class');
											if(tgtclass!=null){
												obj.set(this.str_click_entity_class_attr,tgtclass);
											}else{
											}
										}
										this._execMf(this.str_click_mf,obj.getGuid(),dojo.hitch(this,function(ret){}))
									}),
									dojo.hitch(this,function(err){
										console.error(err);
									})
								)
							}else{
							}

						},
						_execMf: function (mf, guid, cb) {
							if (mf && guid) {
								mx.ui.action(mf, {
									params: {
										applyto: "selection",
										guids: [guid]
									},
									callback: lang.hitch(this, function (objs) {
										if (cb && typeof cb === "function") {
											cb(objs);
										}
									}),
									error: function (error) {
										console.debug(error.description);
									}
								}, this);
							}
						},
						_executeCallback: function (cb, from) {
							if (cb && typeof cb === "function") {
								cb();
							}
						}
					}
				);
			}
		);
		//require(["MxSVG/widget/MxSVG"]);

	}
);

