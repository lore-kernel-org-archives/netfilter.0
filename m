From: Adam Wiggins <hiro@dusk.org>
Subject: Re: local port redirect to remote IP
Date: Mon, 11 Nov 2002 20:43:02 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021111204302.A47608@dusk.org>
References: <20021107185721.B34761@dusk.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20021107185721.B34761@dusk.org>; from hiro@dusk.org on Thu, Nov 07, 2002 at 06:57:21PM -0800
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Replying to my own post here.  Someone posted the link to this
excellent tutorial:

http://iptables-tutorial.frozentux.net/chunkyhtml/book1.html

Which gave me a lot of insight, but unfortunately still doesn't cover
the case I want (take packets originating on localhost, going to a
port on localhost, and NAT them to a remote box).

At the bottom of the DNAT explanation:

http://iptables-tutorial.frozentux.net/chunkyhtml/x2326.html#DNATTARGET

...it covers something that seems like what I want, which is DNATing
from a firewall to a web server inside a LAN:

iptables -t nat -A OUTPUT --dst $INET_IP --dport 80 -j DNAT --to-destination $HTTP_IP

Using the OUTPUT chain, which I hadn't tried.  So I did this:

iptables -t nat -A OUTPUT -p tcp --dst 127.0.0.1 --dport 8000 -j DNAT --to-destination 64.58.76.225:80

I think this is on the right track - now when I telnet to port 8000
locally it just locks waiting for the connection.  That implies that
the packets are getting sent out but failing to return.  I tried
switching --dst to be the machine's local IP, thinking that that might
help them find their way back more easily, but no dice.

Any thoughts?

-Adam



On Thu, Nov 07, 2002 at 06:57:21PM -0800, Adam Wiggins wrote:
> 
> Greetings,
> 
> I need to redirect a port on the loopback device to a remote IP -
> basically the reverse of a transparent Squid proxy.
> 
> The example I'm trying to get working is to make port 8000 on the
> local machine connect me to www.yahoo.com:80.
> 
> I tried both DNAT and REDIRECT (not sure which is applicable here),
> as follows:
> 
> [root@ash root]# iptables -F -t nat
> [root@ash root]# iptables -t nat -A PREROUTING -s 127.0.0.1 -p tcp --dport 8003 -j REDIRECT --to 64.58.76.225:80
> [root@ash root]# telnet localhost 8003
> Trying 127.0.0.1...
> telnet: connect to address 127.0.0.1: Connection refused
> [root@ash root]# iptables -F -t nat
> [root@ash root]# iptables -t nat -A PREROUTING -s 127.0.0.1 -p tcp --dport 8003 -j DNAT --to 64.58.76.225:80
> [root@ash root]# telnet localhost 8003
> Trying 127.0.0.1...
> telnet: connect to address 127.0.0.1: Connection refused
> 
> The REDIRECT works on a remote machine (if I specify -s <someIP> and
> then connect from that machine), so I know I must be close.  I
> experimented with POSTROUTING as well, but that doesn't allow you to
> specify a source IP and I need to make sure this only works when
> connecting locally.
> 
> Any pointers much appreciated.
> 
> -Adam
> 

