From: xchris <lyra@fastwebnet.it>
Subject: Re: redirection
Date: Tue, 8 Apr 2003 21:40:27 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304082140.27919.lyra@fastwebnet.it>
References: <Pine.LNX.4.44.0304081443120.28439-100000@ns2.tje1.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0304081443120.28439-100000@ns2.tje1.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org
Cc: Eric Joe <sysop@ns2.tje1.com>

On Tuesday 08 April 2003 08:44 pm, Eric Joe wrote:

> Do this
>
>
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -d x.y.z.1 -j D=
NAT
> --to x.y.z.2:80
>
> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to x.y.z.1

am i wrong or i loose the original connection source address?

if i check the log in x.y.z.2 i see connections from x.y.z.1.
I really need to preserve the source address.
Thank you very much
xchris

