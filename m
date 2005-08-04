From: Jason Opperisano <opie@817west.com>
Subject: Re: IP forwarding
Date: Thu, 4 Aug 2005 15:33:02 -0400
Message-ID: <20050804193302.GA6965@bender.817west.com>
References: <286cf082050803183749d1f514@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <286cf082050803183749d1f514@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Wed, Aug 03, 2005 at 07:37:43PM -0600, Ricardo J. M=E9ndez wrote:
> Hi,
>=20
> I've got a network setup where the internal router is a Linux box
> running iptables.  External interface is eth0, internal eth1.  I'm
> attempting to forward an external IP address (say, 1.2.3.4) to an
> internal machine.
>=20
> The rule I added is:
>=20
> iptables -t nat -A PREROUTING -d 1.2.3.4 -p tcp --dport 80 -j DNAT
> --to 192.168.1.202
>=20
> However, attempting to=20
>=20
> telnet 1.2.3.4 80
>=20
> does not work.  It's clear that the rule is being applied, because the
> web server running on the external machine is not responding unless I
> telnet from the router itself, but unfortunately I'm not getting into
> 192.168.1.202 either.  Attempting to
>=20
> telnet 192.168.1.202 80
>=20
> does work as expected.
>=20
> What am I missing?  Any pointers are welcome.  Thanks,

http://marc.theaimsgroup.com/?l=3Dnetfilter&m=3D112110769302639&w=3D2

-j

--=20
Jason Opperisano <opie@817west.com>

