From: "Dan Crooks" <dcrooks@succeed.net>
Subject: RE: Dual Internet Connection
Date: Thu, 4 Jul 2002 12:20:48 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <MCBBLECNEOEMJOAANHHGEEKNCJAA.dcrooks@succeed.net>
References: <20020704114405.C47C6442E@lists.samba.org>
Reply-To: <dcrooks@succeed.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020704114405.C47C6442E@lists.samba.org>
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

To all, I have found what appears to be an excellent article on this
subject.
I did not plan to use load balancing, but I am going to dig out an old
machine
and follow the directions in the article.  For anyone else who is in a
similar
position here is the link:

http://www.samag.com/documents/s=1824/sam0201h/

It is from Sys Admin on redundant internet connections using linux.



>Subject: RE: Dual Internet Connection
>Date: Thu, 4 Jul 2002 17:03:30 +1000
>
>iptables <> router
>
>It tracks connections and not which device it came from. You need iproute 2
>to do something like you need.
>
>I wonder what it would be like to have 2 default gateways and DROP packets
>on each gateway depending on the source address.. wouldn't routes then try
>the other link????
>
>Say
>
>192.168.0.1      192.168.0.2
>|       eth0     |
>-------------------
>        FW
>`add default gw 203.x.x.x`
>`add default gw 210.x.x.x`
>iptables -A FORWARD -s 192.168.0.1 -i eth1 -j DROP
>iptables -A FORWARD -s 192.168.0.2 -i eth2 -j DROP
>iptables -A POSTROUTING -s 192.168.0.1 -o eth2 -j MASQUERADE
>iptables -A POSTROUTING -s 192.168.0.2 -o eth1 -j MASQUERADE
>-------------------
>|eth1            |eth2
>203.x.x.x        210.x.x.x
>
>Would Host Unreachable make the route try the other default
>gateway??? Not a
>pretty sight though.....
>Sorry if it's a bit messed up.. I'm about to leave work..


