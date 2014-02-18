From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: Some packets flagged INVALID
Date: Tue, 18 Feb 2014 17:26:31 -0500
Message-ID: <201402181726.31992.neal.p.murphy@alum.wpi.edu>
References: <20140218215218.194660@gmx.com>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20140218215218.194660@gmx.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Tuesday, February 18, 2014 04:52:18 PM Bob Sauvage wrote:
> Hi *,
> 
> I'm running a high volume web application that uses Apache 2.2.15 mod_proxy
> to reverse proxy content from apache to JBoss 6.
> 
> I found 503 errors which happen sporadically throughout the day on random
> requests (perhaps 1/1000 of daily requests).
> 
> After investigations, I noticed that every error coincides with an invalid
> tcp packet:
> 
> kernel: invalid:IN=lo OUT= MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00
> SRC=127.0.0.1 DST=127.0.0.1 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=33082 DF
> PROTO=TCP SPT=48340 DPT=8080 WINDOW=32792 RES=0x00 SYN URGP=0
> 
> After some investigations, this SYN packet is not acknowledged by JBoss in
> order to perform the TCP 3-Way Handshake. Mhmm, strange, I decide to
> investigate in firewall rules, build by another sysadmin:
> 
> In the INPUT chain, I found a rule that logs and REJECTS all INVALID
> packets:
> 
> iptables -A INPUT -m state --state INVALID -j LOG --log-prefix "invalid:"
> iptables -A INPUT -m state --state INVALID -j REJECT
> 
> Then logs and REJECTS not SYN but new:
> 
> iptables -A INPUT -p tcp ! --syn -m state --state NEW -j LOG --log-prefix
> "new-not-syn:"
> iptables -A INPUT -p tcp ! --syn -m state --state NEW -j
> REJECT --reject-with tcp-reset
> 
> I decided to add a rule in order to ACCEPT all packets from 127.0.0.1 to or
> from port 8080.
> 
> Since this update, I don't see this kind of errors anymore.
> 
> Why does iptables tag this packet as invalid ?

I believe INVALID applies to all packets that netfilter has no clue why it has 
receieved them. Often, it's a RST or FIN for a non-existent conn or one 
recently torn-down. DDoS packets are often INVALID.

I think those 'syn' rules above are 'defective' (or extraneous). For TCP, only 
a SYN packet should be tagged NEW because there is no other way to initiate a 
TCP conn.

In this particular case, it may be that the SYN arrived during the grace 
period after a previous matching conn was torn down. (Related to 
SO_REUSEADDR?)
