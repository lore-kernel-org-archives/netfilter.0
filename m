From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: FTP Forwarding
Date: Fri, 22 Nov 2002 13:02:56 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B3210199CB@hslex01.hslbz.local>
References: <FD8F124A387AD6119F7900A0D218B321541403@hslex01.hslbz.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FD8F124A387AD6119F7900A0D218B321541403@hslex01.hslbz.local>
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
To: 'Erdal Mutlu' <emutlu@fonts.de>, 'Bantam' <netfilter@end.yorks.com>
Cc: 'netfilter' <netfilter@lists.netfilter.org>

> You will also need:
>
> /sbin/iptables -A FORWARD -p tcp -i eth0 -o eth1 --sport 21 -j ACCEPT

Doesn't the "-m state --state RELATED,ESTABLISHED -j ACCEPT" take care of
all this ?


Rob


