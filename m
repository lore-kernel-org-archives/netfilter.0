From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: FTP Forwarding
Date: Fri, 22 Nov 2002 11:34:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B3210199C9@hslex01.hslbz.local>
References: <00a801c2920f$1322d5d0$e6353fc1@nexor.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00a801c2920f$1322d5d0$e6353fc1@nexor.co.uk>
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
To: 'Bantam' <netfilter@end.yorks.com>, netfilter <netfilter@lists.netfilter.org>

> /sbin/iptables -A FORWARD -p tcp -i eth1 --dport 21 -j ACCEPT
> /sbin/iptables -A PREROUTING -t nat -p tcp -i eth1 --dport 21 
> -j DNAT --to
> 10.0.0.199:21

Do you also have something like :
/sbin/iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT


Rob


