From: Jason Opperisano <opie@817west.com>
Subject: Re: state NEW
Date: Fri, 19 Nov 2004 08:37:52 -0500
Message-ID: <1100871472.3874.20.camel@hubcap.ljm.dom>
References: <D3DD55FDB74AD511BA5100500416368053EB16@ORION>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <D3DD55FDB74AD511BA5100500416368053EB16@ORION>
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

On Fri, 2004-11-19 at 04:31, Jochen Vogel wrote:
> hi,
> 
> i have the following forwarding rule
> 
> $IPT -A FORWARD -i $INT -o $EXT -m state --state NEW,ESTABLISHED,RELATED -j
> QUEUE
> $IPT -A FORWARD -i $EXT -o $INT -m state --state ESTABLISHED,RELATED     -j
> ACCEPT
> 
> if i send an ACK with hping from INT to EXT it reaches the target system
> 
> if i do
> 
> $IPT -A FORWARD -i $INT -o $EXT -m state --state NEW -j ACCEPTLOG
> $IPT -A FORWARD -i $EXT -o $INT -m state --state ESTABLISHED,RELATED-j
> ACCEPT
> 
> i can see the following
> 
> Nov 19 12:05:20 snolin kernel: ACPT IN=eth0 OUT=ppp0 SRC=1.1.1.1 DST=2.2.2.2
> LEN=40 TOS=0x00 PREC=0x00 TTL=63 ID=12368 PROTO=TCP SPT=2618 DPT=63
> WINDOW=512 RES=0x00 ACK URGP=0
> 
> did i have a false understanding from NEW or whats wrong

you have a false understanding of NEW.

NEW == packet does not match an entry in the conntrack table.

there is a common misconception that "-m state --state NEW" performs
some sort of intelligent enforcement on valid flag combinations (i.e
only matches TCP SYN packets), which is simply not true.

if you want this type of enforcement, write your rules like:

  iptables -A FORWARD -p tcp --syn -m state --state NEW [ ... ]

which enforces that NEW packets must be SYN packets.

-j

--
"If something is to hard to do, then it's not worth doing."
	--The Simpsons


