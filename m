From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: SNAT & Squence Numbers
Date: Tue, 12 Nov 2002 09:51:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019982@hslex01.hsl-brabantzuid.nl>
References: <FD8F124A387AD6119F7900A0D218B321487DB8@hslex01.hsl-brabantzuid.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FD8F124A387AD6119F7900A0D218B321487DB8@hslex01.hsl-brabantzuid.nl>
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
To: 'mike bramm' <mike.bramm@bomberjacketproductions.com>, netfilter@lists.netfilter.org

> - A syntax question. I've looked at alot of syntax
> examples and I've noticed one character that I can't
> seem to match up with any of the tutorials or man pages.
> $IPTABLES -A INPUT $WAN_IFACE \ -j DROP
> What the heck is "\"? It looks like it would be used to
> separate the match and the target, but is not really
> necessary. Is this just a personal preference or is
> it needed?

"\" is used to continue a line on the next line.
The "\" char itself will be discarded when all lines are put together the
command is executed.

Take the following line :
iptables -A INPUT -i eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT
This could (if you wanted to) be rewritten as :
iptables -A INPUT \
         -i eth0 \
         -m state --state RELATED,ESTABLISHED \
         -j ACCEPT


Rob


