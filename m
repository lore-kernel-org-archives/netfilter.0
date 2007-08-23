From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Change ip_conntrack_sip default port
Date: Thu, 23 Aug 2007 20:30:36 +0200
Message-ID: <46CDD24C.8050805@plouf.fr.eu.org>
References: <DIIE.00000AF100044B14@aressi.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <DIIE.00000AF100044B14@aressi.fr>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Sebastien VECTEN a =E9crit :
> =20
> I tried to change the default port of sip_contrack and h323_conntrack
> in iptables. The problem is those conntrack are "hard compiled" in the
> kernel (not as module if not the command "modprobe ip_conntrack_sip
> port=3Dxxxx" is the solution).
> =20
> I would like to know if its possible to change this port (without
> change kernel) when the conntrack is "hard compiled" and especially
> where?

In the bootloader (lilo, grub...) configuration file.

 From linux-2.6.x/Documentation/kernel-parameters.txt :

   Module parameters for loadable modules are specified only as the
   parameter name with optional '=3D' and value as appropriate, such as:

	modprobe usbcore blinkenlights=3D1

   Module parameters for modules that are built into the kernel image
   are specified on the kernel command line with the module name plus
   '.' plus parameter name, with '=3D' and value if appropriate, such as:

	usbcore.blinkenlights=3D1

