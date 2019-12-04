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
				str_click_mf:null,
				str_click_entity:null,
				str_click_entity_attr:null,
				str_click_assoc:null,
				constructor: function () {
					this._handles = [];
				},
				postCreate: function () {
				},
				update: function (obj, callback) {
					this._contextObj = obj;
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
									this.str_click_entity_attr!=null&&
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
								var tgtclass=$(tgt.target).attr('class');
								if(tgtclass!=null){
									obj.set(this.str_click_entity_attr,$(tgt.target).attr('class'));
									this._execMf(this.str_click_mf,obj.getGuid(),dojo.hitch(this,function(ret){}))
								}else{
								}
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
