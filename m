From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Circuit Level Gateway & Filtering!?
Date: Thu, 8 Apr 2004 09:40:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404080940.48760.Antony@Soft-Solutions.co.uk>
References: <9723.1081409292@zworg.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <9723.1081409292@zworg.com>
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

On Thursday 08 April 2004 8:28 am, __ Radien__ wrote:

> Dear All
>
>    I have read some about ISA server from it's documentation. There were
> listed some facilities for example Circuit Level and App Level
> filtering and gateway.
>
>    Circuit level filtering and gateway were strange for me. What are
> they?

These refer to the OSI 7-layer networking model: you have applications at the 
top (web, email, ftp, ssh), then underneath those you have things like TCP/IP 
to transfer packets around the Internet (without caring what sort of 
application data is inside those packets), and then underneath that you have 
ethernet cables and 802.11 connections etc actually getting the data from one 
machine to another.

(Yes, this is a huge simplification - look up any reference on OSI 7-layer 
model for more details, also compare against the TCP 4-layer model).

Circuit level filtering means packet filtering - what netfilter does - in 
other words you filter packets based on where they've come from and where 
they're going to (IP addresses), and on *assumptions* about what the TCP/UDP 
port numbers mean, rather than based on anything that's actually inside the 
body of the packets (data).

Application level filtering means proxies - software which can understand 
protocols like http, smtp, pop3, ftp, irc.... and look at the data and 
commands which are being transferred between machines, then base the 
filtering decisions on that (as well as IP addresses and hostnames).

Gateway simply refers to a machine which is in the path between your network 
and the outside world - can mean anything from a simple router with no 
filtering capabilities to a multi-protocol proxy server with intrusion 
detection.

>    How can I see such capabilities in iptables? How they get mapped in
> iptables?

Netfilter (iptables) is a stateful packet filter, and therefore operates at 
layers 3/4 of the OSI model - the network layers.   It does not meaningfully 
operate at layer 7 - the application layer.

>    Is iptables sth other than what ip_conntrack_ftp.o mudule do in
> Application Layer?

If you want realistic application layer filtering on a linux system you need 
proxy applications like sendmail/exim/apache/squid/frox.   Netfilter won't do 
it for you.

Hope this helps,

Antony.

-- 
Documentation is like sex.
When it's good, it's very very good.
When it's bad, it's still better than nothing.

                                                     Please reply to the list;
                                                           please don't CC me.


