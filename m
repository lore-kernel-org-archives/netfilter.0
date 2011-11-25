From: Gao feng <gaofeng@cn.fujitsu.com>
Subject: Re: How to drop an idle connection with iptables?
Date: Fri, 25 Nov 2011 09:14:57 +0800
Message-ID: <4ECEEC11.5010701@cn.fujitsu.com>
References: <4ECCCF70.1080701@gmail.com> <jaipdd$irr$1@dough.gmane.org> <4ECE125F.8090101@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4ECE125F.8090101@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: lu zhongda <luzhongda@gmail.com>
Cc: netfilter@vger.kernel.org, "Brian J. Murrell" <brian@interlinx.bc.ca>

=E4=BA=8E 2011=E5=B9=B411=E6=9C=8824=E6=97=A5 17:46, lu zhongda =E5=86=99=
=E9=81=93:
>     The timeout is defined in //proc/sys/net/ipv4/netfilter/ip_conntr=
ack_tcp_timeout_established/ , which is defaulted to 5 days, I change i=
t to a short value for testing, such as 1 min.
>     the linux shell command is: echo "60" > //proc/sys/net/ipv4/netfi=
lter/ip_conntrack_tcp_timeout_established/
>     The timeout for ESTABLISHED type item does works, and the item is=
 removed after timeout, however the connection is not blocked or droppe=
d at all.

Hi zhongda.

How about echo 0 > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_loose
