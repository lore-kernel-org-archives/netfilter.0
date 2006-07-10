From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: iptables rule doesn't work
Date: Mon, 10 Jul 2006 14:13:58 +0200 (CEST)
Message-ID: <61640.193.173.147.3.1152533638.squirrel@webmail.sterenborg.info>
References: <200607082247.06089.antonio.dibacco@aruba.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200607082247.06089.antonio.dibacco@aruba.it>
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


On Sat, July 8, 2006 22:47, Antonio Di Bacco wrote:
> I receive on an interface (eth0, NOARP , ipaddr: 192.168.0.20 ) a tcp p=
acket
> in this way (I have dumped it with tcpdump):
>
> SRC: 192.168.0.21:6000
> DST: 192.168.0.21:80
>
>
> I have an iptables rule:
>
>
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DNAT
> --to-destination 192.168.0.20:80
>
>
> Why my web server listening on eth0 doesn't receive it?

- Did you check routing of both firewall and server?
- Do you have a FORWARD rule/policy that allows this?
- Did you enable IP forwarding?
(echo 1 > /proc/sys/net/ipv4/ip_forward)


Gr,
Rob



