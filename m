From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Re: Redirect outgoing traffic
Date: Thu, 27 Sep 2007 09:40:28 +0200
Message-ID: <46FB5E6C.8010407@freemail.hu>
References: <1108.24.71.32.203.1190422248.squirrel@webmail.sd73.bc.ca> <46F84FEA.7010008@rtij.nl> <200709261646.17702.dmonty@sd73.bc.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200709261646.17702.dmonty@sd73.bc.ca>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Dean Montgomery <dmonty@sd73.bc.ca>, Netfilter list <netfilter@vger.kernel.org>

Dean Montgomery =EDrta:
> Only problem with this is that I want the rule on the local workstati=
on and=20
> not on the nat box.  DNAT table is not picked up by local traffic lea=
ving the=20
> workstation.
>
> So this does not work...
> iptables -t nat -A PREROUTING -p tcp -m tcp --dport 80 -j=20
> DNAT --to-destination :48888
>
>  =20
But int the OUTPUT chain....
iptables -t nat -A OUTPUT -p tcp -m tcp --dport 80 -j DNAT ....

Swifty


