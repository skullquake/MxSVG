require(
	{
		packages:[

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
				str_highlightcolor:null,
				//------------------------------
				constructor:function(){
					this._handles=[];
				},
				postCreate:function(){
				},
				update:function(obj,callback){
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
					}

					this._updateRendering(callback);
				},
				resize: function (box) {
				},
				uninitialize: function () {
				},
				destroy:function () {
				},
				_updateRendering: function (callback) {
					if (this._contextObj !== null) {
						this.loaded=true;
						var fileurl="/file?guid="+this._contextObj.getGuid()+"&changeDate="+(new Date().getTime());
						this.dom_svg.src=fileurl;
						$(this.dom_svg).load(fileurl);
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
									(this.str_highlightcolor!=null||this.str_highlightcolor!='')&&
									!(
										this.str_data_entity_id_attr==null&&
										this.str_data_entity_class_attr==null
									)
								){
									arr_obj.forEach(dojo.hitch(this,function(obj,objidx){
											//mx.ui.info(this.str_data_entity_class_attr)
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
												obj_nod.oldfill=$(obj_nod).css('fill');
												on(
													obj_nod,
													mouse.enter,
													dojo.hitch(this,function(evt){
														$(evt.target).css('fill',this.str_highlightcolor);
													})
												);
												on(
													obj_nod,
													mouse.leave,
													dojo.hitch(this,function(evt){
														//evt.target.style=evt.target.oldstyle;
														$(evt.target).css('fill',evt.target.oldfill);//.style=evt.target.oldstyle;
														//obj_nod.oldfill=$(obj_nod).css('fill');
													})
												);

											}));
										}
									}))

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
										obj.set(this.str_click_entity_id_attr,tgtid);//$(tgt.target).attr('id'));
									}else{
									}
								}
								if(this.str_click_entity_class_attr!=null){
									var tgtclass=$(tgt.target).attr('class');
									if(tgtclass!=null){
										obj.set(this.str_click_entity_class_attr,tgtclass);//$(tgt.target).attr('class'));
									}else{
									}
								}
								//obj.set(this.str_click_entity_class_attr,'asdf');//tgtclass);//$(tgt.target).attr('class'));
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
