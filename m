From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: need help
Date: Tue, 29 Apr 2003 11:27:50 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0304291122150.15112@dns.toxicfilms.tv>
References: <3EAE5239.3080605@naturesoft.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3EAE5239.3080605@naturesoft.net>
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
To: Karthik RC <karthikeyan-rc@naturesoft.net>
Cc: netfilter@lists.netfilter.org

> Hello ,
>    can we do IP/MAC filering through iptables..
Yes, you can match the source/destination IP address and/or source MAC
address.

Examples:
# iptables -A FORWARD -s 10.20.30.40 -j REJECT
# iptables -A OUTPUT -d 10.12.13.14 -j LOG

# iptables -A FORWARD -m mac --mac-source 00:01:23:45:67:89 -j ACCEPT
# iptables -A FORWARD -m mac --mac-source ! 00:01:23:45:67:89 -j REJECT

Please read
# iptables -m mac --help
# iptables --help
And whatever comes to your mind, the modules have their own help messages.
# iptables -p tcp --help
# iptables -m state --help
etc...

Regards,
Maciej


