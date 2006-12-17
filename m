From: wlagmay@yanbulink.net
Subject: Re: Help on Iptables
Date: Sun, 17 Dec 2006 15:08:38 +0300
Message-ID: <1166357318.458533468def6@webmail.yanbulink.net>
References: <1166288655.4584270fe0f14@webmail.yanbulink.net>
	<458446EB.8030005@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <458446EB.8030005@plouf.fr.eu.org>
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
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@lists.netfilter.org

Thanks Pascal, anyway maybe you can help me with my other problem, I already
post it but up to now I don't have any reply so I'm just thinking that you
might help me.

You see I'm using "SAME" for my Network Address translation. example

-A POSTROUTING -s 192.168.64.0/255.255.224.0 -j SAME --nodst --to
212.xxx.xxx.9-212.xxx.xxx.14

My question is, how can I log and trace which private IP is using a certain
public IP a any given time and date.

example let say, somebody is complaining that there is a network flood or a=
ttack
coming form 212.xxx.xxx.14, so in order for me to trace which machine is ma=
king
the flood I should know whick private IP address is using 212.xxx.xxx.14 at
that given time.

Thank you very much and I hope that you can help me.

Wennie


Quoting Pascal Hambourg <pascal.mail@plouf.fr.eu.org>:

> Hello,
>
> wlagmay@yanbulink.net a =E9crit :
> >
> > I just want to know How am I going to do a blocking of multiple ports o=
n a
> > single line let say port 700 to 800.
> >
> > Im trying this command but it is not working
> >
> > iptables -A OUTPUT -p tcp -m state --state NEW -m tcp --dport 700-800 -j
> DROP
> > iptables -A OUTPUT -p tcp -m state --state NEW -m tcp --dport 700 --to =
800
> -j
> > DROP
>
> man iptables says the port range syntax in port matches is "700:800".
> The port range syntax "700-800" is used only in NAT targets.
>
>





