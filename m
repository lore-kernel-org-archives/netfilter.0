From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: What is the diference between ipfw of *bsd and netfilter of
	linux?
Date: Mon, 4 Oct 2004 13:29:36 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E382@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: cmora@gigax.org, netfilter@lists.netfilter.org

Carlos Mario Mora (c4y0) wrote:
> hi!
>=20
> im looking for the diference between ipfw and iptables.   Many people
> say to ipfw is more secure of iptables, but they cant explain why
> that.=20
>=20
> How can i found some documentation to create a document to explain
> thats diferences?
>=20
> Thanks for your help.

When a person says that one firewall is inherently less secure than
another is missing the whole point. YOU make firewalls secure, not the
tools. 'Easy' tools (hw fw's, zonealarm, etc..) make it hard to make bad
decisions but are hard to make special, and optimized solutions. Complex
solutions (cisco,ipfw,netfilter) make it inanely easy to miss-configure
the system, but they allow for specialized and optimal solutions.

Now, on to the question (general notes):

1. ipf is faster than netfilter at a given the task.
2. ipf and netfilter firewall security should be equal. You define it
and they're on the same complexity level, so equal
3. The xBSD kernel may have fewer network flaws than Linux, I'm not sure
but I can imagine so. All in all, this is rare in either case on
dedicated firewall hosts.
4. Netfilter has many extensions that solves niche problems that aren't
possible on xBSD platforms.


