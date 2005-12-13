From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: FORWARD Chain Question
Date: Tue, 13 Dec 2005 11:30:53 +0100
Message-ID: <439EA2DD.2030500@mnemon.de>
References: <BOEKIIIKCIBKDMDMHHLLAEHGDFAA.gene@poh.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BOEKIIIKCIBKDMDMHHLLAEHGDFAA.gene@poh.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Gene Dellinger schrieb:
> To All:
> I got some helpful information, thanks to those who responded, I am still a
> bit fuzzy though.
> A packet coming in ETH0 destined for a system connected to ETH1, will that
> packet begin in the PREROUTING
> chain on ETH1(sample 1) and then out or go to the FORWARD chain(sample 2)
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

