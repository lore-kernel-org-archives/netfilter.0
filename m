From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: Time based rules ...
Date: Wed, 13 Nov 2002 16:50:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019992@hslex01.hsl-brabantzuid.nl>
References: <FD8F124A387AD6119F7900A0D218B321487E43@hslex01.hsl-brabantzuid.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FD8F124A387AD6119F7900A0D218B321487E43@hslex01.hsl-brabantzuid.nl>
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
To: 'Netfilter Mailing List' <netfilter@lists.netfilter.org>

> Is there a way to put time restrictions on rules?
> For eaxmple, something like:
>
> iptables -A FORWARD -i eth0 -p tcp -sport 1024: -dport 1024: -time
> 0700:1700 -j DROP

There is a time patch in pom (base).

From the website :
This option adds CONFIG_IP_NF_MATCH_TIME, which supplies a time match
module.
This match allows you to filter based on the packet arrival time
(arrival time at the machine which the netfilter is running on) or
departure time (for locally generated packets).


Rob


