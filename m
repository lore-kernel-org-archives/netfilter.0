From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: A question and a little ascii art
Date: Thu, 16 Oct 2003 18:47:23 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0310161843410.2162@dns.toxicfilms.tv>
References: <000e01c39402$49e648e0$1900a8c0@celletech.com.ar>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000e01c39402$49e648e0$1900a8c0@celletech.com.ar>
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
To: Leonardo Santagostini <lsantagostini@celletech.com.ar>
Cc: netfilter@lists.netfilter.org

> But on the LAN side (162.168.0.0) i cant see the app pointing to
> 200.68.69.xxx:15000
Not :15000, follow this:

Some host A(a.b.c.d) asks 200.68.69.1 asks for a connection, we see this:

1. Start connection:
	a.b.c.d:1025 -> 200.68.69.1:15000

2. Do NAT:
	200.68.69.1:15000 -> 192.168.0.1:80

3. 192.168.0.1 sends the reply, you should see:
	192.168.0.1:80 -> a.b.c.d:1025

So you won't see packets destined for the firewall with port 15000,
but you'd rather see packets that are destined for a.b.c.d:1025

By 1025 I mean a random high port that will be the clientside port
for that particular connection.

Regards,
Maciej


