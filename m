From: Rowan Reid <rreid@studio3arc.com>
Subject: RE: Measuring traffic
Date: Fri, 13 Sep 2002 10:27:38 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002901c25b4a$db9a5f70$6b01a8c0@s3ac>
References: <002801c25b47$b8007ac0$6b01a8c0@s3ac>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <002801c25b47$b8007ac0$6b01a8c0@s3ac>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1252"
To: 'dizma' <nick@riskeng.bg>, netfilter@lists.netfilter.org


Disregard ...
=20
Rowan Reid
Job Captain,=20
Systems Administrator
STUDIO 3 ARCHITECTS
909  982  1717


> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org=20
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Rowan Reid
> Sent: Friday, September 13, 2002 10:05 AM
> To: 'dizma'; netfilter@lists.netfilter.org
> Subject: RE: Measuring traffic
>=20
>=20
>=20
>=20
> Hi,
>=20
> Thanks for the recommendation, Since you suggested I figured=20
> I would ask. D you have a sampl ipac.conf file. The source=20
> file and compile didn=92t' create one and I'm having a hard=20
> time understanding the  exaple . See insert.
>=20
> INSTALLATION / CONFIG FILE.
>=20
> The ipac.conf file is '/etc/ipac-ng/ipac.conf'. ipac.conf=20
> controls what data is collected. Each line which begins with=20
> a '#' is ignored. All the other lines have the format
>=20
>   Name of rule|direction|interface|protocol|source|destination
>=20
>   where
>   Name of rule          Any string to identify this rule
>   direction             'in' or 'out'
>   interface             ip number or interface name or empty
>   protocol              'tcp' or 'udp' or 'icmp' or 'all'
>   source                \
>   destination           both as described in ipfwadm(8), or empty
> =20
> In the summaries, the 'Name of rule' string identifies the=20
> counter. Both the source and destination must be in=20
> ipfwadm/ipchains syntax - consult the man page.
>=20
> The interface can be named (for example, eth0) or its IP=20
> number can be given. Linux IP accounting always counts at one=20
> interface or at any interface. The direction means in or out=20
> of this interface.
>=20
> * You must run the fetchipac -S after changing the=20
> * ipac.conf file every time for the changes to take effect!
>=20
> An example ipac.conf file comes with the distribution.
>=20
> Cant' find it anywhere in the source
>=20
> > try ipac-ng packet
> >=20
> > http://sourceforge.net/projects/ipac-ng/
> >=20
>=20
>=20


