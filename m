From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Traffic Shaping
Date: Wed, 27 Nov 2002 21:21:12 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211272121.12644.netfilter@newkirk.us>
References: <C01FA3FA475FB04AA54D083D5E637EE10BE34D@siscannet.sispro.com.br>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <C01FA3FA475FB04AA54D083D5E637EE10BE34D@siscannet.sispro.com.br>
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
To: Juliano Murlick <jumurlick@sispro.com.br>, "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

On Wednesday 27 November 2002 12:24 pm, Juliano Murlick wrote:
>     Hello,
>     Anybody knows if there is some module for netfilter that works like
> traffic shaper ? i am trying to shaper my traffic but in dinamic way, n=
ot
> static , like 50 % for FTP and 25 % SMTP, 5% ICMP  ... what is best way=
 to
> do it ?
>
>      Ats,
>     Juliano Murlick

(cut'n'paste my reply from "Re: Best way to put a quota on masquaraded co=
nnections" :^)

http://www.linuxguruz.org/iptables/howto/2.4routing.html might be a good=20
start, the Linux 2.4 Advanced Routing HowTo.  It explains different queui=
ng=20
approaches available, and creation of routing rules with iproute2.  (amon=
g=20
other things)  You can use iptables to add mangle-prerouting rules that s=
et=20
TOS for various packet types/sources/destinations, then use some routing=20
rules and a queuing discipline to prioritize and/or limit them.

j





