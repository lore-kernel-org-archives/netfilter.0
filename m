From: "Ranjeet Shetye" <ranjeet.shetye@zultys.com>
Subject: RE: HELP: Conntrack table filling up !!!
Date: Thu, 2 Jan 2003 11:33:36 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <007b01c2b295$d8422540$0100a8c0@zultys.com>
References: <20021231235005.GD1985@miggy.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021231235005.GD1985@miggy.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


Oh no, definitely, I was only talking of dropping the malformed packets.
Unfortunately, how do you identify/match malformed ICMP packets in
iptables ?? Don't know that one.

Actually, the ICMP problem that I have seen does not go away with a
larger ip_conntrack_max. The extra table space just gets filled up.
Agreed, that the ICMP packets I used to flood the iptables conntrack
mechanism did not strictly comply with ICMP RFC standards, but then
which cracker cares about standards ? :( That's why I asked, are you
seeing malformed ICMP packets ?

Ranjeet Shetye
Senior Software Engineer
Zultys Technologies
771 Vaqueros Avenue
Sunnyvale  CA  94085
USA
Ranjeet.Shetye@Zultys.com
http://www.zultys.com/

 


> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Athan
> Sent: Tuesday, December 31, 2002 3:50 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: HELP: Conntrack table filling up !!!
> 
> 
> On Tue, Dec 31, 2002 at 12:54:57PM -0800, Ranjeet Shetye wrote:
> > 
> > There are ways in which pings (ICMP packets) can fill up conntrack 
> > tables quickly. Are you running into problems with ICMP 
> traffic only 
> > or with any traffic ? e.g. look at /proc/net/ip_conntrack . Is it 
> > filled up with ICMP traffic connections only ? If so, you 
> might want 
> > to protect your linux box from malformed ICMP packets, by 
> DROPping all 
> > such packets in the "filter" table.
> 
>   Don't arbitrarily drop all ICMP, bad idea, breaks a few things.
> 
>   Couldn't the 'full ip conntrack table' problem be solved by 
> echo'ing a bigger number into /proc/sys/net/ipv4/ip_conntrack_max ?
> 
> 	root@jimblewix:/proc/sys/net/ipv4;
> 	23:48:19 0$ echo 32768 > ip_conntrack_max 
> 
> certainly changes it here.
> 
> -Ath
> -- 
> - Athanasius = Athanasius(at)miggy.org / http://www.miggy.org/
>                   Finger athan(at)fysh.org for PGP key
> 	   "And it's me who is my enemy. Me who beats me up.
> Me who makes the monsters. Me who strips my confidence." 
> Paula Cole - ME
> 


