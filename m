From: "Paul Harlow" <pharlow@skld.com>
Subject: RE: Allowing FTP and internal but nothing else
Date: Wed, 3 Mar 2004 10:54:32 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4A8849EC2E153F41B6CECD20C81BC63BD11E71@wolfcreek.skld.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org=20
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
> Sent: Wednesday, March 03, 2004 10:25 AM
> To: netfilter@lists.netfilter.org
> Subject: Re: Allowing FTP and internal but nothing else
>=20
>=20
> On Wednesday 03 March 2004 5:18 pm, David Cannings wrote:
>=20
> > I am no guru but here is my 2c.
> >
> > > iptables -I INPUT -i eth0 -j ACCEPT
> >
> > This would accept any packet coming in on eth0, this is=20
> fine as long=20
> > as you didn't want to be more restrictive about this interface.
> >
> > > iptables -I INPUT -i eth1 -d port 21 -j ACCEPT
> > > iptables -I INPUT -i eth1 -d port 20 -j ACCEPT
> >
> > Both should be "--dport", "-d" is destination, for hosts. =20
> You'd use=20
> > -d like this:
> >
> > iptables -I INPUT -d 192.168.0.1 -j ACCEPT
> >
> > Your rule above could be rewritten as:
> >
> > iptables -I INPUT -i eth1 --dport 21 -j ACCEPT
>=20
> If you want to specify a port, you must first specify a=20
> protocol.   Only TCP=20
> and UDP use port numbers, therefore the protocol must be one of these.
>=20
> FTP uses TCP, so what you actually want to specify is:
>=20
> iptables -I INPUT -i eth1 -p tcp --dport 21 -j ACCEPT
>=20
> > For FTP, you might like to look into the FTP connection tracking=20
> > helpers. Also, you may well need rules to allow established=20
> or related=20
> > packets.
>=20
> I agree.
>=20
> Regards,
>=20
> Antony.
>=20
> --=20

Thanks gentlemen, I appreciate it.

For now I just want to be able to establish FTP traffic and deny
everything else. My syntax is a throw over from Cisco I'm sure. :)

I've noticed that I had to rearrange the lines as they get entered
somewhat backward from what I am used to. This is what eventually
worked:

iptables -I INPUT -i eth0 -j ACCEPT
iptables -I INPUT -i eth1 -j DROP
iptables -I INPUT -i eth1 -p tcp --dport 21 -j ACCEPT
iptables -I INPUT -i eth1 -p tcp --dport 20 -j ACCEPT

Admittedly this far I have only established connections and not pulled
anything.

I will look into the connection tracking helpers but other than to
simply keep an eye on FTP connections what does the "helpers" part do?=20

