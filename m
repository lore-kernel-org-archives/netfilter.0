From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: New not syn (again...)
Date: Fri, 1 Aug 2003 08:57:15 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E16@alderaan.smgtec.com>
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
To: Gavin Hamill <gdh@acentral.co.uk>, netfilter@lists.netfilter.org

Basically the client or the server sends out a FIN or RST to signify
that they are done with the connection. The Conntrack would drop the
session. Afterwards the other side sends out an acknowledgement that the
session was dropped. The packets are flagged as not established, since
the connection from the other side was closed. I think it depends on an
IPTables conntrack timeout value to determine how long to wait for the
other side's response.=20

I don't know what everyone else does about them, but I generally just
drop them It may not be that clean, leaving other PC's IP stacks timeout
the session close, but it happens so rarely to me, *meh*


>My question is regarding syn packets, and probably statefulness... I'm
>getting=20
>a lot of log messages like this:


