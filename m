From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: ip_conntrack: table full, dropping packet.
Date: Wed, 30 Oct 2002 17:59:56 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210301755110.19280-100000@dns.toxicfilms.tv>
References: <200210301928.42300.mail@vickysh.wlink.com.np>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210301928.42300.mail@vickysh.wlink.com.np>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vicky Shrestha <mail@vickysh.wlink.com.np>
Cc: netfilter@lists.samba.org

> Now I can see the lines "ip_conntrack : table full, dropping packet" in my
> kern.log.
Yes, but have you read the FAQ ? :) Guess not.
You need to increase the /proc/net/ip_conntrack_max value, according to
the FAQ, it gives some reasonable values depending on the RAM you have.

> Does dropping packets means that it is actually dropping the packets or just
> truncating the file /proc/net/ip_conntrack , does this affect my client's
> connections???
Well, it means that the state mechanism has no space to insert a
conntrack entry, meaning, that the --state ESTABLISHED,RELATED works only
to a limited number of currently tracked connections.

Depending on your setup, it may do different things, but most probably it
does whatever your POLICY instructs them to do. DROP ? Most certainly.

In other words, it means that the --state rule will not match on the
packet. It will not get accepted by this rule.

Regards,
Maciej Soltysiak



