From: Nick Taylor <nickt@lightlink.com>
Subject: Re: transfer speed through firewall
Date: Tue, 23 Nov 2004 12:21:00 -0500 (EST)
Message-ID: <Pine.GSU.4.58.0411231212270.24170@adore.lightlink.com>
References: <0ee701c4d171$c8a5b870$49caa8c0@caris.priv>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <0ee701c4d171$c8a5b870$49caa8c0@caris.priv>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Marshall <peter.marshall@caris.com>
Cc: netfilter <netfilter@lists.netfilter.org>

> Date: Tue, 23 Nov 2004 11:33:29 -0400
> From: Peter Marshall <peter.marshall@caris.com>
> To: netfilter <netfilter@lists.netfilter.org>
> Subject: transfer speed through firewall
>
> I posted about this yesterday and J gave some very helpful suggestions to
> try ...(thank you by the way).  But I have still not getten any better
> results.  Since then, I have changed some switches, put in brand new
> Ethernet cables, and still no difference.  I can transfer data between boxes
> in my DMZ extremely fast.  (3 seconds for a 40 MB file using ftp).  However,
> when I try to transfer that same file from a box on my interior network to a
> box in my DMZ (so it goes to a switch, then to the firewall, then to another
> switch, and then to the box) it takes approx. 40 seconds.  I am 99%
> confident that it is not the switches or network cables.  All cards and
> switches along the way are 100 MB.
>
> Does anyone know of problems with netfilter with slowing down transfers ?
> The box is an 850 with 512 MB of ram.  It has 3 nic cards, and 5 interfaces
> (2 virtual) + the loopback.  Data from my internal network to the DMZ always
> goes in one interface and then out a different.  I did a netstat -ni as
> suggested, but found no errors.
>
> Again, thank you for any information that can be provided.
>
> Peter
>
>
Have you tried the transfer from the server to the firewall, and from
the firewall to the client?  Have you tried a ping flood?  Have you tried
to transfer large amounts of data with other protocols?  Other hosts on
the same networks?  You need to think of this as a science project.
Isolate one variable at a time.  Have you trimmed your firewall down to
the absolute bare minimum (just NAT that you NEED in order to talk)?
Are you using any traffic shaping or policing (if so, disable)?
Is your firewall slow for other things, or just this one client to this
one server and only when doing ftp?  Is your firewall doing anything else
in life (squid server, web server, sql server, etc)?  What's the load
average on the firewall?  What's the average idle CPU on the firewall?
Is the machine running into swap space, or is there free RAM?
Are you certian that there is no IP conflict in either network (two
machines with the same IP address assigned - this breaks everything)


