From: "Eljas Alakulppi" <Buzer@buzer.net>
Subject: Re: Setting HASHSIZE
Date: Wed, 04 Jul 2007 18:00:07 +0300
Message-ID: <op.tux3wzxfrtqp7s@hagumi.sivarikeskus.fi>
References: <000601c7be4b$3979b290$0200640a@wtlc>
Mime-Version: 1.0
Content-Transfer-Encoding: Quoted-Printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000601c7be4b$3979b290$0200640a@wtlc>
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
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: Andrea Bencini <andrea.bencini@tin.it>, netfilter@lists.netfilter.org

Andrea Bencini <andrea.bencini@tin.it> kirjoitti Wed, 04 Jul 2007 17:54:=
28  =

+0300:

> Which command can I use to set the hash table size?
> The netfilter conntrack (nf_conntrack) is compiled as a module.
> I have installed kernel 2.6.20 and iptables 1.3.5
> thank
> Andrea
>
Try using
# modprobe ip_conntrack hashsize=3D$HASHSIZE
Source: http://www.wallfire.org/misc/netfilter_conntrack_perf.txt

