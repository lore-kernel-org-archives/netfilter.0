From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: Re: AW: patch-o-matic question.
Date: Wed, 11 Sep 2002 11:24:44 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209111124.44719.roy@karlsbakk.net>
References: <MCBBJCMMKGNGCAHNCFNAIEKHCFAA.carsten@cphome.netz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <MCBBJCMMKGNGCAHNCFNAIEKHCFAA.carsten@cphome.netz>
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
To: hannespaul@gmx.net, Carsten <carsten.puhl@web.de>, netfilter@lists.samba.org

On Tuesday 10 September 2002 14:54, Carsten wrote:
> Set the environment variable before the command:
> KERNEL_DIR=3D/usr/src/linux-2.4 ./runme pending
> or:
> export KERNEL_DIR=3D/usr/src/linux-2.4
> ./runme pending

then - it won't work. it still tells you it's not set

so - change the documentation

--=20
Roy Sigurd Karlsbakk, Datavaktmester
ProntoTV AS - http://www.pronto.tv/
Tel: +47 9801 3356

Computers are like air conditioners.
They stop working when you open Windows.


