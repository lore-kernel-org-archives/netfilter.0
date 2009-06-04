From: william fitzgerald <wfitzgerald@tssg.org>
Subject: Re: Query: iptables Conflict Policy Avoidance/Reduction
Date: Thu, 04 Jun 2009 17:11:27 +0100
Message-ID: <4A27F22F.4060700@tssg.org>
References: <4A26C566.6050105@tssg.org> <e500aebdd5e68dedc2ece940c037d24e@mail.intra.whb.hu>
Reply-To: wfitzgerald@tssg.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <e500aebdd5e68dedc2ece940c037d24e@mail.intra.whb.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="johab"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Thanks G=C3=A1sp=C3=A1r (aka Swifty),

I was having one of those moments where you think, you think, you did'n=
t grasp=20
something! Like, did I book those flights on the correct days syndrome,=
 so you=20
start doubting yourself ;-)


G=C3=A1sp=C3=A1r Lajos wrote:
> Hi Will.!
>=20
> On Wed, 03 Jun 2009 19:48:06 +0100, william fitzgerald
> <wfitzgerald@tssg.org> wrote:
>> Dear all,
> =20
>> Rule 1: iptables -A FORWARD -i eth+ -s 0/0 -d 192.168.1.2 --dport 80=
 -j
>> ACCEPT
>> Rule 2: iptables -A FORWARD -i eth+ -s 192.168.1.0/24 -d 192.168.1.2
>> --dport 80 -j=20
>> ACCEPT
>>
>> In the above scenario, Rule 2 is REDUNDANT to Rule 1 in that, the so=
urce
> IP
>> of=20
>> Rule 2 is covered by the source IP of Rule 1.
>=20
> Without any NAT-ing the firewall would never see such packets... (Sen=
ding
> packets to the same subnet should not be routed.)
>=20

Agreed. I always make the assumption that NAT-rules are independent of=20
filter-rules and that that NAT up and running. Sorry, I should of made =
that=20
clearer in my original post.

>> However, aren't these generic style rules not considered *best pract=
ice*
>> given=20
>> that the above rules when applied to all interfaces could allow IP
> Spoofing
>> of=20
>> reserved IP address range 192.168.1.0/24
>=20
> IP Spoofing should be done by specifying ALLOWED LOCAL IP ranges (and=
 drop
> everything else) and specifying DISALLOWED REMOTE (private) IP ranges=
 (and
> accept everything else).
>=20

In the below examples you gave, I was trying to think of a quick way to=
 avoid=20
these whereby you implicitly deny these kind of rules with the "default=
 policy".

But I see how allowing all IP addresses (0/0) to a web server for examp=
le is also=20
inclusive of RFC1918, RFC 3330 and NIST-800-41 best practice private-re=
severed IP=20
address countermeasures. And so the need to be implemented on the exter=
nal=20
interface. It was one of those days where I was suffering from brain pa=
ralysis ;-)

> For example in RAW chain PREROUTING table:
>=20
>     $table -P $chain DROP
>=20
>     create_subchain PRE_PPP0
>     $table -A $chain -j $subchain -i $PPP0_IF -d $PPP0_IP
>=20
>      $table -A $subchain -j DROP -s 10.0.0.0/8 -m comment --comment
> 'PRIVATE USE'                       #RFC1918
>      $table -A $subchain -j DROP -s 14.0.0.0/8 -m comment --comment '=
PUBLIC
> DATA NETWORKS'              #RFC1700, page 181
>      $table -A $subchain -j DROP -s 24.0.0.0/8 -m comment --comment '=
CABLE
> TELEVISION NETWORKS'         #NOT SURE!!!
>      $table -A $subchain -j DROP -s 39.0.0.0/8 -m comment --comment
> 'RESERVED'                          #RFC1797
>      $table -A $subchain -j DROP -s 127.0.0.0/8 -m comment --comment
> 'LOOPBACK'                         #RFC1700, page 5
>      $table -A $subchain -j DROP -s 128.0.0.0/16 -m comment --comment
> 'RESERVED'
>      $table -A $subchain -j DROP -s 169.254.0.0/16 -m comment --comme=
nt
> 'LINK LOCAL'
>      $table -A $subchain -j DROP -s 172.16.0.0/12 -m comment --commen=
t
> 'PRIVATE USE'                    #RFC1918
>      $table -A $subchain -j DROP -s 191.255.0.0/16 -m comment --comme=
nt
> 'RESERVED'
>      $table -A $subchain -j DROP -s 192.0.0.0/24 -m comment --comment
> 'RESERVED'
>      $table -A $subchain -j DROP -s 192.0.2.0/24 -m comment --comment
> 'RESERVED'
>      $table -A $subchain -j DROP -s 192.88.99.0/24 -m comment --comme=
nt
> '6to4 RELAY ANYCAST'            #RFC3068
>      $table -A $subchain -j DROP -s 192.168.0.0/16 -m comment --comme=
nt
> 'PRIVATE USE'                   #RFC1918
>      $table -A $subchain -j DROP -s 198.18.0.0/15 -m comment --commen=
t
> 'NETWORK INTERCONNECT'           #RFC2544
>      $table -A $subchain -j DROP -s 223.255.255.0/24 -m comment --com=
ment
> 'RESERVED'
>      $table -A $subchain -j DROP -s 224.0.0.0/4 -m comment --comment
> 'MULTICAST'                        #RFC3171
>      $table -A $subchain -j DROP -s 240.0.0.0/4 -m comment --comment
> 'RESERVED'                         #RFC1700, page 4
>=20
> ...
>=20
>      $table -A $subchain -j ACCEPT
>=20
>=20
>     $table -A $chain -j ACCEPT -i $LAN_IF -s $LAN_NW
>=20
>=20
>=20
>> So in order to avoid spoofing, one has to create the following two r=
ules
>> and apply=20
>> them to specific interfaces.
>> iptables -A FORWARD -i eth1 -s 0/0 -d 192.168.1.2 --dport 80 -j ACCE=
PT
>> iptables -A FORWARD -i eth0 -s 192.168.1.0/24 -d 192.168.1.2 --dport=
 80
