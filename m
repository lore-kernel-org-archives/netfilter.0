From: "jywang" <jywang@cnic.cn>
Subject: how to use sk_buff in netfilter
Date: Thu, 27 Oct 2005 15:22:05 +0800
Message-ID: <00d501c5dac7$22306070$060ae29f@javaboy>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

SGksYWxsDQoNCiAgICBpIHdhbnQgdG8gbWFrZSBzb21lIGNoYW5nZSBvbiBpcCBwYWNrZXQgaW4g
TkZfSVBfUFJFX1JPVVRJTkcNCmhvb2suIGJ1dCBpIGRvbid0IGtub3cgd2hhdCBpcyB0aGUgZXhh
Y3RseSBtZWFucyBvZiBlYWNoIHBpZWNlIGluDQpzdHJ1Y3Qgc2tfYnVmZi4NCg0KICAgIGkga25v
dyBob3cgdG8gZ2VuZXJhdGUgYSBwYWNrZXQsIGJ1dCBob3cgdG8gZ2VuZXJhdGUgYSBjb3JyZWN0
DQpza19idWZmIG9mIHRoZSBwYWNrZXQgaXMgYSBkaWZmaWN1bHQgZm9yIG1lLCBhbmQgaG93IHRv
IHB1dCB0aGUNCnNrX2J1ZmYgdG8gdGhlIHN5c3RlbSBpcyBhIHByb2JsZW0gdG9vLg0KDQogICAg
SG93PyBvciB3aGVyZSB0byBnZXQgbW9yZSBkZXRhaWxzIG9mIHRoYXQ/IGlzIHRoZXJlIGEgZXhh
bXBsZQ0KcHJvZ3JhbSB0byBsZWFybj8NCg0KICAgIHNvIGdyZWF0IGFwcHJlY2lhdGlvbiB0byB5
b3UgYWxsLg0KDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tDQogTmFtZTogICAgICAgamlueWkgd2FuZw0KIFBob25lOiAgICAgICg4Ni0xMCkg
NTg4MS0yMzI1DQogRGl2aXNpb246ICAgUiZELENvbXB1dGVyIE5ldHdvcmsgSW5mb3JtYXRpb24g
Q2VudGVyLA0KICAgICAgICAgICAgIENoaW5lc2UgQWNhZGVteSBvZiBTY2llbmNlcw0KIEFkZHJl
c3M6ICAgIDQsNHRoIFNvdXRoIFN0cmVldCwgWmhvbmdndWFuY3VuLCANCiAgICAgICAgICAgICBI
YWlkaWFuIERpc3RyaWN0LCBCZWlqaW5nLCBDaGluYQ0KIFppcCBjb2RlOiAgIDEwMDA4MA0KIEVt
YWlsOiAgICAgIGp5d2FuZ0BjbmljLmNu



