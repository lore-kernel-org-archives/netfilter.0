From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: layer7 problem
Date: Wed, 24 Aug 2005 16:32:03 +0200
Message-ID: <430C84E3.2000103@mnemon.de>
References: <430BC558.8000406@telefonica.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <430BC558.8000406@telefonica.net>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Antonio P=E9rez schrieb:
> Hello,
> I want to use layer7 in my linux box. I have the 2.6.12.5 kerner versio=
n
> and the 1.3.3 iptables version. I patched the kernel and the iptables
> with kernel-2.6.11-layer7-1.4.patch, linux-2.6.9-imq1.diff,
> iptables-1.3.0-imq1.diff and iptables-layer7-1.4.patch.
> When i run:
> iptables -t mangle -A POSTROUTING -m layer7 --l7proto http -j MARK
> --set-mark 3
> no error show, but when i do:
> iptables -t mangle -L -v
> pkts bytes target     prot opt in     out     source             =20
> destination
>    0     0 MARK       all  --  any    any     anywhere           =20
> anywhere            LAYER7 l7proto http MARK set 0x3
> the packets marked always is 0.

So, as we now - only a few posts later - know, that there are no other
rules in the way, we can start looking elsewhere ;)

Hmm, only suggestions available (I have L7 on 2.4.31 and 1.3.2 -
everything is fine). Maybe there is a version mismatch. The kernel patch
is for 2.6.11, whilst you use 2.6.12. Try with kernel 2.6.11 and see if
it works. I will conquer my lazyness and test wether 1.3.3 works with
L7. I'll tell you tomorrow.

Have a nice time,

Joerg

