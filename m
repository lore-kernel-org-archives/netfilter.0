From: "J. Bakshi" <joydeep@infoservices.in>
Subject: Re: how to access port forwarded server through internet ?
Date: Wed, 16 Mar 2011 12:50:03 +0530
Message-ID: <20110316125003.47cb0bad@debian>
References: <20110315175928.4dbbe83c@debian>
	<4D7F66A2.1080804@gmail.com>
	<20110315192201.7b139b3f@debian>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110315192201.7b139b3f@debian>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Remzi =?UTF-8?B?QUtZw5xa?= <linuxliste@gmail.com>
Cc: netfilter@vger.kernel.org

Any clue please ?


On Tue, 15 Mar 2011 19:22:01 +0530
"J. Bakshi" <joydeep@infoservices.in> wrote:

> Hello Remzi,
>=20
> Thanks for your kind response. Yes the forwarding is enable as I have=
 it in my script
>=20
> `````````````````
> echo 1 >  /proc/sys/net/ipv4/ip_forward
> `````````````````````
>=20
> But no luck :-( here is the modified rule
>=20
> iptables -A INPUT -p tcp -m tcp --dport 81 -j ACCEPT
> iptables -A PREROUTING -t nat -i ${LAN_IFACE} -p tcp --dport 81 -j DN=
AT --to 192.168.1.2:8080
> iptables -A FORWARD -p tcp -m state --state NEW,ESTABLISHED --dport 8=
1 -i ${LAN_IFACE} -j ACCEPT
>=20
>=20
> On Tue, 15 Mar 2011 15:16:18 +0200
> Remzi AKY=C3=9CZ <linuxliste@gmail.com> wrote:
>=20
> > Hello,
> > forwarding is enable?
> > can you try this;
> >=20
> > #sysctl -w net.ipv4.ip_forward=3D1
> > #iptables -A FORWARD -p tcp -m state --state NEW,ESTABLISHED --dpor=
t 81=20
> > -i ${LAN_IFACE} -j ACCEPT
> >=20
> >=20
> > On 03/15/2011 02:29 PM, J. Bakshi wrote:
> > > Dear list,
> > >
> > > Here is a port forwarding issue.  I have a linux router which hav=
e two NIC; one facing WAN and the other facing LAN. IP forwarding is ac=
tive and this box is working as a gateway. This box has LAN IP 192.168.=
1.1
> > >
> > > There is another box (webserver) 192.168.1.2 within the internal =
network and the router box has port forwarding to access the webserver.
> > >
> > > ```````````````````````````
> > > iptables -A INPUT -p tcp -m tcp --dport 81 -j ACCEPT
> > > iptables -A PREROUTING -t nat -i ${LAN_IFACE} -p tcp --dport 81 -=
j DNAT --to 192.168.1.2:8080
> > > iptables -A FORWARD -p tcp -m state --state NEW --dport 81 -i ${L=
AN_IFACE} -j ACCEPT
> > > ````````````````````````````
> > >
> > > So within LAN I can access the 192.168.1.2 web server through  19=
2.168.1.1:81 as port forwarding is there. But I can not access the same=
 through internet. If I point at<domain-name>:81 throught internet ; th=
e browser simply reports it can't connect to the service; though the ot=
her services running at that very server are quite accessible through i=
nternet. Have I missed something in my firewall rule ? Could anyone giv=
e any clue please ?
> > >
> > > Thanks
> > > --
> > > To unsubscribe from this list: send the line "unsubscribe netfilt=
er" in
> > > the body of a message to majordomo@vger.kernel.org
> > > More majordomo info at  http://vger.kernel.org/majordomo-info.htm=
l
> >=20
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

