From: Marcin Giedz <marcin.giedz@eulerhermes.pl>
Subject: Re: Allow particular website/port
Date: Fri, 11 Feb 2005 08:09:02 +0100
Message-ID: <200502110809.02681.marcin.giedz@eulerhermes.pl>
References: <1108064090.420bb75ac0009@mail.gnvfc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1108064090.420bb75ac0009@mail.gnvfc.net>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Dnia czwartek, 10 lutego 2005 20:34, spdesai@gnvfc.net napisa=B3:
> Hi
>
> I have one linux machine with two NIC cards. One is connected to internet
> and one is private PC. Below is my IP configuration
>
> I have enable ip_forward to 1 in linux machine as well as donw masqared in
> linux.
>
> I can browse the internet as well from window machine.
>
> Now I want to allow/restricted my window machine to access/deny particular
> site/block/messanger ...
>
> i have tried with FORWARD chain but..it restricted all HTTP traffic which=
 i
> dont want.
>
> So pl.  give me the solution.

Iptables is not a solution, check squid

Marcin

>
> Thanks in advance
>
> Suhag
>
> -------------------------------------------------
> This mail sent through IMP: http://horde.org/imp/

