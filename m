From: Jason Opperisano <opie@817west.com>
Subject: Re: Cleanest way to deal with loopback interface?
Date: Wed, 13 Apr 2005 17:13:49 -0400
Message-ID: <20050413211349.GA31336@bender.817west.com>
References: <1113425449.3544.177.camel@seberino.spawar.navy.mil>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1113425449.3544.177.camel@seberino.spawar.navy.mil>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Apr 13, 2005 at 01:50:50PM -0700, Christian Seberino wrote:
> I want first rules that packets encounter to be my DROP_CHAIN
> that weeds out suspicious packets including packets addressed
> to and from 127.0.0.1 (loopback):
> 
> # -------------------------------------------------------------
> $IPTABLES -t filter -P INPUT   DROP
> $IPTABLES -t filter -P OUTPUT  DROP
> $IPTABLES -t filter -P FORWARD DROP
>  
> $IPTABLES -t filter -A INPUT   -j DROP_CHAIN
> $IPTABLES -t filter -A OUTPUT  -j DROP_CHAIN
> $IPTABLES -t filter -A FORWARD -j DROP_CHAIN
>   
> $IPTABLES -t filter -A INPUT  -i $LOOPBACK_INTERFACE -j ACCEPT
> $IPTABLES -t filter -A OUTPUT -o $LOOPBACK_INTERFACE -j ACCEPT
> # ------------------------------------------------------------
> 
> How can I make DROP_CHAIN drop bogus 127.0.0.1 addressed packets
> but still allow **legitimate** loopback traffic?

allow traffic on the loopback interface unconditionally,  and allow the
linux routing code 'martian' checks to drop 127.0.0.0/8 packets received
'on the wire' as it does by default.

-j

--
"Auctioner: Our first item is a pair of panties confiscated from
 a prostitute.
 Quagmire: Fifty bucks.
 Auctioner: She had nine STDs.
 Quagmire: Forty-five bucks.
 Auctioner: And when we caught her she wet herself.
 Quagmire: Fifty bucks."
        --Family Guy

