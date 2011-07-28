From: Kumar Swamy <kswamy@barracuda.com>
Subject: RE: iptables and virtual NIC
Date: Thu, 28 Jul 2011 03:05:11 -0700
Message-ID: <65C6A498BB5BF245BD7195255041FA2E04C751C4A5@bn-scl-be03.Cudanet.local>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello folks,=20

I am a newbie to iptables and experimenting some stuff.=A0 So please ex=
cuse me, if this has already been discussed.

I have a linux gateway which has a physical interface (eth0 ) and multi=
ple virtual interfaces ( eth0:1, eth0:2), each has dynamic IP configure=
d.
I want to create an iptables rule for =A0IP masquerading on eth0 , but =
packets going out on other interfaces should be left untouched. Is this=
 possible?=20

I tried=20
-A POSTROUTING -o eth0 -j MASQUERADE
But it seems packet going out on virtual NICs ( aliases) are also hitti=
ng this rule.=20
Is there any way to solve this problem without using SNAT? Since I have=
 IP address configured dynamically, there is no easy way to do SNAT.=20

Thanks


'Like' us on Facebook for exclusive content and other resources on all =
Barracuda Networks solutions.=0D
Visit http://barracudanetworks.com/facebook=0D
=0D

