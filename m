From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ip_conntrack_max
Date: Thu, 8 Jul 2004 11:52:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407081152.42618.Antony@Soft-Solutions.co.uk>
References: <40ED161F.5070804@cisbic.com> <200407081056.14826.Antony@Soft-Solutions.co.uk> <40ED226E.8070808@cisbic.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40ED226E.8070808@cisbic.com>
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

On Thursday 08 July 2004 11:31 am, Fallucchi Antonio wrote:

> <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
> <html>

Oh, please don't post html to the list....

I'll edit the crap out of this so you can see my response, but I may not reply 
to other html emails....

> Antony Stone wrote:
>
> 1. How many connections you need to support through your firewall.
> 2. How much memory you have in your machine (each connection table entry
> uses a small amount of memory, therefore this is what sets the limit on the
> maximum size you can make it on a given machine.

> </blockquote>
> the memory of my machie is 128 MB, I don't know how many connection I
> have need..<br>

128Mbytes should be enough for a few thousand connections.   As for how many 
do you need, a starting point is:

1. How any client computers do you have in your LAN accessing the Internet 
through the firewall? (allow a maximum of 10 connections per PC at any given 
time - this will be an overestimate, but not by a ridiculous factor).

2. Do you run any servers on your DMZ accessible from the Internet?   Mail 
servers, web servers, and name servers will all generate different volumes of 
connections, but if you allow 50-100 connections per server, again that 
should be a worthwhile estimate.

> What is the output of "wc -l /proc/net/ip_conntrack", and how much memory
> do you have in your system?
>
> </blockquote>
> wc -l /proc/net/ip_conntrack<br>
> &nbsp;&nbsp;&nbsp; 626 /proc/net/ip_conntrack<br>

In that case something is wrong with your system.   626 connections is hardly 
anything - I do not see how you can be running out of conntrack table entries 
with only 626 current connections.

What is the value in /proc/sys/net/ipv4/ip_conntrack_max ?

Regards,

Antony.

-- 
Ramdisk is not an installation procedure.

                                                     Please reply to the list;
                                                           please don't CC me.


