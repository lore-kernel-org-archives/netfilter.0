From: lst_hoe01@kwsoft.de
Subject: Re: SMTP Nating required?
Date: Wed, 23 Feb 2005 14:30:29 +0100
Message-ID: <1109165429.421c857533bf0@webmail.kwsoft.de>
References: <20050223122835.7C74F51F6A@mailin.kwsoft.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20050223122835.7C74F51F6A@mailin.kwsoft.de>
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

Zitat von Nitin Mandolkar <nitin.mandolkar@absarcagen.com>:

> Dear Net Filter Team.
>
>
>
> Subject : SMTP Nating required?
>
>
>
> AS we install Squid proxy server on red Hat Linux 9.
>
> Squid is working fine on Linux machine and doing his
>
> Job good.
>
>
>
> But on client machine when we configure outlook express
>
> With SMTP server as mail.xyz.com and pop3 server as pop.xyz.com
>
> It is not resolving that names. It is giving the error. But with Web ma=
il
> client
>
> I can check my mail.
>
>
>
> How can I resolve this problem..

You need a working DNS to resolve the names. If your Squid box can resolv=
e
install a caching NS and point your clients to this machine. So far nothi=
ng
related to iptables/netfilter??

Regards

Andreas


