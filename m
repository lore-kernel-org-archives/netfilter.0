From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Memory leaks in ip_conntrack?
Date: Sun, 9 Nov 2003 19:40:12 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311091940.12920.Alistair@nerdnet.ca>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

	
	Actually Anthony I'm inclined to agree with you .. I was just pointing out 
that the assumption that the count in /proc/slabinfo (ip_conntrack) is  an 
indication of the count in /proc/net/ipv4/ip_conntrack is completely 
incorrect.  i.e. the two counters are keeping track of dfferent things.

	I'm curious myself (as to what is causing this gent's problem) as there have 
been so many queries on this subject lately, and as I pointed out to Oskar we 
*really* are starting to need a FAQ on this.  

	i.e. -- if you think this is a problem, here's best how to determine if 
iptables is causing memory issues on your system.  Frequenly folks are 
implementing iptables and don't understand linux memory management schema 
and the affects it has on what they see on their screens.

	Not that I'm complaining, ... Its good learning for me as I try to diagnose 
the issue on my system, but it might make new users lives easier if we had 
the info out there to start with.


	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

