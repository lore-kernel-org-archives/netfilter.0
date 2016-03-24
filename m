From: k c <kisscoolandthegangbang@hotmail.fr>
Subject: tcp reset flags when forwarding incoming traffic on bridge
Date: Thu, 24 Mar 2016 11:54:00 +0100
Message-ID: <DUB125-W172906DF1D14330A10CCBDA0820@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello,

I have a setup where I want to forward incoming traffic on a bridge to =
another host. I can send the traffic to the other host but the problem =
is that the when packets are forwarded, that generates packets with res=
et flags and=A0 so client's connection fails.

To let the traffic go to the the desired host, I have the following rul=
es :

# ebtables -t broute -L
Bridge table: broute

Bridge chain: BROUTING, entries: 1, policy: ACCEPT
-p IPv4 --ip-proto tcp --ip-dport 389 --log-level notice --log-prefix "=
LOG_BR : " --log-ip -j redirect

# iptables -t nat -S
-P PREROUTING ACCEPT
-P POSTROUTING ACCEPT
-P OUTPUT ACCEPT
-A PREROUTING -s 10.75.1.57/32 -i vmbr0 -p tcp -m tcp --dport 389 -j DN=
AT --to-destination 10.93.64.203:389
-A POSTROUTING -d 10.93.64.203/32 -o vmbr0 -p tcp -m tcp --dport 389 -j=
 SNAT --to-source 10.93.64.206

And a tcpdump on the receiving host gives me:=20

# tcpdump -anei any port 389
tcpdump: verbose output suppressed, use -v or -vv for full protocol dec=
ode
listening on any, link-type LINUX_SLL (Linux cooked), capture size 2621=
44 bytes
10:36:22.068116=A0 In ec:f4:bb:c8:fe:3c ethertype IPv4 (0x0800), length=
 76: 10.93.64.206.52944> 10.93.64.203.389: Flags [S], seq 3338345292, w=
in 29200, options [mss 1460,sackOK,TS val 1312169791 ecr 0,nop,wscale 7=
], length 0
10:36:22.068194 Out d6:46:93:c1:48:d6 ethertype IPv4 (0x0800), length 7=
6: 10.93.64.203.389> 10.93.64.206.52944: Flags [S.], seq 592271397, ack=
 3338345293, win 14480, options [mss 1460,sackOK,TS val 1480126060 ecr =
1312169791,nop,wscale 7], length 0
10:36:22.068280=A0 In ec:f4:bb:c8:fe:3c ethertype IPv4 (0x0800), length=
 62: 10.93.64.206.52944> 10.93.64.203.389: Flags [R], seq 3338345293, w=
in 0, length 0
10:36:23.065698=A0 In ec:f4:bb:c8:fe:3c ethertype IPv4 (0x0800), length=
 76: 10.93.64.206.52944> 10.93.64.203.389: Flags [S], seq 3338345292, w=
in 29200, options [mss 1460,sackOK,TS val 1312170041 ecr 0,nop,wscale 7=
], length 0
10:36:23.065755 Out d6:46:93:c1:48:d6 ethertype IPv4 (0x0800), length 7=
6: 10.93.64.203.389> 10.93.64.206.52944: Flags [S.], seq 607858387, ack=
 3338345293, win 14480, options [mss 1460,sackOK,TS val 1480127058 ecr =
1312170041,nop,wscale 7], length 0
10:36:23.065893=A0 In ec:f4:bb:c8:fe:3c ethertype IPv4 (0x0800), length=
 62: 10.93.64.206.52944> 10.93.64.203.389: Flags [R], seq 3338345293, w=
in 0, length 0
10:36:25.069628=A0 In ec:f4:bb:c8:fe:3c ethertype IPv4 (0x0800), length=
 76: 10.93.64.206.52944> 10.93.64.203.389: Flags [S], seq 3338345292, w=
in 29200, options [mss 1460,sackOK,TS val 1312170542 ecr 0,nop,wscale 7=
], length 0
10:36:25.069721 Out d6:46:93:c1:48:d6 ethertype IPv4 (0x0800), length 7=
6: 10.93.64.203.389> 10.93.64.206.52944: Flags [S.], seq 639170166, ack=
 3338345293, win 14480, options [mss 1460,sackOK,TS val 1480129062 ecr =
1312170542,nop,wscale 7], length 0
10:36:25.069867=A0 In ec:f4:bb:c8:fe:3c ethertype IPv4 (0x0800), length=
 62: 10.93.64.206.52944> 10.93.64.203.389: Flags [R], seq 3338345293, w=
in 0, length 0
10:36:29.077828=A0 In ec:f4:bb:c8:fe:3c ethertype IPv4 (0x0800), length=
 76: 10.93.64.206.52944> 10.93.64.203.389: Flags [S], seq 3338345292, w=
in 29200, options [mss 1460,sackOK,TS val 1312171544 ecr 0,nop,wscale 7=
], length 0
10:36:29.077902 Out d6:46:93:c1:48:d6 ethertype IPv4 (0x0800), length 7=
6: 10.93.64.203.389> 10.93.64.206.52944: Flags [S.], seq 701798142, ack=
 3338345293, win 14480, options [mss 1460,sackOK,TS val 1480133070 ecr =
1312171544,nop,wscale 7], length 0
10:36:29.078059=A0 In ec:f4:bb:c8:fe:3c ethertype IPv4 (0x0800), length=
 62: 10.93.64.206.52944> 10.93.64.203.389: Flags [R], seq 3338345293, w=
in 0, length 0
10:36:29.973597=A0 In ec:f4:bb:c8:fe:3c ethertype IPv4 (0x0800), length=
 76: 10.93.64.206.52898> 10.93.64.203.389: Flags [S], seq 1218597864, w=
in 29200, options [mss 1460,sackOK,TS val 1312171768 ecr 0,nop,wscale 7=
], length 0
10:36:29.973660 Out d6:46:93:c1:48:d6 ethertype IPv4 (0x0800), length 7=
6: 10.93.64.203.389> 10.93.64.206.52898: Flags [S.], seq 1953784105, ac=
k 1218597865, win 14480, options [mss 1460,sackOK,TS val 1480133965 ecr=
 1312171768,nop,wscale 7], length 0
10:36:29.973775=A0 In ec:f4:bb:c8:fe:3c ethertype IPv4 (0x0800), length=
 62: 10.93.64.206.52898> 10.93.64.203.389: Flags [R], seq 1218597865, w=
in 0, length 0

I can't understand why the reset flags are there. I can forward traffic=
 the same way on an eth interface just with the iptables rules and that=
 works. I'm working with a bridge so ebtable is mandatory. Am i right ?=
 Is my ebtable rule incorrect ? Have I missed something ?=20

Thanks for your help.
 		 	   		  