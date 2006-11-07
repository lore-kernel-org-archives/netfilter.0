From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Small doubt from a newbie :)
Date: Tue, 7 Nov 2006 10:25:42 +0100 (CET)
Message-ID: <63384.193.173.147.3.1162891542.squirrel@webmail.sterenborg.info>
References: <45504519.3070907@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45504519.3070907@gmail.com>
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

On Tue, November 7, 2006 09:34, utteerna wrote:
> Hi all,
>
>
> I want to use the iptables "-m random" option.
>
>
> I visited - http://www.netfilter.org/documentati...O-2.html#ss2.1
> <http://www.netfilter.org/documentation/HOWTO/netfilter-extensions-HOWT=
O-2.htm
> l#ss2.1>
>
> to get p-o-m but login failed. Can anyone guide me on how to install th=
is
> patch.

To download a new pom (pom-ng nowadays) go to the Netfilter FTP site
(ftp.netfilter.org/pub/patch-o-matic-ng/) and download it there; one of t=
he
snapshots should do.

> In the iptables source dowloaded from net i see the libipt_random.c but
> when i do a make it doesn't complile to generate a ".so".

You have to configure your kernel to include "random" support and install=
 it.
I just checked but the "random" match is not in 2.4.33.3 or 2.6.18.2 so y=
ou'll
have to patch your kernel for this to work. Then compile and install ipta=
bles.

To patch the kernel:
- untar kernel source
- untar iptables source
- untar pom-ng source
- run:
  KERNEL_DIR=3D/path/to/kernel \
  IPTABLES_DIR=3D/path/to/iptables \
  ./runme extra


Grts,
Rob



