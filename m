From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: NAT and MTU issues
Date: Mon, 22 Sep 2003 17:03:36 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.58.0309221657290.9794@tux.rsn.bth.se>
References: <1063985328.28941.37.camel@angua.localnet> 
 <1064084662.28506.42.camel@tux.rsn.bth.se>  <1064224385.6070.8.camel@angua.localnet>
  <Pine.LNX.4.58.0309221358460.9262@tux.rsn.bth.se> <1064242324.6070.77.camel@angua.localnet>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="801277839-736606434-1064243016=:9794"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1064242324.6070.77.camel@angua.localnet>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Nigel Metheringham <Nigel.Metheringham@dev.InTechnology.co.uk>
Cc: Netfilter <netfilter@lists.netfilter.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
  Send mail to mime@docserver.cac.washington.edu for more info.

--801277839-736606434-1064243016=:9794
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 22 Sep 2003, Nigel Metheringham wrote:

> On Mon, 2003-09-22 at 13:00, Martin Josefsson wrote:
> > Could you please apply the attached patch and reproduce it again?
> > It's just a small patch that enables a little debugging for this.
>
> Very odd - I am seeing ICMPs generated:-
> # /usr/sbin/tcpdump -n -i eth0 icmp
> tcpdump: listening on eth0
> 15:26:12.146557 192.168.50.119 > 172.16.28.33: icmp: 10.0.2.2
> unreachable - need to frag (mtu 1450) [tos 0xc0]
>
> but no extra chatter in dmesg despite ensuring dmesg -n is turned up.
> Checking the module object file shows the extra log messages in there,
> so its not me doing something completely silly.

Ok, no wonder that the ipaddress isn't rewritten to the correct one, the
rewriting is never called. Now lets find out if the loop is run at all.
I forgot to enable that debug-statement in the previous patch, sorry.
A new patch is applied, reverse the old one and apply this and retest.

> Putting a
>   iptables -t mangle -A FORWARD -p tcp --syn -j TCPMSS \
> 	--clamp-mss-to-pmtu
>
> in appears to fix things for me.

For tcp... it avoids the problem, but we still need to fix this :)

/Martin
--801277839-736606434-1064243016=:9794
Content-Type: TEXT/PLAIN; charset=US-ASCII; name="nat-icmp-error-debug2.patch"
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.58.0309221703360.9794@tux.rsn.bth.se>
Content-Description: 
Content-Disposition: attachment; filename="nat-icmp-error-debug2.patch"

LS0tIGxpbnV4LTIuNC4yMS9uZXQvaXB2NC9uZXRmaWx0ZXIvaXBfbmF0X2Nv
cmUuYwkyMDAzLTA2LTE0IDE2OjQ2OjA5LjAwMDAwMDAwMCArMDIwMA0KKysr
IGxpbnV4LTIuNC4yMS50ZXN0L25ldC9pcHY0L25ldGZpbHRlci9pcF9uYXRf
Y29yZS5jCTIwMDMtMDktMjIgMTY6NTk6MDEuMDAwMDAwMDAwICswMjAwDQpA
QCAtOTAxLDcgKzkwMSw3IEBADQogDQogCVJFQURfTE9DSygmaXBfbmF0X2xv
Y2spOw0KIAlmb3IgKGkgPSAwOyBpIDwgaW5mby0+bnVtX21hbmlwczsgaSsr
KSB7DQotCQlERUJVR1AoImljbXBfcmVwbHk6IG1hbmlwICV1IGRpciAlcyBo
b29rICV1XG4iLA0KKwkJcHJpbnRrKCJpY21wX3JlcGx5OiBtYW5pcCAldSBk
aXIgJXMgaG9vayAldVxuIiwNCiAJCSAgICAgICBpLCBpbmZvLT5tYW5pcHNb
aV0uZGlyZWN0aW9uID09IElQX0NUX0RJUl9PUklHSU5BTCA/DQogCQkgICAg
ICAgIk9SSUciIDogIlJFUExZIiwgaW5mby0+bWFuaXBzW2ldLmhvb2tudW0p
Ow0KIA0KQEAgLTkxMyw3ICs5MTMsNyBAQA0KIAkJICAgd2hlcmUgd2Ugd291
bGQgbm9ybWFsbHkgYXBwbHkgYSBkc3QgbWFuaXAsIHdlIGFwcGx5DQogCQkg
ICBhIHNyYywgYW5kIHZpY2UgdmVyc2EuICovDQogCQlpZiAoaW5mby0+bWFu
aXBzW2ldLmhvb2tudW0gPT0gaG9va251bSkgew0KLQkJCURFQlVHUCgiaWNt
cF9yZXBseTogaW5uZXIgJXMgLT4gJXUuJXUuJXUuJXUgJXVcbiIsDQorCQkJ
cHJpbnRrKCJpY21wX3JlcGx5OiBpbm5lciAlcyAtPiAldS4ldS4ldS4ldSAl
dVxuIiwNCiAJCQkgICAgICAgaW5mby0+bWFuaXBzW2ldLm1hbmlwdHlwZSA9
PSBJUF9OQVRfTUFOSVBfU1JDDQogCQkJICAgICAgID8gIkRTVCIgOiAiU1JD
IiwNCiAJCQkgICAgICAgTklQUVVBRChpbmZvLT5tYW5pcHNbaV0ubWFuaXAu
aXApLA0KQEAgLTkyOCw3ICs5MjgsNyBAQA0KIA0KIAkJCS8qIFVzZSBtYXBw
aW5nIHRvIG1hcCBvdXRlciBwYWNrZXQ6IDAgZ2l2ZSBubw0KICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHBlci1wcm90byBtYXBwaW5nICovDQotCQkJ
REVCVUdQKCJpY21wX3JlcGx5OiBvdXRlciAlcyAtPiAldS4ldS4ldS4ldVxu
IiwNCisJCQlwcmludGsoImljbXBfcmVwbHk6IG91dGVyICVzIC0+ICV1LiV1
LiV1LiV1XG4iLA0KIAkJCSAgICAgICBpbmZvLT5tYW5pcHNbaV0ubWFuaXB0
eXBlID09IElQX05BVF9NQU5JUF9TUkMNCiAJCQkgICAgICAgPyAiU1JDIiA6
ICJEU1QiLA0KIAkJCSAgICAgICBOSVBRVUFEKGluZm8tPm1hbmlwc1tpXS5t
YW5pcC5pcCkpOw0K

--801277839-736606434-1064243016=:9794--

