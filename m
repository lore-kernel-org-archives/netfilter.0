From: Leif Kremkow <kremkow@polytomy.org>
Subject: Re: iptables compile trouble
Date: Wed, 5 Jun 2002 16:03:39 -0400 (EDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.43L0.0206051553300.28012-100000@singularity.polytomy.org>
References: <1023305181.4298.12.camel@billy.demon.nl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <1023305181.4298.12.camel@billy.demon.nl>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: NF ML <netfilter@lists.samba.org>


On 5 Jun 2002, Tony Earnshaw wrote:
> ons, 2002-06-05 kl. 20:29 skrev L.Kremkow:
> Linux, you say. What distro?

I would not like to call what I have a distro... It's based on a SuSE 7.0
install, where I replaced nearly everything I use (kernel and it's
dependencies, make, X, SSL, etc.). I don't use any of the distro specific
stuff, such as YaST.

> Are you trying to compile a distro-specific kernel, or kernel.org kernel
> code?
kernel.org

> If it's a distro kernel, has it put the source code where it's supposed
> to be?
Not applicable.

> How did you configure the kernel:
> - 'make config',
Never.
> - 'make menuconfig'
Usually.
> - 'make xconfig'?
As of late and in this case.

> Does it comprise Netfilter support and have you included this?
It's kernel.org based, so it should be included. As you might have seen
mentioned in the mail, I included netfilter for IPv4 and IPv6, mostly as
modules.

> Have you run 'make pending-patches', or something else?
Yes, as per INSTALL:
make pending-patches KERNEL_DIR=/usr/src/linux/

> Did you do that before compiling your kernel?
Yes.

> What version of gcc are you using?
2.95.2

Regards,,
Leif


