From: Payal Rathod <payalrathod@gmail.com>
Subject: Re: NATting again
Date: Fri, 16 Jul 2004 23:19:50 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <f51b72bc0407161049d9edfa7@mail.gmail.com>
References: <f51b72bc04071608505bc1da93@mail.gmail.com> <200407161703.42973.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407161703.42973.Antony@Soft-Solutions.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

Hi,

On Fri, 16 Jul 2004 17:03:42 +0100, Antony Stone 

> iptables -A PREROUTING -t nat -d a.b.c.d -p tcp --dport 21 -j DNAT --to
> w.x.y.z
> iptables -A FORWARD -d w.x.y.z -p tcp --dport 21 -j ACCEPT

Why is the FORWARD rule needed here? Doesn't the PREROUTING rule
handle the same or rather the rule in ESTABLISHED and RELATED in
FORWARD chain handle it? Why do we need a seperate FORWARD rule?

With warm regards,
-Payal

