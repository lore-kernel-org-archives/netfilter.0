From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Configuration problem..
Date: Wed, 4 Jun 2003 08:32:10 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6DA4@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: edgar bautista <edgar_bautista@hotmail.com>, netfilter@lists.netfilter.org

I would say to get rid of the cisco box and put a linux box with IPSEC =
between the 2 networks... that's what I did with my 1700 ;) It became =
redundant once I got RedHat 7.1 onto the firewall and used DNAT/SNAT.... =
the router become just a router and wasted an external IP...=20

PS: Got confused with your ascii art. too early in the morning for me.. =
;)

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

-----Original Message-----
From: edgar bautista [mailto:edgar_bautista@hotmail.com]
Sent: Wednesday, June 04, 2003 3:08 AM
To: netfilter@lists.netfilter.org
Subject: Configuration problem..


>>Hi there!!
>>I=B4ve got the next configuration, so let me try to explain my ascii =
art.
>>
>>In city A I=B4ve  on my netwok 1 the IP=B4s 192.1.x.1/24
>>The  1760 Router has the ip 192.1.x.254
>>In this side I use a red hat 8.0 with nat and i use it to give
>>internet access to some pc=B4s in Network 1 using : IPTABLES -T NAT
>>-A POSTROUTING -O ETH1 -J MASQUERADE -S WS_IPADDRESS -D 0.0.0.0/0
>>In the linus box I=B4ve got 2 Nic=B4s with the addresses 174.19.4.7 =
the
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
>>try to ping to the Linux Box where the Nat resides so I can configure =
my=20
>>clients in Network2 as I did cause  they need to "see"the linux box.
>>
>>Can some one help me to perform this? or maybe the cuestion should =
be....=20
>>is this configuration posible?
>>
>>Another question is about how to configure my clients in Network 2 to=20
>>provide internet access, do you belive that this configuration using =
the=20
>>cisco has problems?
>>
>>Just in Network 1 I=B4ve got a NT 4.0 using wins and in network 2
>>I=B4ve no serves of any kind just the routers an a workstation with =
just one=20
>>nic.
>>
>>Is my problem about name resolution?
>>
>>Thanks a lot.
>>Edgar Bautista
>>
>>                                                  CITY A            =
CITY B
>>Internet<--=A6Adsl Modem=A6-=A6RH8.0=A6---- NET1              NET2
>>                                                     =A6               =
     =20
>>    =A6
>>                                                     HUB               =
=20
>>HUB
>>                                                     =A6               =
     =20
>>    =A6
>>                                                   =20
>>CISCO--------------CISCO
>>                                                     1760              =

>>1751
>>
>

_________________________________________________________________
MSN 8 with e-mail virus protection service: 2 months FREE*=20
http://join.msn.com/?page=3Dfeatures/virus



