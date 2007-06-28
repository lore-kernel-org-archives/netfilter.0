From: Yaniv Fine <yfine@jacada.com>
Subject: allow a specific host to use firewall as a default gateway
Date: Thu, 28 Jun 2007 10:30:41 +0300
Message-ID: <OF02D2C1CA.8EA7DECC-ONC2257308.00288E00-C2257308.002942B5@jacada.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org



i want to allow a specific host to use my linux firewall as a default
gateway .
what iptables rule will allow my to allow this host only that and will
block him from using any other ports/proto ?
firewall 10.90.20.5/24
client 10.90.20.3/24
other client reside on 10.90.20.0/24 network they cannot be allowed to use
my linux firewall as a default gateway

Thank you
Yaniv Fine


