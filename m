From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Conntrack helpers for ICQ and MSN Messenger
Date: Sat, 11 Sep 2004 10:17:51 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040911081751.6799773DD@sterenborg.info>
References: <20040910210728.7056.qmail@web50206.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040910210728.7056.qmail@web50206.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

netfilter-bounces@lists.netfilter.org wrote:
> Hello.
> I have some clients in my LAN that need to access ICQ and MSN
> Messenger. Reading some iptables tutorials, I discovered that ICQ and
> MSN Messenger protocols are some kind of "complex protocols"
> because they send some information about openning new
> connections back inside the payload of the packets.
> So, iptables needs some CONNTRACK and/or NAT helpers to let this
> protocols work properly. I looked for it on NETFILTER home page but I
> didn't find it. So, I need some help about it!

AFAIK, there are no ICQ or MSN helpers for Netfilter.

You can use portforwarding for one ICQ or MSN client for direct access
like filetransfer.
OTOH if you want to use these capabilities with multiple clients you
could setup a socks proxy, like the old one from NEC (the source should
be available somewhere), and configure the clients to use it.


Gr,
Rob


