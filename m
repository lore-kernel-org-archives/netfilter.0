From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: Tring to setup my firewall for my lan as a DNS server!
Date: Wed, 15 Jan 2003 01:17:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <GOEDLKDBKHLHGAKAGFGKCEDBLMAA.rsterenborg@xs4all.nl>
References: <Pine.LNX.4.44.0301141850580.15521-100000@ns2.tje1.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0301141850580.15521-100000@ns2.tje1.com>
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
To: Eric Joe <sysop@tje1.com>, Silkk <crystaldrinker@yahoo.com>
Cc: netfilter@lists.netfilter.org

> Umm,
> Why dont you just point the Windows machines DNS settings
> to your Redhat
> box's IP? No rules needed.

Except if he has default policy DROP on the INPUT chain, not having
port 53 open.
Then you'd need :
# iptables -A INPUT -i <if_lan> -p udp --dport 53 -j ACCEPT
You could also open port 53/tcp but AFAIK it will probably work just
fine only using 53/udp.


Rob


