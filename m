From: "Peter Marshall" <peter.marshall@caris.com>
Subject: Established / related
Date: Tue, 29 Jun 2004 15:33:24 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004c01c45e07$8fcd1260$49caa8c0@caris.priv>
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
To: netfilter <netfilter@lists.netfilter.org>

I was wondering if there is a way to use established, related on a subchain
only.

ex.  ftp server behind firewall

$IPTABLES -A FORWARD -d $IPSERVER -j ftpchain

$IPTABLES -A ftpchain -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT

This does not seem to work .. It only seems to work when I have the
established,related line on the Forwared chain.

Thanks for the help.
Peter






