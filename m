From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: exclude NAT to multiple networks
Date: Thu, 21 Nov 2002 19:16:57 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211211916.57207.netfilter@newkirk.us>
References: <LMEMIBPDHPIPKJNOIJNGEELGDIAA.mlt@willconsult.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <LMEMIBPDHPIPKJNOIJNGEELGDIAA.mlt@willconsult.com>
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
To: Matthew TenHulzen <mlt@willconsult.com>, netfilter@lists.netfilter.org

On Friday 15 November 2002 06:20 pm, Matthew TenHulzen wrote:
> I have the following NAT line that excludes NAT'ing to the 192.168.250.=
0/24
> network.
>
> $IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -d ! 192.168.250.0/24 -j
> SNAT --to-source $INET_IP
>
> I need to exclude NAT for additional networks, but cannot figure out ho=
w to
> do it.  I have tried duplicating this line, but it doesn't work.  I als=
o
> cannot figure out how to specify multiple subnets in the same line.
>
>
> Does anyone know how to exclude traffic to multiple subnets from being
> NAT'ed??

If you want those subnets to be ACCEPTed instead of SNATted, just set up =
a=20
series of rules that test for your selected subnets, and ACCEPT them, the=
n=20
SNAT anything that makes it past those.

j


