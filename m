From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Strange ip_conntrack values
Date: Sun, 18 Jul 2004 13:13:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407181313.47640.Antony@Soft-Solutions.co.uk>
References: <ef83df6b040718033163810a15@mail.gmail.com> <200407181146.30331.Antony@Soft-Solutions.co.uk> <ef83df6b0407180428f43532d@mail.gmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <ef83df6b0407180428f43532d@mail.gmail.com>
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

On Sunday 18 July 2004 12:28 pm, John wrote:

> > If not, I suggest a network sniffer (eg: ethereal) or some netfilter
> > LOGging rules to see if you can identify what all this traffic is.
>
> how can I do that ? could u help me achieving this ? I've installed
> tcpdump and logged all connections between 4AM and 6AM but it's not
> easy to find something ...

Tcpdump is a good packet sniffer but it does not show the data in a 
user-friendly format.

I suggest you install ethereal on a machine (does not have to be the firewall) 
and load the tcpdump output file into that.   It will help show you the 
connections in a meaningful format, and you can look for FIN-ACK packets 
which are not replied, multiple FIN-ACKs, etc.

Also, do you have a snapshot of /proc/net/ip_conntrack from any time during 
4am-6am?   If not, I suggest you take another tcpdump log (rather than 2 
hours, I suggest something much shorter, say 10 minutes, because the timer 
you are interested in expires after 2 minutes, so you should get enough 
examples of whatever's happening within a 10 minute window), and take a 
snapshot of /proc/net/ip_conntrack at the start and end of the tcpdump log 
(perhaps a couple of times in the middle as well).

That should give you a traffic stream (of a manageable size) to look at in 
ethereal and compare to the contents of the conntrack table to work out where 
the TIME_WAIT entries are coming from.

By the way, you're not blocking any packets which are important to closing 
connections, are you?   Such as FIN-ACK or RST?   Maybe checking the packet 
counters from "iptables -L -nvx; iptables -L -t nat -nvx" might show 
something interesting?


Regards,

Antony.

-- 
You can spend the whole of your life trying to be popular,
but at the end of the day the size of the crowd at your funeral
will be largely dictated by the weather.

 - Frank Skinner

                                                     Please reply to the list;
                                                           please don't CC me.


