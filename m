From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Re: PRERUTING or POSTROUTING
Date: Sat, 4 Feb 2006 13:42:09 -0400
Message-ID: <65aa6af90602040942s1941c5e6icea99f0770df4471@mail.gmail.com>
References: <20060204161912.66BA3542AE@rekin17.go2.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060204161912.66BA3542AE@rekin17.go2.pl>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On your routing server, you have to setup a rule on PREROUTING so that
it changes packets going to port TCP 80 to proxyhost's tcp 8080. That
would mean setting a DNAT (Destination nat). You have to keep in mind
that the machine that made the request doesn't know about that DNAT,
so if the proxy sends it the reply directly, the request will fail, as
it isn't aware that the proxy is handling the request... in other
words: you might have to set a SNAT on POSTROUTING to make sure that
requests that are DNATed to proxy are sent back to the routing server.

You also have to keep in mind that doing this could ruin your proxy
usage statistics.

On 2/4/06, czezz <czezz@o2.pl> wrote:
> Here is an description what I want do do:
>
> Server1:
> -eth0 10.3.1.4
> -ppp0 x.x.x.x
>
> ServerPROXY:
> -etho 10.3.1.8
> -ppp0 y.y.y.y
>
>
> Server1 has set FORWARD in iptables for Telnet i FTP services ( so
> users from LAN are able to connect those services in the internet )
> ServerPROXY has Squid service (PROXY for http only)
>
> All of the hosts in LAN must have set gaytway 10.3.1.4 (eth0
> Server1)
>
> What should I do to redirect all connection from LAN on port 80  to
> serverPROXY 10.3.1.8:8080 ?
>
> I heard that POSTROUTING or PREROUTING rule need to be used
> Any suggestions ?
> Someone told me that it might be necessery to compile some
> additional options in kernel (my current kernel is 2.4.31 - regular
> kernel from Slackware 10.2 )
>
> Any ideas how to slove that ?
>
>
>
>
>

