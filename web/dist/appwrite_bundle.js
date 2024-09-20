(()=>{"use strict";var e,t,i,n,o,a,r,s,c,d,l;function u(e,t,i,n){return new(i||(i=Promise))((function(o,a){function r(e){try{c(n.next(e))}catch(e){a(e)}}function s(e){try{c(n.throw(e))}catch(e){a(e)}}function c(e){var t;e.done?o(e.value):(t=e.value,t instanceof i?t:new i((function(e){e(t)}))).then(r,s)}c((n=n.apply(e,t||[])).next())}))}class p{constructor(e){this.client=e}static flatten(e,t=""){let i={};for(const[n,o]of Object.entries(e)){let e=t?t+"["+n+"]":n;Array.isArray(o)?i=Object.assign(Object.assign({},i),p.flatten(o,e)):i[e]=o}return i}}p.CHUNK_SIZE=5242880;class h{constructor(e,t,i){this.method=e,this.attribute=t,void 0!==i&&(Array.isArray(i)?this.values=i:this.values=[i])}toString(){return JSON.stringify({method:this.method,attribute:this.attribute,values:this.values})}}h.equal=(e,t)=>new h("equal",e,t).toString(),h.notEqual=(e,t)=>new h("notEqual",e,t).toString(),h.lessThan=(e,t)=>new h("lessThan",e,t).toString(),h.lessThanEqual=(e,t)=>new h("lessThanEqual",e,t).toString(),h.greaterThan=(e,t)=>new h("greaterThan",e,t).toString(),h.greaterThanEqual=(e,t)=>new h("greaterThanEqual",e,t).toString(),h.isNull=e=>new h("isNull",e).toString(),h.isNotNull=e=>new h("isNotNull",e).toString(),h.between=(e,t,i)=>new h("between",e,[t,i]).toString(),h.startsWith=(e,t)=>new h("startsWith",e,t).toString(),h.endsWith=(e,t)=>new h("endsWith",e,t).toString(),h.select=e=>new h("select",void 0,e).toString(),h.search=(e,t)=>new h("search",e,t).toString(),h.orderDesc=e=>new h("orderDesc",e).toString(),h.orderAsc=e=>new h("orderAsc",e).toString(),h.cursorAfter=e=>new h("cursorAfter",void 0,e).toString(),h.cursorBefore=e=>new h("cursorBefore",void 0,e).toString(),h.limit=e=>new h("limit",void 0,e).toString(),h.offset=e=>new h("offset",void 0,e).toString(),h.contains=(e,t)=>new h("contains",e,t).toString(),h.or=e=>new h("or",void 0,e.map((e=>JSON.parse(e)))).toString(),h.and=e=>new h("and",void 0,e.map((e=>JSON.parse(e)))).toString();class f extends Error{constructor(e,t=0,i="",n=""){super(e),this.name="AppwriteException",this.message=e,this.code=t,this.type=i,this.response=n}}class w{constructor(){this.config={endpoint:"https://cloud.appwrite.io/v1",endpointRealtime:"",project:"",jwt:"",locale:"",session:""},this.headers={"x-sdk-name":"Web","x-sdk-platform":"client","x-sdk-language":"web","x-sdk-version":"15.0.0","X-Appwrite-Response-Format":"1.5.0"},this.realtime={socket:void 0,timeout:void 0,url:"",channels:new Set,subscriptions:new Map,subscriptionsCounter:0,reconnect:!0,reconnectAttempts:0,lastMessage:void 0,connect:()=>{clearTimeout(this.realtime.timeout),this.realtime.timeout=null===window||void 0===window?void 0:window.setTimeout((()=>{this.realtime.createSocket()}),50)},getTimeout:()=>{switch(!0){case this.realtime.reconnectAttempts<5:return 1e3;case this.realtime.reconnectAttempts<15:return 5e3;case this.realtime.reconnectAttempts<100:return 1e4;default:return 6e4}},createSocket:()=>{var e,t,i;if(this.realtime.channels.size<1)return this.realtime.reconnect=!1,void(null===(e=this.realtime.socket)||void 0===e||e.close());const n=new URLSearchParams;n.set("project",this.config.project),this.realtime.channels.forEach((e=>{n.append("channels[]",e)}));const o=this.config.endpointRealtime+"/realtime?"+n.toString();(o!==this.realtime.url||!this.realtime.socket||(null===(t=this.realtime.socket)||void 0===t?void 0:t.readyState)>WebSocket.OPEN)&&(this.realtime.socket&&(null===(i=this.realtime.socket)||void 0===i?void 0:i.readyState)<WebSocket.CLOSING&&(this.realtime.reconnect=!1,this.realtime.socket.close()),this.realtime.url=o,this.realtime.socket=new WebSocket(o),this.realtime.socket.addEventListener("message",this.realtime.onMessage),this.realtime.socket.addEventListener("open",(e=>{this.realtime.reconnectAttempts=0})),this.realtime.socket.addEventListener("close",(e=>{var t,i,n;if(!this.realtime.reconnect||"error"===(null===(i=null===(t=this.realtime)||void 0===t?void 0:t.lastMessage)||void 0===i?void 0:i.type)&&1008===(null===(n=this.realtime)||void 0===n?void 0:n.lastMessage.data).code)return void(this.realtime.reconnect=!0);const o=this.realtime.getTimeout();console.error(`Realtime got disconnected. Reconnect will be attempted in ${o/1e3} seconds.`,e.reason),setTimeout((()=>{this.realtime.reconnectAttempts++,this.realtime.createSocket()}),o)})))},onMessage:e=>{var t,i;try{const n=JSON.parse(e.data);switch(this.realtime.lastMessage=n,n.type){case"connected":const e=JSON.parse(null!==(t=window.localStorage.getItem("cookieFallback"))&&void 0!==t?t:"{}"),o=null==e?void 0:e[`a_session_${this.config.project}`],a=n.data;o&&!a.user&&(null===(i=this.realtime.socket)||void 0===i||i.send(JSON.stringify({type:"authentication",data:{session:o}})));break;case"event":let r=n.data;if(null==r?void 0:r.channels){if(!r.channels.some((e=>this.realtime.channels.has(e))))return;this.realtime.subscriptions.forEach((e=>{r.channels.some((t=>e.channels.includes(t)))&&setTimeout((()=>e.callback(r)))}))}break;case"error":throw n.data}}catch(e){console.error(e)}},cleanUp:e=>{this.realtime.channels.forEach((t=>{e.includes(t)&&(Array.from(this.realtime.subscriptions).some((([e,i])=>i.channels.includes(t)))||this.realtime.channels.delete(t))}))}}}setEndpoint(e){return this.config.endpoint=e,this.config.endpointRealtime=this.config.endpointRealtime||this.config.endpoint.replace("https://","wss://").replace("http://","ws://"),this}setEndpointRealtime(e){return this.config.endpointRealtime=e,this}setProject(e){return this.headers["X-Appwrite-Project"]=e,this.config.project=e,this}setJWT(e){return this.headers["X-Appwrite-JWT"]=e,this.config.jwt=e,this}setLocale(e){return this.headers["X-Appwrite-Locale"]=e,this.config.locale=e,this}setSession(e){return this.headers["X-Appwrite-Session"]=e,this.config.session=e,this}subscribe(e,t){let i="string"==typeof e?[e]:e;i.forEach((e=>this.realtime.channels.add(e)));const n=this.realtime.subscriptionsCounter++;return this.realtime.subscriptions.set(n,{channels:i,callback:t}),this.realtime.connect(),()=>{this.realtime.subscriptions.delete(n),this.realtime.cleanUp(i),this.realtime.connect()}}call(e,t,i={},n={}){var o;return u(this,void 0,void 0,(function*(){e=e.toUpperCase(),i=Object.assign({},this.headers,i);let a={method:e,headers:i,credentials:"include"};if("undefined"!=typeof window&&window.localStorage){const e=window.localStorage.getItem("cookieFallback");e&&(i["X-Fallback-Cookies"]=e)}if("GET"===e)for(const[e,i]of Object.entries(p.flatten(n)))t.searchParams.append(e,i);else switch(i["content-type"]){case"application/json":a.body=JSON.stringify(n);break;case"multipart/form-data":let e=new FormData;for(const t in n)Array.isArray(n[t])?n[t].forEach((i=>{e.append(t+"[]",i)})):e.append(t,n[t]);a.body=e,delete i["content-type"]}try{let e=null;const i=yield fetch(t.toString(),a);if(e=(null===(o=i.headers.get("content-type"))||void 0===o?void 0:o.includes("application/json"))?yield i.json():{message:yield i.text()},400<=i.status)throw new f(null==e?void 0:e.message,i.status,null==e?void 0:e.type,e);const n=i.headers.get("X-Fallback-Cookies");return"undefined"!=typeof window&&window.localStorage&&n&&(window.console.warn("Appwrite is using localStorage for session management. Increase your security by adding a custom domain as your API endpoint."),window.localStorage.setItem("cookieFallback",n)),e}catch(e){if(e instanceof f)throw e;throw new f(e.message)}}))}}class m extends p{constructor(e){super(e)}get(){return u(this,void 0,void 0,(function*(){const e=new URL(this.client.config.endpoint+"/account");return yield this.client.call("get",e,{"content-type":"application/json"},{})}))}create(e,t,i,n){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "userId"');if(void 0===t)throw new f('Missing required parameter: "email"');if(void 0===i)throw new f('Missing required parameter: "password"');const o={};void 0!==e&&(o.userId=e),void 0!==t&&(o.email=t),void 0!==i&&(o.password=i),void 0!==n&&(o.name=n);const a=new URL(this.client.config.endpoint+"/account");return yield this.client.call("post",a,{"content-type":"application/json"},o)}))}updateEmail(e,t){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "email"');if(void 0===t)throw new f('Missing required parameter: "password"');const i={};void 0!==e&&(i.email=e),void 0!==t&&(i.password=t);const n=new URL(this.client.config.endpoint+"/account/email");return yield this.client.call("patch",n,{"content-type":"application/json"},i)}))}listIdentities(e){return u(this,void 0,void 0,(function*(){const t={};void 0!==e&&(t.queries=e);const i=new URL(this.client.config.endpoint+"/account/identities");return yield this.client.call("get",i,{"content-type":"application/json"},t)}))}deleteIdentity(e){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "identityId"');const t="/account/identities/{identityId}".replace("{identityId}",e),i=new URL(this.client.config.endpoint+t);return yield this.client.call("delete",i,{"content-type":"application/json"},{})}))}createJWT(){return u(this,void 0,void 0,(function*(){const e=new URL(this.client.config.endpoint+"/account/jwt");return yield this.client.call("post",e,{"content-type":"application/json"},{})}))}listLogs(e){return u(this,void 0,void 0,(function*(){const t={};void 0!==e&&(t.queries=e);const i=new URL(this.client.config.endpoint+"/account/logs");return yield this.client.call("get",i,{"content-type":"application/json"},t)}))}updateMFA(e){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "mfa"');const t={};void 0!==e&&(t.mfa=e);const i=new URL(this.client.config.endpoint+"/account/mfa");return yield this.client.call("patch",i,{"content-type":"application/json"},t)}))}createMfaAuthenticator(e){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "type"');const t="/account/mfa/authenticators/{type}".replace("{type}",e),i=new URL(this.client.config.endpoint+t);return yield this.client.call("post",i,{"content-type":"application/json"},{})}))}updateMfaAuthenticator(e,t){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "type"');if(void 0===t)throw new f('Missing required parameter: "otp"');const i="/account/mfa/authenticators/{type}".replace("{type}",e),n={};void 0!==t&&(n.otp=t);const o=new URL(this.client.config.endpoint+i);return yield this.client.call("put",o,{"content-type":"application/json"},n)}))}deleteMfaAuthenticator(e,t){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "type"');if(void 0===t)throw new f('Missing required parameter: "otp"');const i="/account/mfa/authenticators/{type}".replace("{type}",e),n={};void 0!==t&&(n.otp=t);const o=new URL(this.client.config.endpoint+i);return yield this.client.call("delete",o,{"content-type":"application/json"},n)}))}createMfaChallenge(e){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "factor"');const t={};void 0!==e&&(t.factor=e);const i=new URL(this.client.config.endpoint+"/account/mfa/challenge");return yield this.client.call("post",i,{"content-type":"application/json"},t)}))}updateMfaChallenge(e,t){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "challengeId"');if(void 0===t)throw new f('Missing required parameter: "otp"');const i={};void 0!==e&&(i.challengeId=e),void 0!==t&&(i.otp=t);const n=new URL(this.client.config.endpoint+"/account/mfa/challenge");return yield this.client.call("put",n,{"content-type":"application/json"},i)}))}listMfaFactors(){return u(this,void 0,void 0,(function*(){const e=new URL(this.client.config.endpoint+"/account/mfa/factors");return yield this.client.call("get",e,{"content-type":"application/json"},{})}))}getMfaRecoveryCodes(){return u(this,void 0,void 0,(function*(){const e=new URL(this.client.config.endpoint+"/account/mfa/recovery-codes");return yield this.client.call("get",e,{"content-type":"application/json"},{})}))}createMfaRecoveryCodes(){return u(this,void 0,void 0,(function*(){const e=new URL(this.client.config.endpoint+"/account/mfa/recovery-codes");return yield this.client.call("post",e,{"content-type":"application/json"},{})}))}updateMfaRecoveryCodes(){return u(this,void 0,void 0,(function*(){const e=new URL(this.client.config.endpoint+"/account/mfa/recovery-codes");return yield this.client.call("patch",e,{"content-type":"application/json"},{})}))}updateName(e){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "name"');const t={};void 0!==e&&(t.name=e);const i=new URL(this.client.config.endpoint+"/account/name");return yield this.client.call("patch",i,{"content-type":"application/json"},t)}))}updatePassword(e,t){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "password"');const i={};void 0!==e&&(i.password=e),void 0!==t&&(i.oldPassword=t);const n=new URL(this.client.config.endpoint+"/account/password");return yield this.client.call("patch",n,{"content-type":"application/json"},i)}))}updatePhone(e,t){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "phone"');if(void 0===t)throw new f('Missing required parameter: "password"');const i={};void 0!==e&&(i.phone=e),void 0!==t&&(i.password=t);const n=new URL(this.client.config.endpoint+"/account/phone");return yield this.client.call("patch",n,{"content-type":"application/json"},i)}))}getPrefs(){return u(this,void 0,void 0,(function*(){const e=new URL(this.client.config.endpoint+"/account/prefs");return yield this.client.call("get",e,{"content-type":"application/json"},{})}))}updatePrefs(e){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "prefs"');const t={};void 0!==e&&(t.prefs=e);const i=new URL(this.client.config.endpoint+"/account/prefs");return yield this.client.call("patch",i,{"content-type":"application/json"},t)}))}createRecovery(e,t){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "email"');if(void 0===t)throw new f('Missing required parameter: "url"');const i={};void 0!==e&&(i.email=e),void 0!==t&&(i.url=t);const n=new URL(this.client.config.endpoint+"/account/recovery");return yield this.client.call("post",n,{"content-type":"application/json"},i)}))}updateRecovery(e,t,i){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "userId"');if(void 0===t)throw new f('Missing required parameter: "secret"');if(void 0===i)throw new f('Missing required parameter: "password"');const n={};void 0!==e&&(n.userId=e),void 0!==t&&(n.secret=t),void 0!==i&&(n.password=i);const o=new URL(this.client.config.endpoint+"/account/recovery");return yield this.client.call("put",o,{"content-type":"application/json"},n)}))}listSessions(){return u(this,void 0,void 0,(function*(){const e=new URL(this.client.config.endpoint+"/account/sessions");return yield this.client.call("get",e,{"content-type":"application/json"},{})}))}deleteSessions(){return u(this,void 0,void 0,(function*(){const e=new URL(this.client.config.endpoint+"/account/sessions");return yield this.client.call("delete",e,{"content-type":"application/json"},{})}))}createAnonymousSession(){return u(this,void 0,void 0,(function*(){const e=new URL(this.client.config.endpoint+"/account/sessions/anonymous");return yield this.client.call("post",e,{"content-type":"application/json"},{})}))}createEmailPasswordSession(e,t){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "email"');if(void 0===t)throw new f('Missing required parameter: "password"');const i={};void 0!==e&&(i.email=e),void 0!==t&&(i.password=t);const n=new URL(this.client.config.endpoint+"/account/sessions/email");return yield this.client.call("post",n,{"content-type":"application/json"},i)}))}updateMagicURLSession(e,t){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "userId"');if(void 0===t)throw new f('Missing required parameter: "secret"');const i={};void 0!==e&&(i.userId=e),void 0!==t&&(i.secret=t);const n=new URL(this.client.config.endpoint+"/account/sessions/magic-url");return yield this.client.call("put",n,{"content-type":"application/json"},i)}))}createOAuth2Session(e,t,i,n){if(void 0===e)throw new f('Missing required parameter: "provider"');const o="/account/sessions/oauth2/{provider}".replace("{provider}",e),a={};void 0!==t&&(a.success=t),void 0!==i&&(a.failure=i),void 0!==n&&(a.scopes=n);const r=new URL(this.client.config.endpoint+o);a.project=this.client.config.project;for(const[e,t]of Object.entries(p.flatten(a)))r.searchParams.append(e,t);if("undefined"==typeof window||!(null===window||void 0===window?void 0:window.location))return r;window.location.href=r.toString()}updatePhoneSession(e,t){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "userId"');if(void 0===t)throw new f('Missing required parameter: "secret"');const i={};void 0!==e&&(i.userId=e),void 0!==t&&(i.secret=t);const n=new URL(this.client.config.endpoint+"/account/sessions/phone");return yield this.client.call("put",n,{"content-type":"application/json"},i)}))}createSession(e,t){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "userId"');if(void 0===t)throw new f('Missing required parameter: "secret"');const i={};void 0!==e&&(i.userId=e),void 0!==t&&(i.secret=t);const n=new URL(this.client.config.endpoint+"/account/sessions/token");return yield this.client.call("post",n,{"content-type":"application/json"},i)}))}getSession(e){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "sessionId"');const t="/account/sessions/{sessionId}".replace("{sessionId}",e),i=new URL(this.client.config.endpoint+t);return yield this.client.call("get",i,{"content-type":"application/json"},{})}))}updateSession(e){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "sessionId"');const t="/account/sessions/{sessionId}".replace("{sessionId}",e),i=new URL(this.client.config.endpoint+t);return yield this.client.call("patch",i,{"content-type":"application/json"},{})}))}deleteSession(e){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "sessionId"');const t="/account/sessions/{sessionId}".replace("{sessionId}",e),i=new URL(this.client.config.endpoint+t);return yield this.client.call("delete",i,{"content-type":"application/json"},{})}))}updateStatus(){return u(this,void 0,void 0,(function*(){const e=new URL(this.client.config.endpoint+"/account/status");return yield this.client.call("patch",e,{"content-type":"application/json"},{})}))}createPushTarget(e,t,i){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "targetId"');if(void 0===t)throw new f('Missing required parameter: "identifier"');const n={};void 0!==e&&(n.targetId=e),void 0!==t&&(n.identifier=t),void 0!==i&&(n.providerId=i);const o=new URL(this.client.config.endpoint+"/account/targets/push");return yield this.client.call("post",o,{"content-type":"application/json"},n)}))}updatePushTarget(e,t){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "targetId"');if(void 0===t)throw new f('Missing required parameter: "identifier"');const i="/account/targets/{targetId}/push".replace("{targetId}",e),n={};void 0!==t&&(n.identifier=t);const o=new URL(this.client.config.endpoint+i);return yield this.client.call("put",o,{"content-type":"application/json"},n)}))}deletePushTarget(e){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "targetId"');const t="/account/targets/{targetId}/push".replace("{targetId}",e),i=new URL(this.client.config.endpoint+t);return yield this.client.call("delete",i,{"content-type":"application/json"},{})}))}createEmailToken(e,t,i){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "userId"');if(void 0===t)throw new f('Missing required parameter: "email"');const n={};void 0!==e&&(n.userId=e),void 0!==t&&(n.email=t),void 0!==i&&(n.phrase=i);const o=new URL(this.client.config.endpoint+"/account/tokens/email");return yield this.client.call("post",o,{"content-type":"application/json"},n)}))}createMagicURLToken(e,t,i,n){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "userId"');if(void 0===t)throw new f('Missing required parameter: "email"');const o={};void 0!==e&&(o.userId=e),void 0!==t&&(o.email=t),void 0!==i&&(o.url=i),void 0!==n&&(o.phrase=n);const a=new URL(this.client.config.endpoint+"/account/tokens/magic-url");return yield this.client.call("post",a,{"content-type":"application/json"},o)}))}createOAuth2Token(e,t,i,n){if(void 0===e)throw new f('Missing required parameter: "provider"');const o="/account/tokens/oauth2/{provider}".replace("{provider}",e),a={};void 0!==t&&(a.success=t),void 0!==i&&(a.failure=i),void 0!==n&&(a.scopes=n);const r=new URL(this.client.config.endpoint+o);a.project=this.client.config.project;for(const[e,t]of Object.entries(p.flatten(a)))r.searchParams.append(e,t);if("undefined"==typeof window||!(null===window||void 0===window?void 0:window.location))return r;window.location.href=r.toString()}createPhoneToken(e,t){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "userId"');if(void 0===t)throw new f('Missing required parameter: "phone"');const i={};void 0!==e&&(i.userId=e),void 0!==t&&(i.phone=t);const n=new URL(this.client.config.endpoint+"/account/tokens/phone");return yield this.client.call("post",n,{"content-type":"application/json"},i)}))}createVerification(e){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "url"');const t={};void 0!==e&&(t.url=e);const i=new URL(this.client.config.endpoint+"/account/verification");return yield this.client.call("post",i,{"content-type":"application/json"},t)}))}updateVerification(e,t){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "userId"');if(void 0===t)throw new f('Missing required parameter: "secret"');const i={};void 0!==e&&(i.userId=e),void 0!==t&&(i.secret=t);const n=new URL(this.client.config.endpoint+"/account/verification");return yield this.client.call("put",n,{"content-type":"application/json"},i)}))}createPhoneVerification(){return u(this,void 0,void 0,(function*(){const e=new URL(this.client.config.endpoint+"/account/verification/phone");return yield this.client.call("post",e,{"content-type":"application/json"},{})}))}updatePhoneVerification(e,t){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "userId"');if(void 0===t)throw new f('Missing required parameter: "secret"');const i={};void 0!==e&&(i.userId=e),void 0!==t&&(i.secret=t);const n=new URL(this.client.config.endpoint+"/account/verification/phone");return yield this.client.call("put",n,{"content-type":"application/json"},i)}))}}class v extends p{constructor(e){super(e)}listDocuments(e,t,i){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "databaseId"');if(void 0===t)throw new f('Missing required parameter: "collectionId"');const n="/databases/{databaseId}/collections/{collectionId}/documents".replace("{databaseId}",e).replace("{collectionId}",t),o={};void 0!==i&&(o.queries=i);const a=new URL(this.client.config.endpoint+n);return yield this.client.call("get",a,{"content-type":"application/json"},o)}))}createDocument(e,t,i,n,o){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "databaseId"');if(void 0===t)throw new f('Missing required parameter: "collectionId"');if(void 0===i)throw new f('Missing required parameter: "documentId"');if(void 0===n)throw new f('Missing required parameter: "data"');const a="/databases/{databaseId}/collections/{collectionId}/documents".replace("{databaseId}",e).replace("{collectionId}",t),r={};void 0!==i&&(r.documentId=i),void 0!==n&&(r.data=n),void 0!==o&&(r.permissions=o);const s=new URL(this.client.config.endpoint+a);return yield this.client.call("post",s,{"content-type":"application/json"},r)}))}getDocument(e,t,i,n){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "databaseId"');if(void 0===t)throw new f('Missing required parameter: "collectionId"');if(void 0===i)throw new f('Missing required parameter: "documentId"');const o="/databases/{databaseId}/collections/{collectionId}/documents/{documentId}".replace("{databaseId}",e).replace("{collectionId}",t).replace("{documentId}",i),a={};void 0!==n&&(a.queries=n);const r=new URL(this.client.config.endpoint+o);return yield this.client.call("get",r,{"content-type":"application/json"},a)}))}updateDocument(e,t,i,n,o){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "databaseId"');if(void 0===t)throw new f('Missing required parameter: "collectionId"');if(void 0===i)throw new f('Missing required parameter: "documentId"');const a="/databases/{databaseId}/collections/{collectionId}/documents/{documentId}".replace("{databaseId}",e).replace("{collectionId}",t).replace("{documentId}",i),r={};void 0!==n&&(r.data=n),void 0!==o&&(r.permissions=o);const s=new URL(this.client.config.endpoint+a);return yield this.client.call("patch",s,{"content-type":"application/json"},r)}))}deleteDocument(e,t,i){return u(this,void 0,void 0,(function*(){if(void 0===e)throw new f('Missing required parameter: "databaseId"');if(void 0===t)throw new f('Missing required parameter: "collectionId"');if(void 0===i)throw new f('Missing required parameter: "documentId"');const n="/databases/{databaseId}/collections/{collectionId}/documents/{documentId}".replace("{databaseId}",e).replace("{collectionId}",t).replace("{documentId}",i),o=new URL(this.client.config.endpoint+n);return yield this.client.call("delete",o,{"content-type":"application/json"},{})}))}}class g{}g.read=e=>`read("${e}")`,g.write=e=>`write("${e}")`,g.create=e=>`create("${e}")`,g.update=e=>`update("${e}")`,g.delete=e=>`delete("${e}")`;class y{static custom(e){return e}static unique(i=7){const n=function(e,t,i,n){if("function"==typeof t?e!==t||!n:!t.has(e))throw new TypeError("Cannot read private member from an object whose class did not declare it");return n}(y,e,0,t).call(y);let o="";for(let e=0;e<i;e++)o+=Math.floor(16*Math.random()).toString(16);return n+o}}e=y,t=function(){const e=new Date,t=Math.floor(e.getTime()/1e3),i=e.getMilliseconds();return t.toString(16)+i.toString(16).padStart(5,"0")},function(e){e.Totp="totp"}(i||(i={})),function(e){e.Email="email",e.Phone="phone",e.Totp="totp",e.Recoverycode="recoverycode"}(n||(n={})),function(e){e.Amazon="amazon",e.Apple="apple",e.Auth0="auth0",e.Authentik="authentik",e.Autodesk="autodesk",e.Bitbucket="bitbucket",e.Bitly="bitly",e.Box="box",e.Dailymotion="dailymotion",e.Discord="discord",e.Disqus="disqus",e.Dropbox="dropbox",e.Etsy="etsy",e.Facebook="facebook",e.Github="github",e.Gitlab="gitlab",e.Google="google",e.Linkedin="linkedin",e.Microsoft="microsoft",e.Notion="notion",e.Oidc="oidc",e.Okta="okta",e.Paypal="paypal",e.PaypalSandbox="paypalSandbox",e.Podio="podio",e.Salesforce="salesforce",e.Slack="slack",e.Spotify="spotify",e.Stripe="stripe",e.Tradeshift="tradeshift",e.TradeshiftBox="tradeshiftBox",e.Twitch="twitch",e.Wordpress="wordpress",e.Yahoo="yahoo",e.Yammer="yammer",e.Yandex="yandex",e.Zoho="zoho",e.Zoom="zoom",e.Mock="mock"}(o||(o={})),function(e){e.AvantBrowser="aa",e.AndroidWebViewBeta="an",e.GoogleChrome="ch",e.GoogleChromeIOS="ci",e.GoogleChromeMobile="cm",e.Chromium="cr",e.MozillaFirefox="ff",e.Safari="sf",e.MobileSafari="mf",e.MicrosoftEdge="ps",e.MicrosoftEdgeIOS="oi",e.OperaMini="om",e.Opera="op",e.OperaNext="on"}(a||(a={})),function(e){e.AmericanExpress="amex",e.Argencard="argencard",e.Cabal="cabal",e.Cencosud="cencosud",e.DinersClub="diners",e.Discover="discover",e.Elo="elo",e.Hipercard="hipercard",e.JCB="jcb",e.Mastercard="mastercard",e.Naranja="naranja",e.TarjetaShopping="targeta-shopping",e.UnionChinaPay="union-china-pay",e.Visa="visa",e.MIR="mir",e.Maestro="maestro"}(r||(r={})),function(e){e.Afghanistan="af",e.Angola="ao",e.Albania="al",e.Andorra="ad",e.UnitedArabEmirates="ae",e.Argentina="ar",e.Armenia="am",e.AntiguaAndBarbuda="ag",e.Australia="au",e.Austria="at",e.Azerbaijan="az",e.Burundi="bi",e.Belgium="be",e.Benin="bj",e.BurkinaFaso="bf",e.Bangladesh="bd",e.Bulgaria="bg",e.Bahrain="bh",e.Bahamas="bs",e.BosniaAndHerzegovina="ba",e.Belarus="by",e.Belize="bz",e.Bolivia="bo",e.Brazil="br",e.Barbados="bb",e.BruneiDarussalam="bn",e.Bhutan="bt",e.Botswana="bw",e.CentralAfricanRepublic="cf",e.Canada="ca",e.Switzerland="ch",e.Chile="cl",e.China="cn",e.CoteDIvoire="ci",e.Cameroon="cm",e.DemocraticRepublicOfTheCongo="cd",e.RepublicOfTheCongo="cg",e.Colombia="co",e.Comoros="km",e.CapeVerde="cv",e.CostaRica="cr",e.Cuba="cu",e.Cyprus="cy",e.CzechRepublic="cz",e.Germany="de",e.Djibouti="dj",e.Dominica="dm",e.Denmark="dk",e.DominicanRepublic="do",e.Algeria="dz",e.Ecuador="ec",e.Egypt="eg",e.Eritrea="er",e.Spain="es",e.Estonia="ee",e.Ethiopia="et",e.Finland="fi",e.Fiji="fj",e.France="fr",e.MicronesiaFederatedStatesOf="fm",e.Gabon="ga",e.UnitedKingdom="gb",e.Georgia="ge",e.Ghana="gh",e.Guinea="gn",e.Gambia="gm",e.GuineaBissau="gw",e.EquatorialGuinea="gq",e.Greece="gr",e.Grenada="gd",e.Guatemala="gt",e.Guyana="gy",e.Honduras="hn",e.Croatia="hr",e.Haiti="ht",e.Hungary="hu",e.Indonesia="id",e.India="in",e.Ireland="ie",e.IranIslamicRepublicOf="ir",e.Iraq="iq",e.Iceland="is",e.Israel="il",e.Italy="it",e.Jamaica="jm",e.Jordan="jo",e.Japan="jp",e.Kazakhstan="kz",e.Kenya="ke",e.Kyrgyzstan="kg",e.Cambodia="kh",e.Kiribati="ki",e.SaintKittsAndNevis="kn",e.SouthKorea="kr",e.Kuwait="kw",e.LaoPeopleSDemocraticRepublic="la",e.Lebanon="lb",e.Liberia="lr",e.Libya="ly",e.SaintLucia="lc",e.Liechtenstein="li",e.SriLanka="lk",e.Lesotho="ls",e.Lithuania="lt",e.Luxembourg="lu",e.Latvia="lv",e.Morocco="ma",e.Monaco="mc",e.Moldova="md",e.Madagascar="mg",e.Maldives="mv",e.Mexico="mx",e.MarshallIslands="mh",e.NorthMacedonia="mk",e.Mali="ml",e.Malta="mt",e.Myanmar="mm",e.Montenegro="me",e.Mongolia="mn",e.Mozambique="mz",e.Mauritania="mr",e.Mauritius="mu",e.Malawi="mw",e.Malaysia="my",e.Namibia="na",e.Niger="ne",e.Nigeria="ng",e.Nicaragua="ni",e.Netherlands="nl",e.Norway="no",e.Nepal="np",e.Nauru="nr",e.NewZealand="nz",e.Oman="om",e.Pakistan="pk",e.Panama="pa",e.Peru="pe",e.Philippines="ph",e.Palau="pw",e.PapuaNewGuinea="pg",e.Poland="pl",e.FrenchPolynesia="pf",e.NorthKorea="kp",e.Portugal="pt",e.Paraguay="py",e.Qatar="qa",e.Romania="ro",e.Russia="ru",e.Rwanda="rw",e.SaudiArabia="sa",e.Sudan="sd",e.Senegal="sn",e.Singapore="sg",e.SolomonIslands="sb",e.SierraLeone="sl",e.ElSalvador="sv",e.SanMarino="sm",e.Somalia="so",e.Serbia="rs",e.SouthSudan="ss",e.SaoTomeAndPrincipe="st",e.Suriname="sr",e.Slovakia="sk",e.Slovenia="si",e.Sweden="se",e.Eswatini="sz",e.Seychelles="sc",e.Syria="sy",e.Chad="td",e.Togo="tg",e.Thailand="th",e.Tajikistan="tj",e.Turkmenistan="tm",e.TimorLeste="tl",e.Tonga="to",e.TrinidadAndTobago="tt",e.Tunisia="tn",e.Turkey="tr",e.Tuvalu="tv",e.Tanzania="tz",e.Uganda="ug",e.Ukraine="ua",e.Uruguay="uy",e.UnitedStates="us",e.Uzbekistan="uz",e.VaticanCity="va",e.SaintVincentAndTheGrenadines="vc",e.Venezuela="ve",e.Vietnam="vn",e.Vanuatu="vu",e.Samoa="ws",e.Yemen="ye",e.SouthAfrica="za",e.Zambia="zm",e.Zimbabwe="zw"}(s||(s={})),function(e){e.GET="GET",e.POST="POST",e.PUT="PUT",e.PATCH="PATCH",e.DELETE="DELETE",e.OPTIONS="OPTIONS"}(c||(c={})),function(e){e.Center="center",e.Topleft="top-left",e.Top="top",e.Topright="top-right",e.Left="left",e.Right="right",e.Bottomleft="bottom-left",e.Bottom="bottom",e.Bottomright="bottom-right"}(d||(d={})),function(e){e.Jpg="jpg",e.Jpeg="jpeg",e.Gif="gif",e.Png="png",e.Webp="webp"}(l||(l={}));const b=new w;b.setEndpoint("https://cloud.appwrite.io/v1").setProject("66b20ea5002316ed487f");const M=new v(b),S=new m(b);window.Appwrite={Client:w,Account:m,Databases:v,client:b,account:S,databases:M}})();