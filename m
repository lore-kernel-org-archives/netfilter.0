From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: how can I improve the throughput of linux firewall that use the netfilter + iptable
Date: Fri, 24 Oct 2003 10:50:07 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031024175007.64124.qmail@web40201.mail.yahoo.com>
References: <000d01c39a3b$bb997450$8b00000a@casa>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000d01c39a3b$bb997450$8b00000a@casa>
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
To: Leonardo Rodrigues Magalh?es <leolistas@solutti.com.br>, zhaohui_scu@sohu.com, netfilter@lists.netfilter.org


--- Leonardo Rodrigues Magalh?es <leolistas@solutti.com.br> wrote:
> 
>     Number os PCs is not the most important information. We need you to give
> us some more data about the firewall you're pretending to build, like:
> 
> 1) internet connection speed (256k DSL, 1.5 T1, more?? )
> 2) complexity of your rules (simple rules, very complex rules)
> 3) any other information you can share with us .....
> 
> 
>     But I can guarantee you that netfilter can get you VERY good throughput
> **IF** you think before making the rules. We've seen lots of people
> complaining about bad throughputs but almost all the times the problem is
> related to their rules, build in a not-smart way, and not related to
> iptables/netfilter itself.
> 
>     Question: what's smartbits ????? I've never heard about it .....
> 
> 
>     Sincerily,
>     Leonardo Rodrigues
> 
Just a note here first. I have heard unsubstantiated rummors of people using a
1500+ net on a 486 using iptables. I can no more prove that as you can about
what you read.  There are several performance tweaks we can give you
here...provided we could look and see the ruleset(mask your ips though we won't
need really to see those). As Leonardo said alot can be done with a good
ruleset.

Another thing you might want to look at is the lartc(Linux Advanced Routing and
Traffic Control HOWTO). Also of interest is the ipsysctl and iptables tutorials
of Oskar Andreasson. These are INVALUABLE!!!! They are found here...

http://iptables-tutorial.frozentux.net/ and
http://ipsysctl-tutorial.frozentux.net/ here.

Also you might want to do some performance testing on your line so that if you
do make changes you can verfiy they are for the better. I reccomend here...

http://miranda.ctd.anl.gov:7123/ and http://www.dslreports.com/tweaks

Good Luck
SBlaze


=====
In the absence of order there will be chaos.

__________________________________
Do you Yahoo!?
The New Yahoo! Shopping - with improved product search
http://shopping.yahoo.com

