From: Esteban Ribicic <eribicic@UolSinectis.com>
Subject: masquerading
Date: 24 Feb 2003 05:43:13 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1046076193.13510.21.camel@debian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

hello,
im masquerading my local network like this by now:
iptables -t nat -A POSTROUTING -o eth2 -j MASQUERADE
everything works fine.
but, now i added another internet gw (ppp0) wich is balanced (iproute2)
with eth2.
how do i set the masquerading to balance both gws? (eth2 and ppp0) ?
thanks in advance
Steve


