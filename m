From: "Gene Dellinger" <gene@poh.com>
Subject: RE: FORWARD Chain Question
Date: Tue, 13 Dec 2005 09:21:35 -1000
Message-ID: <BOEKIIIKCIBKDMDMHHLLGEJODFAA.gene@poh.com>
References: <439EA2DD.2030500@mnemon.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <439EA2DD.2030500@mnemon.de>
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
To: =?iso-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>, netfilter@lists.netfilter.org

Thanks to all,
All the information provided cleared things up for me.


Gene D.

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of J=F6rg Harmuth
Sent: Tuesday, December 13, 2005 12:31 AM
To: netfilter@lists.netfilter.org
Subject: Re: FORWARD Chain Question


Gene Dellinger schrieb:
> To All:
> I got some helpful information, thanks to those who responded, I am sti=
ll
a
> bit fuzzy though.
> A packet coming in ETH0 destined for a system connected to ETH1, will t=
hat
> packet begin in the PREROUTING
> chain on ETH1(sample 1) and then out or go to the FORWARD chain(sample =
2)
> and then out.
>
> ETH0:PREROUTING---->FORWARD---->POSTROUTING---->OUT
>          |	           |            |
>        INPUT  	     |         OUTPUT
>          |	          \|/	      |
>       Local Process    |         Local Process

As Jim already said, chain traversal isn't bound to interfaces by
itself, but you can write rules that are related to a certain interface.
If you take this picture (stolen from you and a little bit modified):

   IN-->PREROUTING---->FORWARD---->POSTROUTING---->OUT
          |	                        |
        INPUT  	                      OUTPUT
          |                             |
          +------->Local Process------->+

then you have a simplified picture of what's going on (amongst others,
nat and mangle table are missing and the optional raw table as well).
Packets go through the above picture regardless of the interface (unless
as Jim also said, you specify -i or -o).

HTH,

Joerg


