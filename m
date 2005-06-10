From: CompuGenic <pablo@compugenic.com>
Subject: Why do I have 'MARK' all over my logs?
Date: Fri, 10 Jun 2005 04:01:11 -0700
Message-ID: <BAY0-SMTP07EE697B166AFFF0DFD5FFBCFF0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Message-ID: <42A972F7.1020101@compugenic.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello all.
I use a basic iptables ruleset to perform SNAT on all outgoing 
connections from my LAN, and to drop all NEW connections coming from the 
Internet.
However, my logs are constantly filled with entries as follows:
Jun 9 8:51:12 host -- MARK --
Jun 9 9:11:12 host -- MARK --
Jun 9 9:31:12 host -- MARK --
Jun 9 9:51:12 host -- MARK --
Jun 9 10:11:12 host -- MARK --
Jun 9 10:31:12 host -- MARK --

Notice the time patterns? I have no idea where these are coming from? Is 
there a way to know if it's from my firewall, or to track the source?

Thanks in advance.

Pablo

