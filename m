From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Isolate a legacy machine
Date: Fri, 17 Oct 2003 14:03:10 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C50F@wardrive.citadelcomputer.com.au>
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
To: "Ringer, Torleiv" <tringer@mpr.org>, netfilter@lists.netfilter.org

Wouldn't it be better to run HA linux (www.linux-ha.org) which was meant =
for failover?

Otherwise put the 2 machine on a DMZ and DNAT to the live one until it =
falls over and then flick to the back machine...???? no???

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au
=20

> -----Original Message-----
> From: Ringer, Torleiv [mailto:tringer@mpr.org]
> Sent: Friday, 17 October 2003 8:02 AM
> To: netfilter@lists.netfilter.org
> Subject: Isolate a legacy machine
>=20
>=20
> Hi there,
>=20
> I am not exactly sure how this needs to be done...
>=20
> I have a legacy machine that I need to isolate from our LAN.=20
> Network access to this machine will be limited to port=20
> forwarding of telnet, and a limited FTP access that will only=20
> be initiated locally on a proxy machine (which will also run=20
> the iptables).
>=20
> Let's say that the legacy machine currently has address=20
> 10.2.1.100, and I would like my proxy/firewall to have the=20
> same address. I will be unplugging the legacy machine from=20
> the LAN, then assigning the proxy/firewall the same IP.
>=20
> Can I isolate the 100 machine from the LAN, and keep the same=20
> IP? I need to do this for failover, so that if the proxy box=20
> goes down, I can just unplug the 100 machine from the=20
> proxy/firewall, and plug it back into the LAN. I would also=20
> be unplugging the proxy/firewall from the LAN at this point.
>=20
> Can I port forward telnet from the LAN (eth0) side to the=20
> legacy (eth1) side where both the proxy machine and the=20
> legacy machine have the same IP but are isolated from each=20
> other? Is this impossible?
>=20
> Torleiv Ringer
> IT Support
> Minnesota Public Radio
> http://www.mpr.org
>=20
>=20
>=20

