From: Clemens Eisserer <linuxhippy@gmail.com>
Subject: Re: Which modules are reuqired for masquerading?
Date: Wed, 4 Jan 2006 18:07:18 +0000
Message-ID: <194f62550601041007w4eeca11bg@mail.gmail.com>
References: <194f62550601040748q3b2ee549r@mail.gmail.com>
	<43BBF74C.3000406@prosyst.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43BBF74C.3000406@prosyst.com>
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
To: Boryan Yotov <yotov@prosyst.com>, netfilter@lists.netfilter.org

Thanks, this really helps a lot!

well, then - let cross-compiling begin :(

lg Clemens

> 1. ip_conntrack
> 2. iptable_nat
> 3. ipt_MASQUERADE (optional: Only when you really want to use the
> MASQUERADE target)
>
>

