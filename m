From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: iptables and netfilter dependencies
Date: Tue, 28 Oct 2003 08:51:40 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E88@alderaan.smgtec.com>
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
To: =?iso-8859-1?Q?Geffrey_Vel=E1squez?= <g_netfilter@netfids.com>, netfilter@lists.netfilter.org

Yes, the userspace tool is dependent on the kernel version of Netfilter =
installed along the lines of pppd and pcmcia-cs.

You should install the userspace tools to different directories if you =
need multiple copies of the tool on your system.

EG: Current --prefix=3D/
2.4.20-20.9 --prefix=3D/usr/local/iptables/2.4.20-20.9

Then in your firewall scripts, you could have something like:

if [ "`uname -v`" =3D "2.4.20-20.9" ]; then
   PREFIX=3D"/usr/local/iptables/2.4.20-20.9"
else
   PREFIX=3D"/"
fi

IPTABLES=3D$PREFIX/bin/iptables

$IPTABLES -P INPUT ...


You could make it even more generic, but that is probably just overkill =
for what you are trying to solve.

