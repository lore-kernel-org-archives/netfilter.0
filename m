From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Using DNAT and SNAT to do a local redirection does not work
 (want to do what rinetd does with iptables)
Date: Thu, 07 Jun 2007 19:17:30 -0500
Message-ID: <4668A01A.9060304@riverviewtech.net>
References: <46686B01.6080605@mayr-stefan.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46686B01.6080605@mayr-stefan.de>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 6/7/2007 3:30 PM, Stefan Mayr wrote:
> And here comes the problem:  The loadbalancer should check whether 
> the JBoss-Webservers are still alive but internal check-utils can 
> only connect to the ip eth0. The different JBoss instances are not 
> bound to this IP because they only the first could bind to port 8080. 
> But I can specify another port for each health check. So my thought 
> was:

If you are using the loop back interface, this will not work.

> I thought this would be easy to do with some simple iptables rules on
> Server1/2. Maybe I am to stupid but I cannot get it to work.

No, you are not stupid.  At least I don't think you are.

> so far my idea - but it doesn't work. I added some logging to these
> rules an found out the following:
> 
> 1. when I open a connection to the server, e.g. 192.168.1.2:10001,
> the DNAT works (at least I see the "SYN" in the nat-PREROUTING-LOG)
> 2. the server responds with "ACK RST" but from 192.168.1.101:8080
> (filter-OUTPUT-LOG)
> 
> - Why does the response not go through nat-POSTROUTING?
> - Why the "RST"? Or do I read the logs all wrong?

You are using the loop back interface. Loop back is a very special 
network interface.  If I recall correctly, it will only allow its self 
to talk to it.  Thus you can not NAT traffic in to the loop back 
interface.  The kernel will block this.  I think this is why you are 
seeing the RST packets.

> I hope somebody can help me with this.

Try using a dummy network interface, or an ethernet interface that is 
not connected to any thing.

You could also probably bind the address to the main ethernet interface 
and use ARPTables to prevent each node from responding to ARP request by 
preventing it from ever seeing the ARP request.  The ARP issue (as I'm 
sure you are aware) is why you usually use other interfaces.



Grant. . . .

