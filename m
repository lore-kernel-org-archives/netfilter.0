From: "Ross A. Del Duca" <RDelDuca@corelogic.com>
Subject: RE: Problems configuring iptables
Date: Wed, 23 Aug 2006 09:23:26 -0700
Message-ID: <580B00011E6B2F4980CAC67A08FECC3AF765CE@rpo.oldplacerville.csvaluation.lan>
References: <44EC78F7.4010106@ncemch.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
In-Reply-To: <44EC78F7.4010106@ncemch.org>
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
To: Matt Singerman <msingerman@ncemch.org>, netfilter@lists.netfilter.org

The 'hanging' is likely a result of a DNS lookup failing.  If you add -n =
to
your iptables command, it will not attempt to resolve DNS names, and may =
get
you around at least that little part.


Ross A. Del Duca, GCIH
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Matt Singerman
> Sent: Wednesday, August 23, 2006 8:49 AM
> To: netfilter@lists.netfilter.org
> Subject: Problems configuring iptables
>=20
> < SNIP >

> Also, if I try to add a rule to allow, say, SSH traffic to a specific
> machine behind the firewall, I run into other problems.  If I type:
>=20
> iptables -A FORWARD -s 0/0 -d w.x.y.z -p tcp --dport 22 --syn -j =
ACCEPT
>=20
> This is, so far as I am aware, the format I would use.  However, when =
I
> type iptables -L, the list just hangs just before listing that rule.
>=20
> Can anyone offer any pointers as to what I may be doing wrong, and =
what
> I can do to get this working?  Thanks!
>=20
> Regards,
>=20
> Matt


