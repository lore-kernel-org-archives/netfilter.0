From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: iptables and device aliases
Date: Wed, 18 Aug 2004 12:33:11 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5679489@alderaan.smgtec.com>
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
To: Dave Warchol <Warchol@harthosp.org>, netfilter@lists.netfilter.org

Dave Warchol wrote:
> I will still need to define the device alias, correct?
> Thanks
> Dave
>=20

The alias is optional. It's useful only if you're using older programs
pre-iproute2. It doesn't serve any purpose in the new system in my
experience.

The alias can NOT used in conjunction with netfilter.

If you define eth0, eth0:0, and eth0:1, then netfilter just interprets
them all as eth0.

