From: "testmail" <testmail@peterpaul.com.ph>
Subject: Iptables Problems
Date: Thu, 2 Dec 2004 14:12:44 +0800
Message-ID: <008201c4d835$eff08480$0200a8c0@etpi>
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
Content-Type: text/plain; charset="us-ascii"
To: Netfilter <netfilter@lists.netfilter.org>

Hi,

Im using Fedora Core 2 and was trying iptables for the first time. I'm =
setting a firewall between the internet=20
and my private network wherein my server(behind firewall) is running =
FTP(wu-fptd) and SMB

My iptable configuration should be :                   =20
      =20
                   1. Filter all incomming FTP request (should have the =
ability to filter specific ip that is comming from the public network).
                   2. SMB request from the Internet should be block.
                   3. Drop all ports that is not being used by SMB and =
FTP.
                   4. Can browse the internet

My current iptable config is not working at all.......Please Help!

>>>>>Current Setup<<<<<<

Server Setup

             1 network card with private ip eth0 and behind firewall


Iptable Config from Firewall and used also as a gateway.

    Net Card
                etho -- static ip from isp
                eth1 -- private ip

FromInternetSourceIP =3D '222.222.222.222'  sample ip
LocalIPFTPSMB =3D '192.168.0.2'

iptables -F
iptables -t nat -F
iptables -t mangle -F                                                    =
                            =20
              =20
# Set the default policy
iptables -t filter -A INPUT  -j DROP                                     =
                               =20
              =20
#Allow FTP Connection from this source ip
iptables -t filter -A INPUT -p tcp -s 192.168.0.1/24 -d $LocalIPFTPSMB =
--dport 20:21 -j ACCEPT
iptables -t filter -A INPUT -p tcp -s $FromInternetASourceIP -d =
LocalIPFTPSMB --dport 20:21 -j ACCEPT
                                                                         =
                                 =20
# Smb Connections allowed from 192.168.0.1/24 network
iptables -A INPUT -i eth0 -p tcp -s 192.168.0.1/24 -d LocalIPFTPSMB =
--sport 137:139 -j ACCEPT                                                =
   =20

#Connect all WWW traffic using port 80
iptables -t nat -A POSTROUTING -s 192.168.0.1/24 -d 0/0 -p tcp --dport =
80 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 192.168.0.1/24 -d 0/0-p tcp --dport 53 =
-j MASQUERADE
iptables -t nat -A POSTROUTING -s 192.168.0.1/24 -d 0/0-p udp --dport 53 =
-j MASQUERADE                      =20
                                                   =20
#For logging                        =20
iptables -A OUTPUT -j LOG
iptables -A INPUT -j LOG
iptables -A FORWARD -j LOG


Milo