> -j
>> ACCEPT
>>
>>
>> Simple Shadowed example:
>>
>> Internet ---> (eth1)Firewall ---> Web Server
>> Partner ---> (eth1) Firewall ---> VPN Server
>>
>> Default Policy: iptables -P FORWARD DROP
>> Rule 1: iptables -A FORWARD -i eth1 -s 0/0 -d webIP --dport 80 -j AC=
CEPT
>> Rule 2: iptables -A FORWARD -i eth1 -s 0/0 -d vpnIP --dport 22 -j DR=
OP
>> Rule 3: iptables -A FORWARD -i eth1 -s partnerIP -d vpnIP --dport 22=
 -j
>> ACCEPT
>>
>> Rule 2 blocks the intended partners access via Rule 3. A simple swap=
 of
>> rule 2 and=20
>> rule 3 prevents this. But why bother with Rule 2 in the first place,
> given
>> the=20
>> default policy is DROP and so there is no way for anyone else other =
than
>> the=20
>> partners to get access (Rule 3). Looking at various example policies=
 on
> the
>> web, I=20
>> find that there are explicitly defined DROP rules in conjunction wit=
h
>> ACCEPT rules=20
>> like rules 2 and 3 above. Its as if, one does not trust the default
> policy.
>=20
> Not just the "no trust" scenario. If you want to speed up the
> firewalling/lower the response ratio then maybe it is usefull to drop=
 some
> packets as soon as possible.=20
>=20
> In my firewall policies I try to find asap the "usefull" rule for the
> packet/connection.
> For example:
>=20
>> I am just wondering, if all rules are applied to specific Interfaces=
,
>> specific=20
>> destination IP address, specific destination ports  and some trust i=
n the
>> default=20
>> policy would a lot of the possible policy conflicts be ruled out?
>>
>> If anyone could provide me with some scenarios/examples to the contr=
ary
>> that would=20
>> be great.
>>
>> It would even be better if I could get a hold of some real firewall
>> policies=20
>> (anonymised internal IP ranges of course).
>=20
> The same rules from above:
>=20
Perfect.

