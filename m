From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: Problem with nat/OUTPUT/DNAT rule
Date: Fri, 12 Nov 2004 10:04:30 -0800
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F1B44@pxtvjoexd01.pxt.primeexalia.com>
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
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

Ya know, I just read that in some FAQ on the netfilter site.  I did a =
search last night but I guess I either misspelled the search terms or =
the cafine caused me to miss the point. :)
=20
I'm trying to recompile it now.  I have a few problems as my origial =
changes were made the the RPM source files for the RPM build.  The =
primary kernel tree doesn't contain these changes which is probably why =
the compile of iptables didn't pickup the change.
=20
Thanks,=20
=20
Gary
=20

________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of Jason =
Opperisano
Sent: Fri 11/12/2004 9:07 AM
To: netfilter@lists.netfilter.org
Subject: Re: Problem with nat/OUTPUT/DNAT rule



On Thu, Nov 11, 2004 at 11:34:09PM -0800, Gary W. Smith wrote:
> I have been trying to upgrade a RH9 firewall box running 1.2.7a to =
RHEL3.  I applied patch-o-matic pptp-conntrack to the RHEL3 kernel and =
everything "seemed" fine.  I have an automated script that generates =
some baseline firewall rules for some clients.  Anyways, It fails only =
on RHEL3 1.2.7a.  It works on my FC2 and RH9 boxes.
>=20
> The failure always happens on the nat filter, output chain:
>=20
> [0:0] -A OUTPUT -d 66.120.18.34 -j DNAT --to-destination 192.198.0.34
>=20
> Any ideas?

you say you applied a patch from POM and recompiled your kernel.  did
you also rebuild iptables?  IIRC the pptp-conntrack patch changes the
size of the internal structures, so an unpatched iptables will fail to
add rules in this way (usually on a NAT rule).

-j

--
Jason Opperisano <opie@817west.com>



