From: Rohit Kumar Mehta <rohitm@engr.uconn.edu>
Subject: Re: simple port forwarding question
Date: Mon, 03 Nov 2003 09:12:08 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FA66238.4070500@engr.uconn.edu>
References: <20031103140723.2238.qmail@web40206.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: SBlaze <dagent.geo@yahoo.com>
Cc: netfilter@lists.netfilter.org

Sorry, maybe I tried to distill the problem too much ;-)  The short 
answer is no they are seperate machines.

The first machine 192.168.28.2 is a Windows 2000 Active Directory 
(working as the kerberos 5 KDC),
and the second machine (which I am running iptables on) is a Debian 
GNU/Linux system running kernel 2.4.22.

Rohit

SBlaze wrote:

>I think you left out one important bit of information here. Are these two ips
>on the same box? ( ie .1 on eth0 and .3 eth1 ) If they are I think it would
>mean all the world of difference for your ruleset. you might be using the NAT
>table when FOWARD lines in your filter table would sufice...
>
>just a guess...
>
>SBlaze
>
>=====
>In the absence of order there will be chaos.
>
>__________________________________
>Do you Yahoo!?
>Exclusive Video Premiere - Britney Spears
>http://launch.yahoo.com/promos/britneyspears/
>  
>




