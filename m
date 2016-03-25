From: k c <kisscoolandthegangbang@hotmail.fr>
Subject: Re: tcp reset flags when forwarding incoming traffic on bridge
Date: Fri, 25 Mar 2016 15:00:20 +0100
Message-ID: <20160325150020.23cfdf3f@martinpc.linkeo.intra>
References: <DUB125-W172906DF1D14330A10CCBDA0820@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <DUB125-W172906DF1D14330A10CCBDA0820@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

I got it.=20

The traffic I tried to intercept is on a proxmox host configured with b=
ridging. There are guest VMs/CTs that generate traffic to the guest I w=
as trying to
redirect traffic from and this traffic was bloqued because of not corre=
sponding rule.=20

I have something that works now. The corresponding rules are:

ebtables -t broute -p IPv4 --ip-dst 10.93.64.206 --ip-proto tcp --ip-dp=
ort 389 --log-level notice --log-prefix "LOG_BR : " --log-ip -j redirec=
t
iptables -t nat -A PREROUTING -p tcp -s 10.75.1.57/32 -d 10.93.64.206 -=
-dport 389 -j DNAT --to-destination 10.93.64.203:389
iptables -t nat -A POSTROUTING -p tcp -d 10.93.64.203 --dport 389 -j SN=
AT --to-source 10.93.64.206:389
=20




On Thu, 24 Mar 2016 11:54:00 +0100
k c <kisscoolandthegangbang@hotmail.fr> wrote:

> Hello,
>=20
> I have a setup where I want to forward incoming traffic on a bridge t=
o another host. I can send the traffic to the other host but the proble=
m is that the
> when packets are forwarded, that generates packets with reset flags a=
nd=A0 so client's connection fails.
>=20
> To let the traffic go to the the desired host, I have the following r=
ules :
>=20
> # ebtables -t broute -L
> Bridge table: broute
>=20
> Bridge chain: BROUTING, entries: 1, policy: ACCEPT
> -p IPv4 --ip-proto tcp --ip-dport 389 --log-level notice --log-prefix=
 "LOG_BR : " --log-ip -j redirect
>=20
> # iptables -t nat -S
> -P PREROUTING ACCEPT
> -P POSTROUTING ACCEPT
> -P OUTPUT ACCEPT
> -A PREROUTING -s 10.75.1.57/32 -i vmbr0 -p tcp -m tcp --dport 389 -j =
DNAT --to-destination 10.93.64.203:389
> -A POSTROUTING -d 10.93.64.203/32 -o vmbr0 -p tcp -m tcp --dport 389 =
-j SNAT --to-source 10.93.64.206
>=20
> And a tcpdump on the receiving host gives me:=20
>=20
> # tcpdump -anei any port 389
> tcpdump: verbose output suppressed, use -v or -vv for full protocol d=
ecode
> listening on any, link-type LINUX_SLL (Linux cooked), capture size 26=
2144 bytes
> 10:36:22.068116=A0 In ec:f4:bb:c8:fe:3c ethertype IPv4 (0x0800), leng=
th 76: 10.93.64.206.52944> 10.93.64.203.389: Flags [S], seq 3338345292,=
 win 29200, options
> [mss 1460,sackOK,TS val 1312169791 ecr 0,nop,wscale 7], length 0 10:3=
6:22.068194 Out d6:46:93:c1:48:d6 ethertype IPv4 (0x0800), length 76: 1=
0.93.64.203.389>
> 10.93.64.206.52944: Flags [S.], seq 592271397, ack 3338345293, win 14=
480, options [mss 1460,sackOK,TS val 1480126060 ecr 1312169791,nop,wsca=
le 7], length 0
> 10:36:22.068280=A0 In ec:f4:bb:c8:fe:3c ethertype IPv4 (0x0800), leng=
th 62: 10.93.64.206.52944> 10.93.64.203.389: Flags [R], seq 3338345293,=
 win 0, length 0
> 10:36:23.065698=A0 In ec:f4:bb:c8:fe:3c ethertype IPv4 (0x0800), leng=
th 76: 10.93.64.206.52944> 10.93.64.203.389: Flags [S], seq 3338345292,=
 win 29200, options
