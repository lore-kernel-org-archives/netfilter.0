From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: RE: string module with kernel 2.4.20
Date: Mon, 28 Jul 2003 19:34:20 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0307281933490.12190@dns.toxicfilms.tv>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

> I've got the pom, and it's displayed correctly under "menuconfig" during
> kernel-config.
> I'm making a new kernel right now.
Remember to compile the userspace part: iptables, too.

> This is not an attempt to stop any hacking. I've just wanted to stop
> apache log from getting this.
Anyway the FAQ entry is about netfilter not being the best tool for it as
it is a packet filter not a content filter. eg. It will let through
fragmented http requests with nimda and friends. Squid would be better for
that as it operates on an aplication layer.

It is just a reminder.

Oh, and i belive it is better to reject with tcp-reset than drop
if you are using the string match. This will make the connecting host
bugger off faster and will avoid retransmissions (and log clutter too)

Maciej


