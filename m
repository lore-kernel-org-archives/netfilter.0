From: Maxim Shpakov <maxim@osetia.org>
Subject: Re: IP traffic/accounting  per user
Date: Sun, 20 Feb 2005 12:07:23 +0200
Message-ID: <907867817.20050220120723@osetia.org>
References: <20050214110926.99202.qmail@web53709.mail.yahoo.com>
	<16210062593.20050214144250@osetia.org>
	<1108873119.42180f9f66ae7@mail.gnvfc.net>
Reply-To: Maxim Shpakov <maxim@osetia.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="----------C7FD1573FFD8F5A"
In-Reply-To: <1108873119.42180f9f66ae7@mail.gnvfc.net>
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
To: spdesai@gnvfc.net
Cc: netfilter@lists.netfilter.org

------------C7FD1573FFD8F5A
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello spdesai,

Sunday, February 20, 2005, 6:18:39 AM, you wrote:

sgn> Hello ..

sgn> I have installed NetAMS on my IPTABLE server to monitor per IP traffic and
sgn> based on that accounting them..

sgn> It generating html file regurely but it is not updated...i.e it show Zero
sgn> In/Out traffic for hour/month/week etc.

sgn> when i run netams it show below message at the end.
  
sgn> NeTAMS is now operational, 20.02.2005 09:54:31
sgn> Shutdown signal received at 20.02.2005 09:54:31
sgn> NeTAMS exiting at 20.02.2005 09:54:31

sgn> Pl. help me for proper configuration..

you need to setup proper data-source

I use netflow as data-source, but netams allows to use iptables
(ULOG or IPQ) for d-s.

you must have this lines in yours netams.cfg

service data-source 1
type ip-traffic
source ulog 1

configure iptables to make it route traffic to netams.
iptables -A FORWARD -j ULOG --ulog-nlgroup 1

Read documentation.. at http://www.netams.com/doc
english version is totally incomplete :( only russian version is
availible.
but you can try to load it via WWW translate service.
http://www.online-translator.com/  (register to get access to
computer-biased dictionaries)

I've attached simple Netams cfg file from the documentation. It uses
libpcap (ethernet in promisc mode) as data-source and mysql as
storage.

-- 
Best regards,
 Maxim           mailto:maxim@osetia.org
------------C7FD1573FFD8F5A
Content-Type: application/octet-stream; name="netams.cfg"
Content-transfer-encoding: base64
Content-Disposition: attachment; filename="netams.cfg"

I05lVEFNUyB2ZXJzaW9uIDMuMSgxMjA1LjQwOCkgY29tcGlsZWQgYnkgcm9vdEBhdm0NCiNj
b25maWd1cmF0aW9uIGJ1aWx0IFRodSBBdWcgIDggMDk6MDM6NTMgMjAwMg0KI2JlZ2luDQoj
Z2xvYmFsIHZhcmlhYmxlcyBjb25maWd1cmF0aW9uDQpkZWJ1ZyBub25lDQp1c2VyIG5hbWUg
YWRtaW4gcmVhbC1uYW1lIEFkbWluIHBhc3N3b3JkIGFhYSBlbWFpbCByb290QGxvY2FsaG9z
dCBwZXJtaXQgYWxsDQoNCiNzZXJ2aWNlcyBjb25maWd1cmF0aW9uDQoNCnNlcnZpY2Ugc2Vy
dmVyIDANCmxvZ2luIGxvY2FsDQpsaXN0ZW4gMjAwMDENCm1heC1jb25uIDYNCg0Kc2Vydmlj
ZSBwcm9jZXNzb3IgMA0KbG9va3VwLWRlbGF5IDYwDQpmbG93LWxpZmV0aW1lIDE4MA0KcG9s
aWN5IG5hbWUgaXAgdGFyZ2V0IHByb3RvIGlwICAgICAgICAgIA0KcG9saWN5IG5hbWUgd3d3
IHRhcmdldCBwcm90byB0Y3AgcG9ydHMgODAgODEgODA4MCAzMTI4DQpwb2xpY3kgbmFtZSBt
YWlsIHRhcmdldCBwcm90byB0Y3AgcG9ydHMgMjUgMTEwICAgICAgICAgDQpyZXN0cmljdCBh
bGwgcGFzcyBsb2NhbCBwYXNzDQp1bml0IGdyb3VwIG5hbWUgQ0xJRU5UUyBhY2N0LXBvbGlj
eSBpcCB3d3cgbWFpbA0KdW5pdCBob3N0IG5hbWUgc2VydmVyIGlwIDE5Mi4xNjguMC4xIGFj
Y3QtcG9saWN5IGlwIHd3dyBtYWlsDQp1bml0IHVzZXIgbmFtZSBjbGllbnQxIGlwIDE5Mi4x
NjguMC4xMCBwYXJlbnQgQ0xJRU5UUyANCgllbWFpbCBjbGllbnQxQGRvbWFpbi5ydSBhY2N0
LXBvbGljeSBpcCB3d3cgbWFpbA0KdW5pdCBuZXQgbmFtZSBMQU4gaXAgMTkyLjE2OC4wLjAv
MjQgYWNjdC1wb2xpY3kgaXAgd3d3IG1haWwNCnN0b3JhZ2UgMSBhbGwNCg0Kc2VydmljZSBz
dG9yYWdlIDENCnR5cGUgbXlzcWwNCg0Kc2VydmljZSBkYXRhLXNvdXJjZSAxDQp0eXBlIGxp
YnBjYXANCnNvdXJjZSB4bDENCnJ1bGUgMTEgImlwIg0KDQpzZXJ2aWNlIHF1b3RhIDANCnBv
bGljeSBpcA0Kbm90aWZ5IHNvZnQgPG93bmVyPiANCm5vdGlmeSBoYXJkIDxvd25lcj4gYWRt
aW4NCm5vdGlmeSByZXR1cm4gPG93bmVyPg0Kc3RvcmFnZSAyDQoNCnNlcnZpY2UgYWxlcnRl
ciAwDQpyZXBvcnQgb2lkIDA2MTAwIG5hbWUgcmVwMSB0eXBlIHRyYWZmaWMgcGVyaW9kIGRh
eSBkZXRhaWwgc2ltcGxlDQpzbXRwLXNlcnZlciBsb2NhbGhvc3QNCg0Kc2VydmljZSBodG1s
IDANCnBhdGggL3Vzci9sb2NhbC93d3cvc3RhdA0KbGFuZ3VhZ2UgZW4NCnJ1biA1bWluDQpo
dGFjY2VzcyB5ZXMNCmNsaWVudC1wYWdlcyBhbGwNCnVybCBodHRwOi8vMTkyLjE2OC4wLjEv
c3RhdC8=

------------C7FD1573FFD8F5A--



