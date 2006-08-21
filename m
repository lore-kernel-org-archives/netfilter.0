From: former03|Baltasar Cevc <baltasar.cevc@former03.de>
Subject: Re: iptables issue after kernel compilation
Date: Mon, 21 Aug 2006 15:38:56 +0200
Message-ID: <9374633F6174C62418B67B27@Buna.local>
References: <20060821131619.11631.qmail@web38608.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060821131619.11631.qmail@web38608.mail.mud.yahoo.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="macroman"; format="flowed"
To: john melon <johnmelond@yahoo.com>, netfilter@lists.netfilter.org

Hi John,

--On 21. August 2006 06:16:19 -0700 john melon <johnmelond@yahoo.com> =
wrote:

>  FATAL: Module ip_tables not found.
>  iptables v1.3.5: can't initialize iptables table
> `filter': iptables
> who? (do you  need to insmod?)
>  Perhaps iptables or your kernel needs to be upgraded.

Have you compiled the netfilter code as module or statically?

In case it's modular, you'd have to insert the modules using insmod. Have=20
you activated network packet filtering when configuring your kernel?

That error clearly states that it's a problem with the kernel.

Baltasar


Baltasar Cevc

_____ former 03 gmbh
_____ infanteriestra=C3=9Fe 19 haus 6 eg
_____ D-80797 muenchen

_____ http://www.former03.de


