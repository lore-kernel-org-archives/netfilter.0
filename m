From: Yasuyuki KOZAKAI <yasuyuki.kozakai@toshiba.co.jp>
Subject: Re: Problem with connection tracking in IPtables!!
Date: Mon, 14 May 2007 21:03:17 +0900 (JST)
Message-ID: <200705141203.l4EC3IEv028786@toshiba.co.jp>
References: <802220ef0705110343w38864b3ew9194a49ffa3ab9fb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <802220ef0705110343w38864b3ew9194a49ffa3ab9fb@mail.gmail.com>
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
Content-Type: Text/Plain; charset="us-ascii"
To: vishamr@gmail.com
Cc: netfilter@lists.netfilter.org

From: "Ramsurrun Visham" <vishamr@gmail.com>
Date: Fri, 11 May 2007 14:43:19 +0400

> Hi to all,
> 
> I am unable to see the contents of the ip_conntrack file. I have built
> the iptables modules in my 2.6.20.4 kernel itself. Is that what might
> causing this problem? Should I select the options as modules?

AFAIK your .config in previous mail, you are using nf_conntrack, not
ip_conntrack. nf_conntrack is new module. But it is compatible with
ip_conntrack, if you also load nf_conntrack_ipv4. Don't worry.

Regards,

-- Yasuyuki Kozakai

