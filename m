From: Gao feng <gaofeng@cn.fujitsu.com>
Subject: Re: How to drop an idle connection with iptables?
Date: Fri, 25 Nov 2011 13:39:04 +0800
Message-ID: <4ECF29F8.502@cn.fujitsu.com>
References: <4ECCCF70.1080701@gmail.com> <jaipdd$irr$1@dough.gmane.org> <4ECE125F.8090101@gmail.com> <4ECEEC11.5010701@cn.fujitsu.com> <4ECF0E75.7030000@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4ECF0E75.7030000@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: lu zhongda <luzhongda@gmail.com>
Cc: netfilter@vger.kernel.org, "Brian J. Murrell" <brian@interlinx.bc.ca>

=E4=BA=8E 2011=E5=B9=B411=E6=9C=8825=E6=97=A5 11:41, lu zhongda =E5=86=99=
=E9=81=93:
>     However other rule in /etc/sysconfig/iptables did logged file, lo=
g found in /var/log/iptables.log
>     -A INPUT -p tcp -m tcp --dport 9999 -j LOG --log-prefix "ACCEPT 9=
999::"

hi zhongda.
Because -m state is based on the ip_conntrack.when ip_conntrack destroy=
,the -m state will never match.
