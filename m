From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: port forwarding form IP range
Date: Tue, 14 Mar 2006 13:12:44 +0100 (CET)
Message-ID: <51839.193.173.147.3.1142338364.squirrel@webmail.sterenborg.info>
References: <62178.193.173.147.3.1142266928.squirrel@webmail.sterenborg.info>
	<20060314103323.21090.qmail@web50515.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060314103323.21090.qmail@web50515.mail.yahoo.com>
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
To: Nilesh <niluforalways@yahoo.com>
Cc: netfilter@lists.netfilter.org

Please reply back to the list and STOP TOPPOSTING.

On Tue, March 14, 2006 11:33, Nilesh wrote:
> Thanks Rob,
>
> I have tried a lot with this rules but unable to
> forward/redirect traffic.
> Rob, my question is very simple I want to forward/redirect
> traffic coming from IP 192.168.0.10 for 192.168.0.1:3128
> to 192.168.0.3:3128

Yes I know what the question is. But if it's so simple, then why doesn't =
it
work already ?

> The detail about network.
> We have two Internet service providers.
> The scenario is 192.168.0.1 is on my Internet Service
> Provider(ISP) 1 and now I have installed second proxy server
> on other comp which is 192.168.0.3 on the ISP 2 connection.
> We have assigned the Ip's to our internal machines from range
> 192.168.0.4 to 192.168.0.250.
> We have some bandwidth upload/download limitations on
> the ISP 1.
> I want to use 192.168.0.3 proxy severs for the some
> IP's I have taken example of 192.168.0.10 IP.
> The browser settings of 192.168.0.10 comp is
> 192.168.0.1:3128
>
> I want to setup the firewall on the 192.168.0.1 so the
> request coming from 192.168.0.10 for the
> 192.168.0.1:3128 will forwarded to IP 192.168.0.3:3128
> so he/she will use invisibly the proxy
> 192.168.0.3:3128
>
> could you please help me to solve the problem

The rules I wrote should do what you want to do.

> $ipt -t nat -A PREROUTING -i eth1 -s 192.168.0.10 \
> -p tcp --dport 3128 -j DNAT --to 192.168.0.3

This specifies that packets to 192.168.0.1:3128 are redirected to 192.168=
.0.3
(same port).

> $ipt -A FORWARD -i eth1 -s 192.168.0.10 \
> -d 192.168.0.3 -p tcp --dport 3128 -j ACCEPT

This allows it to happen, but policy is ACCEPT anyway so this rule should
actually be of no use (unless another rule blocks it).

If it doesn't work, could you please show us the output of : "iptables -n=
vL".


Gr,
Rob



