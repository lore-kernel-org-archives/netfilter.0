From: <g_netfilter@netfids.com>
Subject: Neighbour table overflow
Date: Tue, 26 Nov 2002 12:39:41 -0600 (CST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <35211.200.60.189.231.1038335981.squirrel@www.netfids.com>
References: <1038321617.13707.28.camel@ben.mis.tnsi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1038321617.13707.28.camel@ben.mis.tnsi.com>
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

Friends, I have some logs like this:

Nov 26 11:29:46 firewall kernel: NET: 96 messages suppressed.
Nov 26 11:29:46 firewall kernel: Neighbour table overflow.
Nov 26 11:29:52 firewall kernel: NET: 52 messages suppressed.
Nov 26 11:29:52 firewall kernel: Neighbour table overflow.
Nov 26 11:29:56 firewall kernel: NET: 83 messages suppressed.
Nov 26 11:29:56 firewall kernel: Neighbour table overflow.
Nov 26 11:30:08 firewall kernel: NET: 19 messages suppressed.
Nov 26 11:30:08 firewall kernel: Neighbour table overflow.

Im running Red Hat 7.3 kernel 2.4.18-3 and iptables 1.2.5-3, please could
you tell me if those logs are showing some attempts of attacks?

Regards,
Geffrey