> [mss 1460,sackOK,TS val 1312170041 ecr 0,nop,wscale 7], length 0 10:3=
6:23.065755 Out d6:46:93:c1:48:d6 ethertype IPv4 (0x0800), length 76: 1=
0.93.64.203.389>
> 10.93.64.206.52944: Flags [S.], seq 607858387, ack 3338345293, win 14=
480, options [mss 1460,sackOK,TS val 1480127058 ecr 1312170041,nop,wsca=
le 7], length 0
> 10:36:23.065893=A0 In ec:f4:bb:c8:fe:3c ethertype IPv4 (0x0800), leng=
th 62: 10.93.64.206.52944> 10.93.64.203.389: Flags [R], seq 3338345293,=
 win 0, length 0
> 10:36:25.069628=A0 In ec:f4:bb:c8:fe:3c ethertype IPv4 (0x0800), leng=
th 76: 10.93.64.206.52944> 10.93.64.203.389: Flags [S], seq 3338345292,=
 win 29200, options
> [mss 1460,sackOK,TS val 1312170542 ecr 0,nop,wscale 7], length 0 10:3=
6:25.069721 Out d6:46:93:c1:48:d6 ethertype IPv4 (0x0800), length 76: 1=
0.93.64.203.389>
> 10.93.64.206.52944: Flags [S.], seq 639170166, ack 3338345293, win 14=
480, options [mss 1460,sackOK,TS val 1480129062 ecr 1312170542,nop,wsca=
le 7], length 0
> 10:36:25.069867=A0 In ec:f4:bb:c8:fe:3c ethertype IPv4 (0x0800), leng=
th 62: 10.93.64.206.52944> 10.93.64.203.389: Flags [R], seq 3338345293,=
 win 0, length 0
> 10:36:29.077828=A0 In ec:f4:bb:c8:fe:3c ethertype IPv4 (0x0800), leng=
th 76: 10.93.64.206.52944> 10.93.64.203.389: Flags [S], seq 3338345292,=
 win 29200, options
> [mss 1460,sackOK,TS val 1312171544 ecr 0,nop,wscale 7], length 0 10:3=
6:29.077902 Out d6:46:93:c1:48:d6 ethertype IPv4 (0x0800), length 76: 1=
0.93.64.203.389>
> 10.93.64.206.52944: Flags [S.], seq 701798142, ack 3338345293, win 14=
480, options [mss 1460,sackOK,TS val 1480133070 ecr 1312171544,nop,wsca=
le 7], length 0
> 10:36:29.078059=A0 In ec:f4:bb:c8:fe:3c ethertype IPv4 (0x0800), leng=
th 62: 10.93.64.206.52944> 10.93.64.203.389: Flags [R], seq 3338345293,=
 win 0, length 0
> 10:36:29.973597=A0 In ec:f4:bb:c8:fe:3c ethertype IPv4 (0x0800), leng=
th 76: 10.93.64.206.52898> 10.93.64.203.389: Flags [S], seq 1218597864,=
 win 29200, options
> [mss 1460,sackOK,TS val 1312171768 ecr 0,nop,wscale 7], length 0 10:3=
6:29.973660 Out d6:46:93:c1:48:d6 ethertype IPv4 (0x0800), length 76: 1=
0.93.64.203.389>
> 10.93.64.206.52898: Flags [S.], seq 1953784105, ack 1218597865, win 1=
4480, options [mss 1460,sackOK,TS val 1480133965 ecr 1312171768,nop,wsc=
ale 7], length 0
> 10:36:29.973775=A0 In ec:f4:bb:c8:fe:3c ethertype IPv4 (0x0800), leng=
th 62: 10.93.64.206.52898> 10.93.64.203.389: Flags [R], seq 1218597865,=
 win 0, length 0
>=20
> I can't understand why the reset flags are there. I can forward traff=
ic the same way on an eth interface just with the iptables rules and th=
at works. I'm
> working with a bridge so ebtable is mandatory. Am i right ? Is my ebt=
able rule incorrect ? Have I missed something ?=20
>=20
> Thanks for your help.
>  		 	   		  --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
