From: "jdf [zionarea.org]" <zionarea@free.fr>
Subject: about iprange
Date: Tue, 25 Jan 2005 14:45:35 +0100
Message-ID: <1106660735.41f64d7f087a7@imp5-q.free.fr>
References: <1106251621.41f00f65147cb@imp6-q.free.fr>
	<1106252952.5024.25.camel@hubcap.ljm.dom>
	<1106335800.41f15838d9d26@imp6-q.free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1106335800.41f15838d9d26@imp6-q.free.fr>
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


Using network addresses like 192.168.0/8 is well, but it's not granular
enough: just because we cannot provide all the addresses if they don't
follow this contiguous rule.

So I'm finally wondering about iprange. Most of linux distributions, with
the ones I know, don't provide iprange for the kernel. Are there any
performance or security issue behind this behavior ? Or is it simply a
'bad' choice of those distributors ? But maybe it's simply due to the
kernel version. It appears 2.6.x provide this option at default; but if
I remember well 2.4.x didn't.

