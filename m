From: Jason Opperisano <opie@817west.com>
Subject: Re: IP sent an invalid ICMP type to a broadcast and
	icmp_ignore_bogus_error_responses
Date: Mon, 9 May 2005 11:37:30 -0400
Message-ID: <20050509153730.GA5268@bender.817west.com>
References: <20050507212628.6fd43793@mikejones.ghb.fh-furtwangen.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050507212628.6fd43793@mikejones.ghb.fh-furtwangen.de>
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

On Sat, May 07, 2005 at 09:26:28PM +0200, Sebastian Siewior wrote:
> Hallo,
> 
> My kernel complaints himself every second with:
> 
> kernel: XX.XX.XX.XX sent an invalid ICMP type 3, code 1 error to a
> broadcast: 0.0.0.0 on lo
> 
> In the meantime I supressed the messages via  
> 
> echo 1 > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses". 
> 
> Other people solved this problem with 
> 
> iptables -A INPUT -i lo -j ACCEPT
> 
> but it won't work here. Does someone have an idea how I could find out
> where the packets are comming from?

ICMP Type 3 Code 1 == Destination Unreachable, Host Unreachable

seems odd that you would be sending/receiving those on lo.  i suppose
they could be caused by not having rules that allow traffic on loopback:

  iptables -A INPUT -i lo -j ACCEPT
  iptables -A OUTPUT -o lo -j ACCEPT

but you say these don't fix the problem?

you may be able to pick out an offending packet by watching:

  tcpdump -n -nn -p -i lo -s 1500 icmp

as a proper ICMP 3/1 packet should have the original packet header
in-tact as the data of the packet.

-j

--
"Peter: Make like Siamese twins and split... and then one of you die."
        --Family Guy

