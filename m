From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: PPTP
Date: Tue, 28 Oct 2003 09:00:00 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E89@alderaan.smgtec.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: ralf@4linux.com.br, netfilter@lists.netfilter.org

I don't remember FreeSwan having PPTP, but if it does then great. Are =
you sure it isn't L2TP that the clients are connecting with?

Anyways, you will have to modify your kernel with Patch-O-Matic from the =
Netfilter CVS repository, and grab the userspace tools just in case you =
need to use those ones with your newly created kernel. The support for =
PPTP is still rather experimental. I haven't had problems with their =
latest code though.

Apply any patches in Patch-O-Matic that apply to pptp and GRE.
Recompile kernel
Build Userspace tools from CVS
Reboot
# depmod
# modprobe ip_conntrack_proto_gre
# modprobe ip_conntrack_pptp
# modprobe ip_nat_proto_gre
# modprobe ip_nat_pptp


Ideally, this should allow for multiple PPTP clients through your =
firewall at the same time.


-----Original Message-----
From: Ralf Braga [mailto:ralf@4linux.com.br]=20
Sent: Tuesday, October 28, 2003 8:37 AM
To: netfilter@lists.netfilter.org
Subject: PPTP

Hi Friends,

A have a Gateway Gnu/Linux, Debian 3.0 rc1  with kernel 2.4.22, iptables =

1.2.8-8 and freeswan 2.02 in S=E3o Paulo and i have another Linux in=20
Rio-de-Janeiro with Red-Hat 6.2, ipchains and the path-pptp. Clients in=20
S=E3o Paulo have to conect in Rio-de-Janeiro throught PPTP and the =
problem=20
its that the Server in Rio accepts only one connection.

In my Firewall here in S=E3o Paulo i'm put only one rule just to do the =
tests:

iptables -t nat -A POSTROUTING -j MASQUERADE

The chains in my FIREWALL are ACCEPT

Have I enable any rule or patch in kernel ?

I would like to know whats going on, cause the server in RIO just ACCEPT =

one connection. There is something that should i do? ... rules... path=20
in my kernel.....



Thank you very much





