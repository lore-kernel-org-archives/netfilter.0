From: "Technical" <technical@sojourn.dyndns.org>
Subject: how do you specify an entire domain like *.mydomain.com
Date: Thu, 22 Jan 2004 06:25:55 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <34198.66.65.52.125.1074770755.squirrel@sojourn.dyndns.org>
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

-A RH-Firewall-1-INPUT -s *.*.myvwz.com -m state --state NEW -m tcp -p tcp
--dport 110 -j ACCEPT


