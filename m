From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: =?KOI8-U?Q?Re=3A_How_do_you_correctly_interpret_the_?=
 =?KOI8-U?Q?FORWARD_chain_interface__options=3F_From=3A_=F0=CF?=
 =?KOI8-U?Q?=CB=CF=D4=C9=CC=C5=CE=CB=CF_=EB=CF=D3=D4=C9=CB_=3Ccasper=40?=
 =?KOI8-U?Q?meteor=2Edp=2Eua=3E_X-Virus-Status=3A_Clean_Sender=3A_?=
 =?KOI8-U?Q?netfilter-owner=40vger=2Ekernel=2Eorg_X-Mailing-List=3A_n?=
 =?KOI8-U?Q?etfilter=40vger=2Ekernel=2Eorg?=
Date: Tue, 09 Feb 2010 17:36:36 +0100
Message-ID: <4B718F14.2000105@chello.at>
References: <ac5c74141002090517o5463ed02i3b8c52b553bb462d@mail.gmail.com>	 <56378e321002090525p44cfe5a4u3f1c89a355f78322@mail.gmail.com>	 <ac5c74141002090723l73bd7ccva8b9e214fe33badc@mail.gmail.com> <1265731072.3930.41.camel@casper.meteor.dp.ua>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1265731072.3930.41.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: netfilter@vger.kernel.org

On 09.02.2010 16:58, netfilter-owner@vger.kernel.org wrote:
> =F7 =F7=D4=CF, 09/02/2010 =D7 15:23 +0000, paddy joesoap =D0=C9=DB=C5=
=D4:
>> On Tue, Feb 9, 2010 at 1:25 PM, Richard Horton <arimus.uk@googlemail=
=2Ecom> wrote:
>>> On 9 February 2010 13:17, paddy joesoap <paddyjoesoap@gmail.com> wr=
ote:
>>>> Hi All,
>>>>
>>>> How should one interpret the inbound ("-i") and outbound ("-o") of=
 the
>>>> FORWARD chain.
>>>>
>>>
>>>
>>> -i refers to the interface the packet is received on.
>>> -o refers to the interface the packet is routed out on.
>>>
>>>
>>
>> Does this mean that both versions below are equivalent or at least d=
o
>> the same job?
>=20
> Not at all.
>=20
>> (1)
>>
>> iptables -A FORWARD -i eth0 -p tcp -d webServIP -j ACCEPT
>=20
> This rule will match packets sent from "client" to a webServIP.
>=20
>> iptables -A FORWARD -o eth1 -p tcp -s webServIP -j ACCEPT
>=20
> Considering that webServIP located in network connected to eth1, this
> rule will not match because packets sent out to eth1 cannot have
> webServIP as source address.
>=20
>> Because a packet will enter eth0 for internal network and a packet
>> will leave eth1 (pushed towards eth0).
>>
>> (2)
>>
>> iptables -A FORWARD -i eth0 -p tcp -d webServIP -j ACCEPT
>=20
> This rule will match packets sent from "client" to a webServIP.
>=20
>> iptables -A FORWARD -o eth0 -p tcp -s webServIP -j ACCEPT
>=20
> This rule will match packets sent from webServIP to "client".
>=20
>> Because a packet will enter eth0 to be forwarded internally and a
>> packet will also enter eth0 when leaving the network.
>=20
> When packet enters and leaves one interface (eth0) it isn't actually =
a
> routing.
>=20
> Considering that webServIP located in network connected to eth1 and
> clients talking to the server located in network connected to eth0 yo=
u
> can use those rules:
>=20
> iptables -A FORWARD -i eth0 -p tcp -d webServIP -j ACCEPT
> iptables -A FORWARD -o eth1 -p tcp -d webServIP -j ACCEPT
> iptables -A FORWARD -i eth0 -o eth1 -p tcp -d webServIP -j ACCEPT
>=20
> Those 3 rules will do the same job each, you can use either of them.
> They will match packets sent from "clients" to "server".
>=20
> iptables -A FORWARD -i eth1 -p tcp -s webServIP -j ACCEPT
> iptables -A FORWARD -o eth0 -p tcp -s webServIP -j ACCEPT
> iptables -A FORWARD -i eth1 -o eth0 -p tcp -s webServIP -j ACCEPT
>=20
> This 3 rules will do the same job each, you can use either of them. T=
hey
> will match packets sent from "servers" to "clients".
>=20
> As you probaly already know each connection of client to server sends
> packets in both direction regardless of what you are doing, downloadi=
ng
> or uploading.
>=20
> For example if you want to only allow web traffic (port 80) from
> "clients" for "server" you would have to use rules like this:
>=20
> iptables -A FORWARD -i eth0 -o eth1 -d webServIP -p tcp --dport 80 -j
> ACCEPT
> iptables -A FORWARD -i eth1 -o eth0 -s webServIP -p tcp --sport 80 -j
> ACCEPT
>=20
Hello,

taking the provided scenario (web-server), it's most likely not wise no=
t
to use the features of conntrack. actually if you do not use conntrack
for the webserver, it would be advisable to set those packets to NOTRAC=
K
in the raw table, thus saving system resources.

Now if one decides to use conntrack, place a rule (on top) into the
=46ORWARD chain allowing established (most likely also RELATED) traffic=
=2E

To allow the webserver traffic, all one has to do is, allow state NEW
traffic with destination IP of the web-server.

Now what interface to use within the rule?
Well for a firewall/router with one external and one internal (dmz)
interface, one might specify a match using both interfaces:
-i external_nic -o internal_nic

that will perfectly match the desired packets.
But if the network extends, you may have to rewrite those rules.
i.e. the network now has a second internet upstream provider and anothe=
r
LAN.

=46or that case, one would need to duplicate those rules for every inte=
rface.

Now if you write your rules like this, they still match the desired
packets, but result in a faster and shorter rule-set:

-P FORWARD DROP
-A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
-A FORWARD -o $DMZ_IF -d $WEB_SERVER -m state --state NEW -p tcp --dpor=
t
80 -j ACCEPT

No matter from which external or internal interface the request/reply
came, the rules will match in a secure manner.

Best regards

Mart
