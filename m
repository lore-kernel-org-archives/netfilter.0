From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: IPTABLES , help requested ,
	have problem in forwarding port 110 to 8110
Date: Thu, 27 Jul 2006 10:27:57 +0200
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C40127E7@knowledge.wizdom.nu>
References: <20060727063003.28711.qmail@web55508.mail.re4.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: John Joseph <jjk_saji@yahoo.com>, netfilter@lists.netfilter.org

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport pop3 -j DNAT --to =
192.168.242.129:8110
This rule would NAT all traffic coming into eth0 for port 110 to =
192.168.242.129:8110, also traffic to other servers, that might need to =
be reached on port 110. Nothing wrong with that , but it's usually best =
to narrow it down and specify an extra --destination x.x.x.x.
=20
ACCEPT     all  --  anywhere             anywhere
This converts your DROP policy to an ACCEPT, doesn't seem wise.
=20
Chain INPUT (policy ACCEPT)
Usually you will not want an ACCEPT policy on your INPUT chain. This =
leaves your firewall wide open.
=20
For the rest, your rules should work. Have you enable IP Routing? (cat 1 =
> /proc/sys/net/ipv4/ip_forward).
=20
-Sietse

________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of John Joseph
Sent: Thu 27-Jul-06 8:30
To: netfilter@lists.netfilter.org
Subject: IPTABLES , help requested ,have problem in forwarding port 110 =
to 8110



Hi
   I have a gateway (CentOS) with eth0 and eth1 as
interfaces. "eth0"  is exposed to WAN and  "eth1" to
the LAN  network , I want all POP3 packets coming  in
through the gateway  wan interface (eth0) to be
redirected  to the PS1(192.168.242.129 inside the lan)
port 8110 .  I had done some iptables settings as

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport
pop3 -j DNAT --to 192.168.242.129:8110
iptables        -A FORWARD -i eth0 -p tcp --dport 8110
-d 192.168.242.129 -j ACCEPT

  In this setup POP3  packets were not redirected to
PS1 (192.168.242.129)
###
From the gateway iptables -L gives
[root@gateway ~]# iptables -L
Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere   =20
      state RELATED,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere
LOG        all  --  anywhere             anywhere   =20
      LOG level warning
ACCEPT     tcp  --  anywhere          =20
192.168.242.129     tcp dpt:8110

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
###
             Guidance requested
                        Thanks
                            Joseph John


              =20
___________________________________________________________
Try the all-new Yahoo! Mail. "The New Version is radically easier to =
use" - The Wall Street Journal
http://uk.docs.yahoo.com/nowyoucan.html