>=20
> Chain PREROUTING (policy DROP 1 packets, 76 bytes)
>  pkts bytes target     prot opt in     out     source             =20
> destination        =20
> 1240K  495M ACCEPT     all  --  lo     *       0.0.0.0/0          =20
> 0.0.0.0/0          =20
>   692 19424 PRE_ETH0   all  --  eth0   *       192.168.255.0/24   =20
> 0.0.0.0/0          =20
> 6996K 6377M PRE_PPP0   all  --  ppp0   *       0.0.0.0/0          =20
> EXTERNAL_IP      =20
> 1669K  514M PRE_MFL1   all  --  mfl1   *       172.31.255.248/29  =20
> 0.0.0.0/0          =20
> 6697K 2227M PRE_BR1    all  --  br1    *       0.0.0.0/0          =20
> 0.0.0.0/0          =20
>  412K  121M PRE_BR2    all  --  br2    *       0.0.0.0/0          =20
> 0.0.0.0/0          =20
> 1667K  385M ACCEPT     all  --  vpn1   *       192.168.10.0/24    =20
> 0.0.0.0/0          =20
>    25 15605 ACCEPT     all  --  vpn2   *       192.168.253.0/24   =20
> 0.0.0.0/0          =20
> 1219K   82M ACCEPT     all  --  vpn-ftp *       172.31.255.1       =20
> 0.0.0.0/0          =20
>    35  1960 PRE_BRS    all  --  brs    *       0.0.0.0/0          =20
> 0.0.0.0/0          =20
>     1    76 LOG        all  --  *      *       0.0.0.0/0          =20
> 0.0.0.0/0           LOG flags 0 level 7 prefix `IPT: RAW PRE '=20
>=20
> Chain PRE_PPP0 (1 references)
>  pkts bytes target     prot opt in     out     source             =20
> destination        =20
>    56  3136 DROP       all  --  *      *       10.0.0.0/8         =20
> 0.0.0.0/0           /* PRIVATE USE */=20
>     0     0 DROP       all  --  *      *       14.0.0.0/8         =20
> 0.0.0.0/0           /* PUBLIC DATA NETWORKS */=20
>     0     0 DROP       all  --  *      *       24.0.0.0/8         =20
> 0.0.0.0/0           /* CABLE TELEVISION NETWORKS */=20
>     0     0 DROP       all  --  *      *       39.0.0.0/8         =20
> 0.0.0.0/0           /* RESERVED */=20
>     0     0 DROP       all  --  *      *       127.0.0.0/8        =20
> 0.0.0.0/0           /* LOOPBACK */=20
>     0     0 DROP       all  --  *      *       128.0.0.0/16       =20
> 0.0.0.0/0           /* RESERVED */=20
>     0     0 DROP       all  --  *      *       169.254.0.0/16     =20
> 0.0.0.0/0           /* LINK LOCAL */=20
>     0     0 DROP       all  --  *      *       172.16.0.0/12      =20
> 0.0.0.0/0           /* PRIVATE USE */=20
>     0     0 DROP       all  --  *      *       191.255.0.0/16     =20
> 0.0.0.0/0           /* RESERVED */=20
>     0     0 DROP       all  --  *      *       192.0.0.0/24       =20
> 0.0.0.0/0           /* RESERVED */=20
>     0     0 DROP       all  --  *      *       192.0.2.0/24       =20
> 0.0.0.0/0           /* RESERVED */=20
>     0     0 DROP       all  --  *      *       192.88.99.0/24     =20
> 0.0.0.0/0           /* 6to4 RELAY ANYCAST */=20
>     1   154 DROP       all  --  *      *       192.168.0.0/16     =20
> 0.0.0.0/0           /* PRIVATE USE */=20
>     0     0 DROP       all  --  *      *       198.18.0.0/15      =20
> 0.0.0.0/0           /* NETWORK INTERCONNECT */=20
>     0     0 DROP       all  --  *      *       223.255.255.0/24   =20
> 0.0.0.0/0           /* RESERVED */=20
>     0     0 DROP       all  --  *      *       224.0.0.0/4        =20
> 0.0.0.0/0           /* MULTICAST */=20
>     0     0 DROP       all  --  *      *       240.0.0.0/4        =20
> 0.0.0.0/0           /* RESERVED */=20
>=20
> ...
>=20
> 6996K 6377M ACCEPT     all  --  *      *       0.0.0.0/0          =20
> 0.0.0.0/0          =20
>=20
>=20
>> It appears to me at least, that creating rules to be more specific t=
han
>> generic,=20
>> while it increases the number rules, is probably a better solution m=
ore
>> likely to=20
>> be free of conflicts.
>=20
> YES! For example if you have to connect a new subnet/network. With ge=
neric
> rules you may have some unwanted side-effects... :D

Agreed ;-)

Two other previous posts I sent yesterday also suffer from the same sho=
rt-term=20
memory delusion ;-)

Thanks for everything,
Will.

>=20
>> Again all feedback is welcome. Perhaps reality is not as black and w=
hite!
>>
>> regards,
>> Will.
>=20
> Swifty
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

--=20
________________________________________
William M. Fitzgerald (MSc, BSc)
PhD Student,
Cork Constraint Computation Centre,
Computer Science Dept.,
University College Cork,
Cork,
Ireland.
----------------------------------------
www.williamfitzgerald.net
www.williamfitzgerald.info
www.linkedin.com/in/williamfitzgerald
http://4c.ucc.ie/web/people.jsp?id=3D143
www.tssg.org/people/wfitzgerald/
________________________________________
