From: Atsushi Nakagawa <atnak@chejz.com>
Subject: Re: Liaise with port forwarding proxies?
Date: Sat, 06 Sep 2003 01:05:38 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030906003513.A37B.ATNAK@chejz.com>
References: <20030905194710.A375.ATNAK@chejz.com> <1062762797.1164.8.camel@india.nsecure.net>
Reply-To: Atsushi Nakagawa <atnak@chejz.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1062762797.1164.8.camel@india.nsecure.net>
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
To: "Dharmendra.T" <dharmu@nsecure.net>
Cc: netfilter@lists.netfilter.org

"Dharmendra.T" <dharmu@nsecure.net> wrote:
> Can you say more clearly what you are trying?

I have a linux server with services and an iptables configuration set to
discard any NEW incoming packets that aren't for these services.  I do
this based on protocol and port.  (e.g. Accept: TCP/80, TCP/21)

I want to add a SOCKS5 server (Dante) to the list of services.  The
problem with this is that this server can listen to any arbitary port
above 1024 for port tunneling, but I don't want to automatically allow
all ports > 1024 in iptables.

I'm wondering if there is a way for iptables to determine which ports
are in use by the SOCKS5 server and selectively allow those.

Regards,


-- 
Atsushi Nakagawa
<atnak@chejz.com>
Changes are made when there is inconvenience.


