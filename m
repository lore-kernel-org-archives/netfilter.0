From: Metivier Yves <yves@famillemetivier.net>
Subject: Re: Traffic Shaping
Date: 28 Nov 2002 07:53:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1038466431.2569.6.camel@gus.famillemetivier.net>
References: <C01FA3FA475FB04AA54D083D5E637EE10BE34D@siscannet.sispro.com.br>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Juliano Murlick <jumurlick@sispro.com.br>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

I recommend using MARK target in netfilter (mangle table), and "fw"
option in tc filter (see http://lartc.org/) to dispatch marked packets
to classes with differents  priority
I also recommend HTB queuing discipline=20
(http://luxik.cdi.cz/~devik/qos/htb/)
which is much simlpler than CBQ.

Yves

Le mer 27/11/2002 =E0 18:24, Juliano Murlick a =E9crit :
>     Hello,
>     Anybody knows if there is some module for netfilter that works like
> traffic shaper ? i am trying to shaper my traffic but in dinamic way, not
> static , like 50 % for FTP and 25 % SMTP, 5% ICMP  ... what is best way t=
o
> do it ?
> =20
>      Ats,
>     Juliano Murlick
> =20



