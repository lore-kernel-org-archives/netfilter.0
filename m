From: "__ Radien__" <radien@zworg.com>
Subject: (no subject)
Date: Thu,  8 Apr 2004 02:43:13 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <24002.1081417393@zworg.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Thx Antony
But: 

>Circuit level filtering means packet filtering - what netfilter does - in 
>other words you filter packets based on where they've come from and where 
>they're going to (IP addresses), and on *assumptions* about what the TCP/UDP 
>port numbers mean, rather than based on anything that's actually inside the body of the packets (data).

  I read it's sth more than packet filtering, and it work on session
layer. Working on session layer is a little hard for me to underestand.
I'm looking for some example.

  I guess ESTABLISHED state option of iptables make it work on such
level, but I'm not sure.


>Application level filtering means proxies - software which can understand 
>protocols like http, smtp, pop3, ftp, irc.... and look at the data and 
>commands which are being transferred between machines, then base the 
>filtering decisions on that (as well as IP addresses and hostnames).


>Gateway simply refers to a machine which is in the path between your network 
>and the outside world - can mean anything from a simple router with no 
>filtering capabilities to a multi-protocol proxy server with intrusion detection.

Thx but, I meant "Circuit Level gateway" not a simple gateway I mean
IP(or network level).

>Netfilter (iptables) is a stateful packet filter, and therefore operates at 
>layers 3/4 of the OSI model - the network layers.   It does not meaningfully 
>operate at layer 7 - the application layer.

But I think matching RELATED state of ftp data connection means working
on layer 7.

>If you want realistic application layer filtering on a linux system you need 
>proxy applications like sendmail/exim/apache/squid/frox.   Netfilter won't do 
>it for you.

So u mean there's no such matching module or action in Netfilter.

Regards
__Radien__

