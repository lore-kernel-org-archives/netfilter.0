From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: Fedora 3 + netfilter 1.2.11 + FXP
Date: Mon, 7 Mar 2005 13:03:23 +0100
Message-ID: <C530C43619DA8F459D7A1A4DADE00EB1DD13@knowledge.wizdom.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: netfilter@lists.netfilter.org

Hello,

=20

I am running a standard installation of Fedora Core 3 (2.6.10-1.770.FC3)
& netfilter 1.2.11

=20

Is there anybody here that can give me an answer to the following
question:

Is it possible to enable FXP in this configuration? (above config, no
new kernel compiling, patching etc)

=20

If possible, how can I enable it?

=20

I tried putting add options ip_conntrack_ftp fxp=3D1 in =
/etc/modules.conf,
but this doesn't help

=20

Spent all morning wading through the web and all the years old
documentation available, but I haven't found what I was looking for.
Found some stuff about this ftp-fxp patch, but that too seems legacy for
very old version.

=20

Greets,

Sietse

=20

