From: Patrick Leslie Polzer <leslie.polzer@gmx.net>
Subject: Re: rules suggestion
Date: Thu, 22 Jul 2004 08:23:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040722082315.1ec8ce09.leslie.polzer@gmx.net>
References: <a0f69e50407212243efa02aa@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <a0f69e50407212243efa02aa@mail.gmail.com>
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


Hello,

On Thu, 22 Jul 2004 10:43:07 +0500
Askar Ali Khan <askarali@gmail.com> wrote:

> Or we are unnecessary repeating it on some chains/tables.
Yes, here:
> iptables -t nat -A PREROUTING -p TCP -s 0/0 -d 0/0 --dport 135:140 -j DROP
> iptables -t nat -A PREROUTING -p UDP -s 0/0 -d 0/0 --dport 135:140 -j DROP

You already have that in your INPUT chain. Always stick to the 'filter' table
for filtering.

I also think Windows uses only UDP (quite sure) on ports 137:138 (not sure).

Why don't you go for a default DROP policy with ACCEPT rules?


Kind regards,

Leslie

