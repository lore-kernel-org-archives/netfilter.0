From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: NAT and MTU issues
Date: Mon, 22 Sep 2003 14:00:56 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.58.0309221358460.9262@tux.rsn.bth.se>
References: <1063985328.28941.37.camel@angua.localnet> 
 <1064084662.28506.42.camel@tux.rsn.bth.se> <1064224385.6070.8.camel@angua.localnet>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="801277839-682039023-1064232002=:9262"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1064224385.6070.8.camel@angua.localnet>
Content-ID: <Pine.LNX.4.58.0309221400150.9273@tux.rsn.bth.se>
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

--801277839-682039023-1064232002=:9262
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII
Content-ID: <Pine.LNX.4.58.0309221400151.9273@tux.rsn.bth.se>

On Mon, 22 Sep 2003, Nigel Metheringham wrote:

> > Is the NAT-rules on the machine that has the tunnel? If they are that
> > might explain a thing or two since the code looks correct for the case
> > where the packets pass through and another machine down the pipe sends
> > the icmp message back.
>
> Yes - all of this is on one machine.
> One interface has the effective  listening port on it, another interface
> of the same box has the ipsec0 interface layered on top.

Could you please apply the attached patch and reproduce it again?
It's just a small patch that enables a little debugging for this.

The debugmessages comes out through the normal kernellog, run 'dmesg' and
see what it says. It's the lines beginning with "icmp_reply:"

/Martin
--801277839-682039023-1064232002=:9262
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII; NAME="nat-icmp-error-debug.patch"
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.58.0309221400020.9262@tux.rsn.bth.se>
Content-Description: 
Content-Disposition: ATTACHMENT; FILENAME="nat-icmp-error-debug.patch"

LS0tIGxpbnV4LTIuNC4yMS9uZXQvaXB2NC9uZXRmaWx0ZXIvaXBfbmF0X2Nv
cmUuYwkyMDAzLTA2LTE0IDE2OjQ2OjA5LjAwMDAwMDAwMCArMDIwMA0KKysr
IGxpbnV4LTIuNC4yMS50ZXN0L25ldC9pcHY0L25ldGZpbHRlci9pcF9uYXRf
Y29yZS5jCTIwMDMtMDktMjAgMjA6NTk6MTAuMDAwMDAwMDAwICswMjAwDQpA
QCAtOTEzLDcgKzkxMyw3IEBADQogCQkgICB3aGVyZSB3ZSB3b3VsZCBub3Jt
YWxseSBhcHBseSBhIGRzdCBtYW5pcCwgd2UgYXBwbHkNCiAJCSAgIGEgc3Jj
LCBhbmQgdmljZSB2ZXJzYS4gKi8NCiAJCWlmIChpbmZvLT5tYW5pcHNbaV0u
aG9va251bSA9PSBob29rbnVtKSB7DQotCQkJREVCVUdQKCJpY21wX3JlcGx5
OiBpbm5lciAlcyAtPiAldS4ldS4ldS4ldSAldVxuIiwNCisJCQlwcmludGso
ImljbXBfcmVwbHk6IGlubmVyICVzIC0+ICV1LiV1LiV1LiV1ICV1XG4iLA0K
IAkJCSAgICAgICBpbmZvLT5tYW5pcHNbaV0ubWFuaXB0eXBlID09IElQX05B
VF9NQU5JUF9TUkMNCiAJCQkgICAgICAgPyAiRFNUIiA6ICJTUkMiLA0KIAkJ
CSAgICAgICBOSVBRVUFEKGluZm8tPm1hbmlwc1tpXS5tYW5pcC5pcCksDQpA
QCAtOTI4LDcgKzkyOCw3IEBADQogDQogCQkJLyogVXNlIG1hcHBpbmcgdG8g
bWFwIG91dGVyIHBhY2tldDogMCBnaXZlIG5vDQogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGVyLXByb3RvIG1hcHBpbmcgKi8NCi0JCQlERUJVR1Ao
ImljbXBfcmVwbHk6IG91dGVyICVzIC0+ICV1LiV1LiV1LiV1XG4iLA0KKwkJ
CXByaW50aygiaWNtcF9yZXBseTogb3V0ZXIgJXMgLT4gJXUuJXUuJXUuJXVc
biIsDQogCQkJICAgICAgIGluZm8tPm1hbmlwc1tpXS5tYW5pcHR5cGUgPT0g
SVBfTkFUX01BTklQX1NSQw0KIAkJCSAgICAgICA/ICJTUkMiIDogIkRTVCIs
DQogCQkJICAgICAgIE5JUFFVQUQoaW5mby0+bWFuaXBzW2ldLm1hbmlwLmlw
KSk7DQo=

--801277839-682039023-1064232002=:9262--

