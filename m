From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: MAtching packets
Date: Thu, 30 Oct 2003 12:51:55 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A28AC90@wardrive.citadelcomputer.com.au>
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
Content-Type: text/plain; charset="us-ascii"
To: eturner@monash.edu.my, netfilter@lists.netfilter.org

not sure but don't you need something patched/enabled in the kernel to =
allow the marked packets to work with tc??

something possibly like this?

[*]       IP: use netfilter MARK value as routing key

or something..

Thanks,
____________________________________________
George Vieira

> -----Original Message-----
> From: Edmund Turner [mailto:eturner@monash.edu.my]
> Sent: Thursday, 30 October 2003 12:34 PM
> To: netfilter@lists.netfilter.org
> Subject: MAtching packets
>=20
>=20
>=20
>=20
> Hey guys and girls, how ur day?
> I got a slight problem configuring tc on my firewall (traffic=20
> control).
> Before I get kicked out the door and sent to the LARTC forum, I would
> like to add that the problem im facing is MARKING the packets via
> iptables.
>=20
> Situation is as such
> LAN --> Firewall --> Router -->Internet
> 		|
> 		|
> 		--> DMZ
>=20
> So much for the Ascii artist in me. :)
> The firewall has 3 interfaces:
> Eth0 =3D LAN --> 100Mbps NIC
> Eth1 =3D DMZ --> 100Mbps NIC=20
> Eth2 =3D Internet --> 4MB link to internet
>=20
> Background:
> DMZ Zone Eth1: Web/FTP, and SMTP servers. (100Mbps switches and NICs)=20
> WEB/FTP server :10.100.1.1/24
> SMTP server:10.100.1.2/24
>=20
> I need to mark packets for the LAN (192.168.0.0/16) to the DMZ server
> (10.100.1.1) to classify them in classes.
>=20
> This is what I tried :
> /sbin/iptables -A PREROUTING -i eth1 -d 10.100.1.1 -t mangle -j MARK
> --set-mark 9
> /sbin/iptables -A PREROUTING -i eth1 -s 10.100.1.1 -t mangle -j MARK
> --set-mark 9
>=20
>=20
> Traffic control does not seem to work when I mark the packets=20
> as above.
> It appears that the 'tc' does not recognize the marked packets. I
> eventually marked them like this :
>=20
> Tc filter add dev eth2 parent 2:1 protocol ip prio 7 u32 match ip src
> 10.100.1.1 classid 2:1
>=20
> I would hope someone could point out my error in marking the packets.
>=20
> Another question, there shouldn't be any problem with marking=20
> different
> IPs with the same numerical mark, right?
> Eg:
>=20
> /sbin/iptables -A PREROUTING -i eth1 -d 10.100.1.1 -t mangle -j MARK
> --set-mark 9
> /sbin/iptables -A PREROUTING -i eth1 -d 10.100.1.2 -t mangle -j MARK
> --set-mark 9
>=20
> Any help is appreciated!
>=20
>=20
> Regards
> edmund
>=20
>=20
>=20

