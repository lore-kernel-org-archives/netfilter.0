From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: Performance problems on my firewall using
	iptables	(SuSEfirewall2)
Date: Mon, 14 Nov 2005 07:53:31 -0500
Message-ID: <FAC4E024BF776842876169173CE2F01309A5E0@mailbox.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Marc Green <marc.green@skynet.be>, netfilter@lists.netfilter.org

=20

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Marc Green
> Sent: Wednesday, November 09, 2005 3:03 PM
> To: netfilter@lists.netfilter.org
> Subject: Performance problems on my firewall using iptables=20
> (SuSEfirewall2)
>=20
> Find herewith the result of the "iptables-save" command.
>=20
> Some notes :
> For Derick :
> =3D=3D> Yes I'm running a graphical interface. But nobody logs on=20
> this system except me sometimes to do administration.
> =3D=3D> In the first mail that is right there was no files=20
> attached with it.
> I prefered not to sent them (after typing it but forgot to erase the
> text) no to overload the list with info that might not be necessary.
> =3D=3D> 2 internal networks on the same interface: on one of the=20
> networks I have the children computers. With crontab I just=20
> bring one network down at a specific time to shutdown=20
> Internet access for the kids but not for me.
>=20
> Many thanks for your concern(s).


Sorry for a very late reply. Your ruleset is not obscenely large,
however it does seem to be more complicated than necessary for a home
firewall. There are well over 200 rules here and from skimming them I
would have to say that some unnecessary, particularly with a default
DROP policy on INPUT and FORWARD. Generally it's only necessary to drop
subnets you don't like before accepting ports and bad TCP packets
(invalid state, NEW without --syn, and so on).

Having only used a Linux GUI under extreme duress, I don't know how much
the difference in memory usage is logged-in vs. logged off, however I
would conjecture that a GUI adds a considerable footprint to your memory
space. 94MB of RAM (96 - 2 for video?) is not very much, I run a much
simpler firewall with 128MB (Debian, no GUI, very spartan) and that is
cutting it close for me. Also, my firewall is 2.0Ghz, not 200Mhz. It may
simply be that your computer is too slow - I wouldn't run a firewall on
anything less than a PIII/equivalent with 128MB of RAM, no matter what
size.

You should also know (if you don't already) that iptables processes
rules linearly, so each one you add makes a difference.

Derick Anderson


