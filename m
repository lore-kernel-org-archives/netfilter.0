From: Bob Keyes <bob@sinister.com>
Subject: RE: T-Pot (TCP HoneyPot) idea
Date: Fri, 11 Apr 2003 00:46:15 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0304110041130.17825-100000@Sinister.Com>
References: <000001c2ffd5$35a5a400$fd0aa8c0@winxp>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c2ffd5$35a5a400$fd0aa8c0@winxp>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Hellman <netfilter@taxandfinance.com>
Cc: waltdnes@waltdnes.org, 'Netfilter list' <netfilter@lists.netfilter.org>



On Thu, 10 Apr 2003, Matt Hellman wrote:

> I'm not terribly well versed in the various flag settings during session
> setup and tear down, however this doesn't seem likely to be very effective.
> The end result would probably just be a lot more traffic on your own little
> connection to the Internet.

Bandwidth isn't as much of an issue with syn/ack packets as is the load on
the system. This is why the old synflood was so devastating.

>  Or worse, someone could figure out what you're
> doing and flood you with SYN packets with spoofed source addresses.  It may
> not effect the resources on your firewall (assuming your not keeping the
> connection state) but others sure won't appreciate getting a bunch of
> SYN-ACK packets from you;)

This can already be done. If I fake a SYN packet from you do, say, DNS
root server A, you get traffic from root server A. Maybe a lot of traffic.
It does use more bandwidth as most hosts will reply with an RST, so there
is inbound and output traffic. How effective this is depends on the ratio
of bandwidth in control of the attacker to the limits of bandwidth that
the victim has, and also the capabilities of the intermediate system.




