From: Petr Pisar <petr.pisar@atlas.cz>
Subject: Re: Not NATed packets
Date: Sat, 29 Apr 2006 21:15:23 +0200
Message-ID: <e30e0b$284$1@sea.gmane.org>
References: <Pine.LNX.4.64N.0604231700330.6204@tank.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.64N.0604231700330.6204@tank.eu.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

lukas@tank.eu.org wrote:
> NAT configuration is simple but some packets are not NATed - on my 
> public interface packets with source address of my internal (NATed) 
> network appears and i have no clue what is wrong.
> 
> tcpdump -i eth0 -n -vvv |grep 10.10.10
> 16:30:39.015880 IP (tos 0x0, ttl 127, id 28594, offset 0, flags [DF], 
> proto: TCP (6), length: 40) 10.10.10.104.3689 > 83.29.48.50.6881: F, 
> cksum 0x1623 (correct), 3885889894:3885889894(0) ack 3151418643 win 65535

So, I have one workaround. These magic packets are INVALID from point of 
state module's view. Therefore this rules

   5   200 LOG        all  --  *      ppp0    0.0.0.0/0 
0.0.0.0/0           state INVALID LOG flags 2 level 4 prefix `FWD-INVALID'
     1    40 REJECT     all  --  *      ppp0    0.0.0.0/0 
0.0.0.0/0           state INVALID reject-with icmp-admin-prohibited

where ppp0 is nating device can log and discard this packets.

I'm not sure if any INVALID packet can also be considered as a health 
packet. Can you see any false positivities? (I know, that these packets 
can occure, when interface with dynamicly assignes address changes its 
IP address during established TCP connection, but then we are not able 
to repair this state [i.e. close connection on both sides with proper 
source IP] either. Therefore we can consider following packets as realy 
invalid.)

-- Petr


