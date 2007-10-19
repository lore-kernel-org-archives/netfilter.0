From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <gaspar.lajos@whb.hu>
Subject: Re: Packet duplication
Date: Fri, 19 Oct 2007 11:25:43 +0200
Message-ID: <47187817.4070005@whb.hu>
References: <47184C6D.40202@netsys.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47184C6D.40202@netsys.co.za>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Netfilter list <netfilter@vger.kernel.org>

Tiaan Wessels =EDrta:
> Hi,
> Not sure there is any life on this list but in case someone picks me=20
> up on netfilter user SETI here goes:
There is life !!! :D
> How do I go about duplicating a UDP packet arriving at a machine.=20
> Essentially I want to have it go to its original recipient but to=20
> another new one also.
> -j ROUTE --tee seems not to be supported anymore.
=46alse... It is supported but you need the patch-o-matic(-ng) stuff...

       --tee  Make a copy of the packet, and route that copy to the
given destination. For the original, uncopied packet, behave like a
non-terminating tar-
              get and continue traversing the rules.  Not valid in
combination with `--iif' or `--continue'

> Thanks


Swifty




