From: Fallucchi Antonio <fallucch@cisbic.com>
Subject: Re: ip_conntrack_max
Date: Thu, 08 Jul 2004 15:13:09 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40ED4865.7020208@cisbic.com>
References: <40ED161F.5070804@cisbic.com> <200407081056.14826.Antony@Soft-Solutions.co.uk> <40ED226E.8070808@cisbic.com> <200407081152.42618.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407081152.42618.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

Antony Stone wrote:


oh!, excuse me for the html!

>128Mbytes should be enough for a few thousand connections.   As for how many 
>do you need, a starting point is:
>
>1. How any client computers do you have in your LAN accessing the Internet 
>through the firewall? (allow a maximum of 10 connections per PC at any given 
>time - this will be an overestimate, but not by a ridiculous factor).
>
>2. Do you run any servers on your DMZ accessible from the Internet?   Mail 
>servers, web servers, and name servers will all generate different volumes of 
>connections, but if you allow 50-100 connections per server, again that 
>should be a worthwhile estimate.
>
>  
>
very well, thancks.  I have 20 computer in the lan and 5 server.

Another questions: how I can limit the number of connection for every 
computer?

>In that case something is wrong with your system.   626 connections is hardly 
>anything - I do not see how you can be running out of conntrack table entries 
>with only 626 current connections.
>
>What is the value in /proc/sys/net/ipv4/ip_conntrack_max ?
>
>  
>
ip_conntrack_max now is 10240.


bye
Antonio!

