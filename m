From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NetBIOS browsing across subnets
Date: Fri, 5 Jul 2002 20:15:51 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020705191553.UXHV4119.mta06-svc.ntlworld.com@there>
References: <31f101c22452$88c3b280$2901a8c0@amos> <02bd01c22453$80863600$3200a8c0@jungle.funkybadger.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <02bd01c22453$80863600$3200a8c0@jungle.funkybadger.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Suppose you have two subnets 192.168.1.0/24 and 192.168.2.0/24 joined by a 
netfilter router, and you want to browse Windows NetBios shares on the 
192.168.2.0 subnet from a client machine on the 192.168.1.0 subnet.

Suppose you put the following rules on the router:

iptables -A PREROUTING -t nat -d 192.168.1.255 -j DNAT --to 192.168.2.255

iptables -A FORWARD -j ACCEPT

Would this forward a broadcast packet on the 192.168.1.0 network to the 
192.168.2.0 network ?   Presumably the reply to such a broadcast is sent back 
to the originating IP, so that would go back across the router perfectly okay.

If you needed to transfer broadcasts from both networks to each other you'd 
have to be a bit clever with the iptables rules, so as not to translate a 
packet and then immediately translate it straight back again, but it could 
still be done.

Unfortunately amongst all my Linux machines I don't have enough Windows 
computers here to try this idea out :-)   Maybe someone else can comment on 
it from experience, or try and tell us what happens ?

 

Antony.

