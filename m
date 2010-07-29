From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: iptables rule for ovh
Date: Thu, 29 Jul 2010 11:30:32 +0200
Message-ID: <4C514A38.1010702@plouf.fr.eu.org>
References: <4C51450F.7070906@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C51450F.7070906@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Portedaix <portedaix@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

Portedaix a =E9crit :
> Hello,
>=20
> QUESTION - SHORT VERSION :
> Is there a way to have a rule equivalent to the one below which is fo=
r
> kernel 2.6.14 and above,  with a linux kernel 2.6.9 ?
> '#iptables -A INPUT -p udp -m udp --dport 5060 -m string --string
> "Cirpack KeepAlive Packet" --algo bm --to 65535 --source sip.ovh.net =
-j
> DROP'

=46WIW, the 'string' match was available for older kernels in the
patch-o-matic-ng up to patch-o-matic-ng-20050918.


