From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: Two links and a SMTP sever.
Date: Tue, 18 Jan 2005 15:54:39 -0500 (EST)
Message-ID: <26550.142.169.215.10.1106081679.squirrel@142.169.215.10>
References: <d645356050118053928226673@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <d645356050118053928226673@mail.gmail.com>
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
To: Ulysses Almeida <ulysses.almeida@gmail.com>
Cc: netfilter@lists.netfilter.org

On Tue, January 18, 2005 8:39 am, Ulysses Almeida said:
> Hi folks,

Hi Ulysses!

>
>   I have an unsolved problem with iptables + iproute2 that I can't
> figure out how to solve it.

(After looking attached file)
Did you enable NAT of local connection in your kernel ?
To be honest, I don't know anything about Lartc. And can't tell you
how it should behave (my guess is it should pickup the right IP, of cours=
e)

However, the (ugly) SNAT work-around should work with
NAT of local connection enabled.

>
>   I explaint it on the attachment (i sent this attachment, because I
> don't thin it will cause any trouble, since it's text/plain, if does,
> say and I won't send again).

Please put it in the body so we can comment some part.

>   If some one can help-me track this problem, I thank in advance.
>
>   Regars.
>
> --
>  - Ulysses Almeida
>

HTH,

Samuel


