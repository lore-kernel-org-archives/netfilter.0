From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: simple port forwarding question
Date: Mon, 3 Nov 2003 06:07:23 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031103140723.2238.qmail@web40206.mail.yahoo.com>
References: <3FA65F1D.20205@engr.uconn.edu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FA65F1D.20205@engr.uconn.edu>
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
Content-Transfer-Encoding: 7bit
To: Rohit Kumar Mehta <rohitm@engr.uconn.edu>, netfilter@lists.netfilter.org


--- Rohit Kumar Mehta <rohitm@engr.uconn.edu> wrote:
> 
> Hi guys, I was wondering if someone could help me out here.  I am fairly 
> well confused after trying to muddle through
> this tutorial:
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html
> 
> I think what I want to do should be easy.  Perhaps someone could help.
> 
> We are trying to trick the systems into believing that the Kerberos 5 
> server is on IP#2 (let's call it 192.168.28.3)
> but it is in fact on IP#1 (192.168.28.2).
> 
> Maybe my attempted iptables commands will make it blatantly obvious what 
> I am trying to do:
> 
> iptables -t nat -A PREROUTING --dst 192.168.28.3 -p tcp --dport 88 -j 
> DNAT --to 192.168.28.2
> iptables -t nat -A PREROUTING --dst 192.168.28.3 -p udp --dport 88 -j 
> DNAT --to 192.168.28.2
> 
> iptables -t nat -A POSTROUTING -p udp --dst 192.168.28.2 --dport 88 -j 
> SNAT --to-source 192.168.28.3
> iptables -t nat -A POSTROUTING -p tcp --dst 192.168.28.2 --dport 88 -j 
> SNAT --to-source 192.168.28.3
> 
> iptables -t nat -A OUTPUT --dst 192.168.28.3 -p tcp --dport 88 -j DNAT 
> --to-destination 192.168.28.2
> iptables -t nat -A OUTPUT --dst 192.168.28.3 -p udp --dport 88 -j DNAT 
> --to-destination 192.168.28.2
> 
> 
> Basically we want it so that if I do a "telnet 192.168.28.3 88", I get a 
> connection to "192.168.28.2:88"
> This works - when I initiate the connection from 192.168.28.3, but from 
> any other machine on the network
> it does not work.
> 
> Am I doing something wrong or forgetting a key step?  Thanks!
> 
> Rohit
> 
> 

I think you left out one important bit of information here. Are these two ips
on the same box? ( ie .1 on eth0 and .3 eth1 ) If they are I think it would
mean all the world of difference for your ruleset. you might be using the NAT
table when FOWARD lines in your filter table would sufice...

just a guess...

SBlaze

=====
In the absence of order there will be chaos.

__________________________________
Do you Yahoo!?
Exclusive Video Premiere - Britney Spears
http://launch.yahoo.com/promos/britneyspears/

