From: "edgar bautista" <edgar_bautista@hotmail.com>
Subject: Configuration problem..
Date: Tue, 03 Jun 2003 12:07:34 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY1-F152brDYsnU1UO00016445@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

>>Hi there!!
>>I=B4ve got the next configuration, so let me try to explain my ascii art.
>>
>>In city A I=B4ve  on my netwok 1 the IP=B4s 192.1.x.1/24
>>The  1760 Router has the ip 192.1.x.254
>>In this side I use a red hat 8.0 with nat and i use it to give
>>internet access to some pc=B4s in Network 1 using : IPTABLES -T NAT
>>-A POSTROUTING -O ETH1 -J MASQUERADE -S WS_IPADDRESS -D 0.0.0.0/0
>>In the linus box I=B4ve got 2 Nic=B4s with the addresses 174.19.4.7 the
>>internal nic and the other with the ip adderess 174.19.4.1 the
>>external directly connected to the modem.
>>Everythig works fine I`ve got internet service in Network 1 in City A.
>>
>>
>>The Goal here is to give internet service to Nerwork 2 using this=20
>>structure.
>>In Network 2 ( City 2 ) the ip addresses have the form 192.1.y.1/24
>>The router has the address 192.1.y.254
>>
>>When I try to make ping from any station from Network1 to Network2
>>I`ve got a response but if a try to make a ping from Network 2 to
>>Netwok 1 I just can get a response from any station except when I
>>try to ping to the Linux Box where the Nat resides so I can configure my =

>>clients in Network2 as I did cause  they need to "see"the linux box.
>>
>>Can some one help me to perform this? or maybe the cuestion should be....=
=20
>>is this configuration posible?
>>
>>Another question is about how to configure my clients in Network 2 to=20
>>provide internet access, do you belive that this configuration using the =

>>cisco has problems?
>>
>>Just in Network 1 I=B4ve got a NT 4.0 using wins and in network 2
>>I=B4ve no serves of any kind just the routers an a workstation with just =
one=20
>>nic.
>>
>>Is my problem about name resolution?
>>
>>Thanks a lot.
>>Edgar Bautista
>>
>>                                                  CITY A            CITY B
>>Internet<--=A6Adsl Modem=A6-=A6RH8.0=A6---- NET1              NET2
>>                                                     =A6                 =
   =20
>>    =A6
>>                                                     HUB               =20
>>HUB
>>                                                     =A6                 =
   =20
>>    =A6
>>                                                   =20
>>CISCO--------------CISCO
>>                                                     1760             =20
>>1751
>>
>

_________________________________________________________________
MSN 8 with e-mail virus protection service: 2 months FREE*=20
http://join.msn.com/?page=3Dfeatures/virus


