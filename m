From: Thomas Smith <hpcaz@yahoo.com>
Subject: IPSec passthrough with iptables
Date: Mon, 14 Oct 2002 21:47:22 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021015044722.73838.qmail@web21205.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I need to be able to connect to clients IPSec VPN from
behind and iptables firewall. I know the VPN is
working and my firewall is masquing traffic but IPSec
doesn't work from systems behind my firewall.

I've got a pretty basic firewall. It's simply masquing
internal traffic.

Are there some iptables' rules or patches I'm missing?

Tom
hpcaz@yahoo.com

