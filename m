From: Michal Kepien <lordpopcorn@poczta.onet.pl>
Subject: Re: Firewall setup at boot - trouble with setting up the LOG target
Date: Sat, 05 Jul 2003 09:30:41 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <n7vcgvs39brkp00l6atko40tdbbdld4sro@4ax.com>
References: <7C9884991ADAE0479C14F10C858BCDF52E3554@alderaan.smgtec.com> <200307041112.58290.Alistair@nerdnet.ca> <sgubgvg6n5ckac25g8qs1d678vgrl0ro24@4ax.com> <200307042233.46558.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200307042233.46558.Alistair@nerdnet.ca>
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
To: Alistair@nerdnet.ca
Cc: netfilter@lists.netfilter.org

>	KERNEL_DIR=3D/xxx/xxxx/xxx ./configure --prefix=3D/
>	                        ^^^^^^^^^^^^ being wherever your kernel source =
code=20
>hides.=09

You mean the source code dir (e.g. /usr/src/linux-2.4.19) or the
config file (e.g. /usr/src/linux-2.4.19/.config)?

>	personally I have all my networking delayed until after I'm multiuser
>	-- and then only the inside stuff gets started...=20
>	*after* the box is up and stable I start the internet cruft and=20
>	the firewall...=20

You mean you start the firewall manually (i.e. it is not started
automatically at boot time)?

>	Simple expedience says that you should turn off forwarding
>	very early in your startup scripts and then turn it on at the *end*
>	of the firewall script.

OK, I did it but what does it change? :)

Michal Kepien

