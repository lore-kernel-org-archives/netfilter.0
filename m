From: Jorch <news-groups@jorch.net>
Subject: Re: Packet marking in user queue with VWMARK
Date: Sun, 14 Oct 2007 22:30:23 +0300
Message-ID: <47126E4F.5070207@jorch.net>
References: <470FBD5A.2070504@jorch.net> <1192313125.14168.6.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1192313125.14168.6.camel@localhost>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Eric Leblond wrote:
> Hi,
>=20
> Le vendredi 12 octobre 2007 =E0 21:30 +0300, Jorch a =E9crit :
>> Hi,
>>
>> Can somebody please give me an example how to mark & match packets
>> with vwmark and iptables in user queue.
>>
>> I have patched the kernel (2.6.18) and iptables (1.3.8) to support
>> vwmark. Both progs compiles and installs ok and queue works normaly =
with
>> ipq_set_verdict but not with ipq_set_vwmark.

Got vwmark workin after i noticed i had bad test scenario to test the p=
rog.
System works with marking and verdicts but when i try to inject modifie=
d packet
back to queue, queue seems to drop packet every time(any ideas??)

> Please switch your program to work with libnetfilter_queue. It has
> default support for packet marking.

If i would find some kind of installation/usage manual from somewhere i=
t would
be great!! I have tried to get libnetfilter_queue work for several hour=
s now
and no success. libnfnetlink 0.0.16 and libnetfilter_queue 0.0.13 compi=
les ok
against kernel and installs ok.

The test program (nfqnl_test) wich comes in libnetfilter_queue packet, =
can
open library handle but unbinding or binding causes
"NFNETLINK answers: Invalid argument" message.

BTW: I got many hits to netfilter.org/pipermail/... When i was trying t=
o get
more information of the libnetfilter_queue, i noticed that there are ma=
n page
for libnetfilter_queue in address
http://lists.netfilter.org/pipermail/netfilter-devel/2006-February/0234=
88.html
but for me: Forbidden, You don't have permission...

> A code example can be found at :
> http://software.inl.fr/trac/trac.cgi/browser/mirror/edenwall/nufw/tru=
nk/nufw/src/nufw/authsrv.c
>=20
> BR,

Regs.
-jori

