From: cc <cc@belfordhk.com>
Subject: Re: I can't resolve DNS name
Date: Sat, 30 Aug 2003 09:33:39 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F4FFEF3.7010405@belfordhk.com>
References: <0afd01c36e54$67e73620$0221a0c0@DANIEL>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <0afd01c36e54$67e73620$0221a0c0@DANIEL>
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
To: Netfilter Group <netfilter@lists.netfilter.org>

Daniel Arjona wrote:

> Hello:
> 
> I tried to configure an iptables firewall, but i can't.  I need cofigure
> this to use FTP, Kazaa, Internet, ICQ and access the IMAP server of Netscape
> with my Netscape Client.
> 
> Observations:
> I have LRH 8.0 and iptables is in the my unique server with squid, qmail and
> others.
> My router is directly connected to the NIC of the server.
> When i try to connect to any FTP Server, i recieve this message "I can't
> resolve DNS name"
> I can't do ping to any IP Address

Try the following:

1) Ping your loopback.
2) ping your server's Internal IP.
3) Ping anyone one of your LAN IP.

4) Ping your router.  (You didn't mention if
your router has an IP.  I'm assuming it has.)

You didn't mention from where you were trying to connect.

5) If the above pings correctly, then check if you've
set up your routing tables correctly.  What happens
when you enter 'route'?  What's the ip of your eth0?


I don't know if the above might help.




