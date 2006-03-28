From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: ip redirection
Date: Tue, 28 Mar 2006 16:52:26 +0200 (CEST)
Message-ID: <64721.193.173.147.3.1143557546.squirrel@webmail.sterenborg.info>
References: <52837e3e0603280437s8645463l67792ff8e5694d39@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <52837e3e0603280437s8645463l67792ff8e5694d39@mail.gmail.com>
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

On Tue, March 28, 2006 14:37, Bruno Nunes wrote:
> i want all connections incoming from IP1 to be forwarded to the IP2
> ip1 is a internet ip
> ip2 is a local ip
>
> i only need an ip redirection...so if I use ssh, http or ftp or
> anything iptables must route ip1 to ip2 directly
>
> how can i do that with iptables?

In a previous post "ip redirection and multiport noobish question" (where=
 I
fail to see what the multiport question was) you asked something similar.=
 Did
you actualy look for yourself in the tutorial ?

If you did, you would have been able to construct this :
$ipt -t nat -A PREROUTING -i <if_inet> -d IP1 -j DNAT --to $IP2

However, if you'd ask me then my advice would be not doing this.


Gr,
Rob



