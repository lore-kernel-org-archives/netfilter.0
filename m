From: tahmeed <qs.tahmeed@gmail.com>
Subject: Re: /etc/sysconfig/iptables does not load on reboot
Date: Sat, 2 Jul 2005 11:44:08 +0600
Message-ID: <ab5428f705070122446b6f9966@mail.gmail.com>
References: <NEBBKBPLMLNABNADCIPAEECBBDAB.dleangen@canada.com>
Reply-To: tahmeed <qs.tahmeed@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <NEBBKBPLMLNABNADCIPAEECBBDAB.dleangen@canada.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: dleangen@canada.com
Cc: netfilter@lists.netfilter.org

hello David,

after u configure iptables - directly or via a script issue=20

iptables-save > /etc/sysconfig/iptables

then ur conf will be saved in the mentioned file & be available while
restarting the service or reboot.

else the system will use the default conf that have been set up during
the installation of the system.
and=20

"iptables-restore" :: resets the conf to the system default which
means u lost the conf u just did.

thanks.

On 7/2/05, David Leangen <dleangen@canada.com> wrote:
>=20
> Hello!
>=20
> On FC3, my file /etc/sysconfig/iptables is not being loaded on reboot. Fo=
r
> some reason, my iptables is being loaded with some kind of default values=
.
>=20
> I thought that the file /etc/sysconfig/iptables was supposed to be loaded
> via iptables-restore (and indeed this appears to be so according to the
> startup script in /etc/rc.d/init.d/iptables). Is there something that I a=
m
> not understanding correctly?
>=20
>=20
> Thank you!
>=20
>=20
>=20


--=20
Happy! If not now never

