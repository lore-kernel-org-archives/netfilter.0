From: John Joseph <jjk_saji@yahoo.com>
Subject: IPTABLES , help requested ,
	have problem in forwarding port 110 to 8110
Date: Thu, 27 Jul 2006 07:30:03 +0100 (BST)
Message-ID: <20060727063003.28711.qmail@web55508.mail.re4.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

Hi
   I have a gateway (CentOS) with eth0 and eth1 as
interfaces. =93eth0=94  is exposed to WAN and  =93eth1=94 to
the LAN  network , I want all POP3 packets coming  in
through the gateway  wan interface (eth0) to be
redirected  to the PS1(192.168.242.129 inside the lan)
port 8110 .  I had done some iptables settings as=20

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport
pop3 -j DNAT --to 192.168.242.129:8110
iptables        -A FORWARD -i eth0 -p tcp --dport 8110
-d 192.168.242.129 -j ACCEPT

  In this setup POP3  packets were not redirected to
PS1 (192.168.242.129)=20
###
From the gateway iptables -L gives=20
[root@gateway ~]# iptables -L
Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere    =20
      state RELATED,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere
LOG        all  --  anywhere             anywhere    =20
      LOG level warning
ACCEPT     tcp  --  anywhere           =20
192.168.242.129     tcp dpt:8110

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
###
             Guidance requested=20
 			Thanks=20
                            Joseph John=20


	=09
___________________________________________________________=20
Try the all-new Yahoo! Mail. "The New Version is radically easier to use" =
=96 The Wall Street Journal=20
http://uk.docs.yahoo.com/nowyoucan.html

