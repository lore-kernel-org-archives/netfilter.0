From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Internal NAT Translation:
Date: Sun, 4 Jul 2004 14:04:19 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407041404.19947.Antony@Soft-Solutions.co.uk>
References: <002101c45f0c$c2b90c50$0c02a8c0@bryanhome>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002101c45f0c$c2b90c50$0c02a8c0@bryanhome>
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

On Thursday 01 July 2004 2:43 am, Bryan Martin wrote:

> inbound http connections to the public address
> 200.200.200.200 is being dnatted to 192.168.2.254 which is the address of
> the windows server.  This is working as expected.  The problem arises when
> a internal client tries to connect to the public website.
>
> -A PREROUTING -i eth1 -d 200.200.200.200 -p tcp --dport 80 -j
> DNAT --to-destination 192.168.2.254

How many times are we going to see the *exact* *same* question coming up on 
this list???

It's in the docs, it's in the archives....

http://www.netfilter.org/documentation/HOWTO/NAT-HOWTO-10.html

Just think about it for a moment:

1. Internal client (say 192.168.2.42) sends a packet to 200.200.200.200
2. Firewall DNATs it to 192.168.2.254
3. Web server replies to client (192.168.2.42)
4. Client is on local subnet, so server just sends reply direct - doesn't have 
to route through the firewall
5. Client gets a response from 192.168.2.254, after sending the request to 
200.200.200.200
6. Does not compute - client unhappy.

Put your publicly-accessible windows web server on a DMZ network instead of 
alongside all your client machines (so that when IIS gets attacked you're not 
letting the web server (now 'owned' by someone else) have free rein to do 
whatever it likes with all the clients and other machines on your LAN), and 
the DNAT won't give you any problems.

Antony.

-- 
"It is easy to be blinded to the essential uselessness of them by the sense of 
achievement you get from getting them to work at all. In other words - and 
this is the rock solid principle on which the whole of the Corporation's 
Galaxy-wide success is founded - their fundamental design flaws are 
completely hidden by their superficial design flaws."

 - Douglas Noel Adams

                                                     Please reply to the list;
                                                           please don't CC me.


