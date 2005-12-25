From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: string replacement help
Date: Sun, 25 Dec 2005 13:48:56 +0100 (CET)
Message-ID: <16674.80.127.73.119.1135514936.squirrel@webmail.sterenborg.info>
References: <20051224141758.GG18594@minastirith.hsd1.md.comcast.net>
	<20051225054543.45473.qmail@web35913.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051225054543.45473.qmail@web35913.mail.mud.yahoo.com>
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

On Sun, December 25, 2005 06:45, Noman Liaquat wrote:
> Hello Mike,
>
> I am using RedHat EnterPrise Linux version#4
> kernel.version=3Dlinux-2.6.14.4
> I am using the patch of
> matic-nghttp://max.kellermann.name/projects/netfilter/h323.html
...
> its confirm that i got the option of string when i did
>
> [root@mail lib]# iptables -m string -h
> STRING match v1.3.4 options:

As you can read, this is a string *match*.

> --from                       Offset to start searching
> from
> --to                         Offset to stop searching
> --algo                        Algorithm
> --string [!] string          Match a string in a
> packet
> --hex-string [!] string      Match a hex string in a
> packet
>
> but not showing the replacement option of
> --replace-string.

AFAIK you cannot alter things with match modules.

> i think there is need of patch but from which place i
> can easily get the patch and how i can patch it.

Umm.. Soo.. What are you saying here ?
You want someone to create a patch that allows you to alter strings
using Netfilter and put it online so you can download it ?


Gr,
Rob



