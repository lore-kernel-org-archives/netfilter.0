From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Filtering Nimda, Code Red and Code Red II
Date: Fri, 13 Sep 2002 10:28:20 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0209131025050.8619-100000@blackhole.kfki.hu>
References: <1031812695.1954.16.camel@cygnus.szczepanek.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1031812695.1954.16.camel@cygnus.szczepanek.de>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Torge Szczepanek <netfilter@szczepanek.de>
Cc: netfilter@lists.samba.org

On 12 Sep 2002, Torge Szczepanek wrote:

> Compile in String Matching support.
>
> Then do the following:
>
> IPTABLES="/usr/sbin/iptables"
>
> $IPTABLES -A INPUT -p tcp -i eth0 --dport 80 -m string \
>                --string "/default.ida" -m state --state ESTABLISHED \
>                        -j REJECT --reject-with tcp-reset
>
> $IPTABLES -A INPUT -p tcp -i eth0 --dport 80 -m string \
>                --string "/cmd.exe" -m state --state ESTABLISHED \
>                        -j REJECT --reject-with tcp-reset
>
> On a router/firewall replace INPUT by FORWARD and also adjust the -i and
> or -o parameter.

Please note that following this advice, the connection still will be alive
on the webserver. You might even encounter traffic as the server tries to
communicate with the client.

netfilter/iptables is a packet filtering solution and not a content
filter.

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


