From: Paulo Andre <pandre@darkstar.nom.za>
Subject: FORWARD packet problem
Date: Wed, 19 Jul 2006 17:12:14 +0200
Message-ID: <44BE4BCE.8060509@darkstar.nom.za>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

I have a multiple isp fw
eth0 = int
eth1 = default isp
eth2 = sec isp

when I try and make a connection to and internal server via the eth2 , 
the packet appears on the PREROUTING table, and then not on FORWARD , 
anyone have any ideas?

Paulo

