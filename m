From: Dobersberger Dieter <dieter@dobersberger.at>
Subject: kernel 2.6 IPsec and netfilter
Date: Wed, 14 Jan 2004 19:51:24 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <912065890.20040114195124@redbox.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi All !

I have set up an in-kernel IPsec Tunnel with Linux 2.6.0 and want to
filter traffic going through this tunnel.

Before I upgraded to 2.6 I used FreeS/WAN on Linux 2.4 which provided
a virtual interface called ipsec0 which I could use to apply rules
after the IPsec packet has been decrypted. Now with kernel 2.6 ipsec0
is gone and the incoming interface is the same as the physical (eth0).
So the machine on the other end of the IPsec tunnel has unlimted
access to my server.

I used these rules for FreeS/WAN:

# $WWW .. ip address of the webserver
# $DB ... ip address of the database server
# both are linked with an IPsec tunnel

# allow IKE and IPsec (AH and ESP)
iptables -A INPUT -s $WWW -d $DB -p udp --dport 500 -j ACCEPT
iptables -A INPUT -s $WWW -d $DB -p 50 -j ACCEPT
iptables -A INPUT -s $WWW -d $DB -p 51 -j ACCEPT

# allow mysql via IPsec
iptables -A INPUT -i ipsec0 -p tcp -s $WWW -d $DB \
   --dport 3306 -j ACCEPT

# drop everything else
iptables -A INPUT -j DROP

The above rules don't work for in-kernel IPsec. The www server has
unlimited access to the db server because the decrypted packets are
not processed by iptables.

All I found on the net is a link to an older thread discussing the
same problem but they didn't find a solution:
http://www.spinics.net/lists/netfilter/msg18030.html

Anyone got an idea how to limit the traffic coming in via IPsec to
certain ports and block all other traffic ? Can someone please post
iptables rules that do the same filtering for in-kernel IPsec as mine
did in FreeS/WAN ?

Thanks for reading this far.
best regards,
Dieter


