From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: loadbalancing for firewall
Date: Tue, 12 Aug 2003 08:54:53 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030812125453.GB14135@cannon.eng.us.uu.net>
References: <192353F2A074154C82068805541676F28A5ED3@mailhost.sqli.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <192353F2A074154C82068805541676F28A5ED3@mailhost.sqli.com>
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
To: =?iso-8859-1?B?Suly9G1l?= GAUTHIER <JGAUTHIER@sqli.com>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

On Tue, Aug 12, 2003 at 12:35:00PM +0200, J=E9r=F4me GAUTHIER wrote:

> Hi,
>=20
> first sorry for my english !!

No worries...

>=20
> I want to make a loadbalancing cluster of 2 firewall on redhat 8.0.
>=20
> each firewall have 5 interface.
>     -Lan interface
>     -DMZ interface=20
>     -External interface
>     -RAS
>     -semi-private
>=20
> I use keepalived for manage vrrp.
>=20
> Does keepalived can do loadbalancing ?? ( there is no realserver )

VRRP has nothing to do with loadbalancing. Or maybe I missed your questio=
n.

> if yes, where find some sample configuration
> if not, what product can i use ?

Take a look at the iproute2 package...

Ramin

>=20
> Thanks a lot !
>=20
>=20
> Best Regards
>=20
> jerome=20

