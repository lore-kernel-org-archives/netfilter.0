From: trainier@kalsec.com
Subject: Re: irc
Date: Mon, 17 Nov 2003 12:43:15 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OFD7AE25B0.4E5DA4B4-ON85256DE1.00606EE3-85256DE1.006156D2@kal.kalsec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I'll attempt to clear things up a bit.

An irc proxy, is a machine that accepts a connection, then forwards you on 
to the proxy server.  An irc bounce, is very similiar in nature.
The general idea behind an irc proxy/bnc is that you have a way to 
anonymize yourself.  You have a way of allowing many people to connect to 
irc, from one address. (most irc servers don't allow more than 2 
connections from the same IP.  With a proxy and, what's called an i:line, 
they can allow proxied hosts if they're secure). 

What I'm looking for, is not an irc proxy.  I'm already connecting to an 
irc proxy.  The problem is, when I changed my default gateway to point at 
my http-proxy, I can no longer make connections out to my irc server.  (It 
comes back with a "connection refused").  I thought I would have to use 
NAT in this case, just like I have to use NAT to allow http and ftp 
requests, through the squid proxy server.
Here's how I'm set up:


Client machine ->   squid-proxy   ->  DMZ  ->  IRC Server.

When the client machine sends a connection request to the irc server, it 
comes back with a "Connection Refused".
I thought I could use some NAT/Netfiltering rules, to fix this issue.

Does any of this make sense, yet?  :-/

Regards,

Tim Rainier

