From: Pascal Italiaander <pc-secure@home.nl>
Subject: Re: lots of ACK/FIN filtering (DPT=80) at web server.
Date: Thu, 29 May 2003 12:11:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200305291211.01431.pc-secure@home.nl>
References: <Sea1-F98nnh99RhOQmI000379a3@hotmail.com> <1054185938.13730.183.camel@raylinux.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1054185938.13730.183.camel@raylinux.internal>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

Op donderdag 29 mei 2003 07:25, schreef Ray Leach:
> Hi there
>
> On Wed, 2003-05-28 at 10:46, SB CH wrote:
> > Hello, all.
> >
> > I have operated linux web server and executed iptables 1.2.8.
> >
> > and I have found so lots of logs like this ACK,FIN filtering.
> > Surely, ACK-FIN is a connection closing step, so there is no problem for
> > customers but I would like to know why this happens!!
> > I guess that the timeout of the connection tracking related.
>
> Those are 'broken' browsers that do not follow the http standard
> properly.
>
> > May 25 12:33:05 www kernel: IN=3Deth0 OUT=3D SRC=3D210.126.xxx.xx
> > DST=3D211.10.xx.xx LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D118 ID=3D3376 =
DF PROTO=3DTCP
> > SPT=3D3608 DPT=3D80 WINDOW=3D63520 RES=3D0x00 ACK FIN URGP=3D0
> >
> > Do you have any problems like me?
>
> Yes
>
> > and what's the problem and how can I solve this problem?
>
> Stop using non-standards complient browsers. Sometimes changes to
> standards are not 'enhancements'.
>
> > Thanks in advance for your kind opinios!!
> >
> > _________________________________________________________________
> > =ED=99=95=EC=9D=B8=ED=95=98=EC=9E=90. =EC=98=A4=EB=8A=98=EC=9D=98 =EC=
=9A=B4=EC=84=B8 =EB=AC=B4=EB=A3=8C =EC=82=AC=EC=A3=BC, =EA=B6=81=ED=95=A9, =
=EC=9E=91=EB=AA=85, =EC=A0=84=EC=83=9D =EA=B0=80=EC=9D=B4=EB=93=9C
> > http://www.msn.co.kr/fortune/default.asp

This is correct , mostly this happens when you have the rule like this:
iptables -A OUTPUT -p tcp ! --syn -m state --state NEW -j DROP
and you have a workstation inside your network , you browse with.
The most logging wil be done if you run a Windows-client      :-)

BUT you run a webserver,  and in your log-file says IN=3Deth0 and not OUT=
=3Deth0.

I run a webserver in Holland also , and it may happens sometimes ,that some=
one=20
keeps the website open , but does nothing. So a connection_time_out=20
acurse,and the ACK,FIN will be dropped, when the client closes the browser =
or=20
page.

But NO heavy logging of that may happen.

So  I asume there is something else...

maybe a faulty rule ? like this ?:

iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP

send us your ruleset . If you only run a public-webserver (and ftp or ssh )=
=20
you don't need a heavy ruleset. ( keep it plain and simple)

Pascal








