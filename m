From: "Hard__warE" <hard__ware@hotmail.com>
Subject: Complex multi-homed/NAT setup
Date: Sat, 15 Jun 2002 12:44:10 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <000b01c21416$8706c8c0$7b0010ac@dynamicaccess.lan>
Reply-To: "Hard__warE" <hard__ware@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
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

infact i belive thats the only way your going to get it done with iptables

and also by using some Tricky Established,Related rules in for the SNAT back
out to the internet and maybee

also set the TIME_WAIT limit and the LAST_ACK to a minimal amount .. :D

>My solution was to bind the public ips for the internal machine on the=20
>respective interfaces on the firewall. Therefore the firewall will = reply
to =20
>arp requests from routers. eg.
>ifconfig eth1:0 62.2.159.14 netmask 255.255.255.192 <-- replace the =
>netmask=20
>with your own.
>ifconfig eht2:0 194.38.85.209 netmask 255.255.255.0
>
>Hope this helps
>
>Ray


That was some good advice Ray .. :-D


