From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: SNAT
Date: Thu, 3 Apr 2003 10:34:35 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122DAF@alderaan.smgtec.com>
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
To: "Rio Martin." <rio@martin.mu>, netfilter@lists.netfilter.org

1. You are using aliases, which IPTables does not use. Please use look
into IPRoute2 on the net on how to setup proper IPRoute2 bindings.

2. Add an SNAT rule on the postrouting -o <internet_iface> pointing to
64.1.1.2

-----Original Message-----
From: Rio Martin. [mailto:rio@martin.mu]=20
Sent: Thursday, April 03, 2003 2:29 AM
To: netfilter@lists.netfilter.org
Subject: SNAT

Dear folks,
I need help to modify the source ip for every irc connection coming from
my
clients.

Eg:

eth0    =3D 64.1.1.1
eth0:1 =3D 64.1.1.2
eth0:2 =3D 192.168.1.1


My clients is in 192.168.1.0/24. Right now all connection to irc server
is
using ip 64.1.1.1
I want to modify, so all irc connection is using 64.1.1.2

Thanks for helping me ...

Regards,
Rio Martin.




