From: Buddy wu <ejournal4me@gmail.com>
Subject: Re: what's the problem of DNAT
Date: Mon, 31 Oct 2005 13:24:51 +0800
Message-ID: <43a0cdcb0510302124i68c2aa9dg@mail.gmail.com>
References: <43a0cdcb0510301931p3f97ff66p@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43a0cdcb0510301931p3f97ff66p@mail.gmail.com>
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

It's really strange, please HELP me
I've checked and I'm sure that no rules was set to forbidden access to
that ports.

2005/10/31, Buddy wu <ejournal4me@gmail.com>:
>    I use '/sbin/iptables -t nat -A PREROUTING -d InternetAddr -p tcp
> --dport 80 -j DNAT --to 192.168.16.100:8087' it can work, but if I use
> 8087 instead of 80,like follows:
> /sbin/iptables -t nat -A PREROUTING -d InternetAddr -p tcp  --dport
> 8087 -j DNAT --to 192.168.16.100:8087 then it can't work. what's wrong
> with it ?
>

