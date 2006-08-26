From: Julian Hagenauer <chaosbringer@gmx.de>
Subject: are all ip-connections listed in ip_conntrack?
Date: Sat, 26 Aug 2006 11:53:25 +0200
Message-ID: <20060826115325.1cbfb176@julian.chaosbringer.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,
is every connection that passes the nic listed in /proc/net/ip_conntrack?
What happens to connections that get removed from ip_conntrack, e.g. because the maximal size of the file is reached? Do that connections persist, even if not listen in ip_conntrack?

Thanks,
Julian

