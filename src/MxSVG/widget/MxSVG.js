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
		widgetTemplate
	){
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
				constructor: function () {
					this._handles = [];
				},
				postCreate: function () {
				},
				update: function (obj, callback) {
					this._contextObj = obj;
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
						if(this.dom_svg==null){
							this.dom_svg=dojo.create(
								'img',
								{}
							);
							this.domNode.appendChild(this.dom_svg);
						}
						this.dom_svg.src=fileurl;
						dojoStyle.set(this.domNode, "display", "block");
					} else {
						dojoStyle.set(this.domNode, "display", "none");
						if(this.dom_svg==null){
							this.dom_svg=dojo.create(
								'img',
								{}
							);
							this.domNode.appendChild(this.dom_svg);
						}
						this.dom_svg.src='';

					}
					this._executeCallback(callback, "_updateRendering");
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
