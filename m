From: Paul van den Bogaard <paul@vdbogaard.com>
Subject: multiple internet connections and routing
Date: Mon, 19 Dec 2005 11:35:59 +0100
Message-ID: <43A68D0F.7000807@vdbogaard.com>
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

currently I have two firewalls. Each firewall connects its own internal
network to the Internet using its own single (broadband) connection.

This means I have two similar setups running in parallel

I would like to do this all on a single firewall. Not sure how to go there.

Result should be one firewall doing NAT, such that

	all trafic from/to network 10.1.5 (interface eth1) should go interface
eth0 (internet gateway 1)
	all trafic from/to network 10.1.6 (interface eth2) should go to
interface eth3 (internet gateway 2)

	If one of the internet gateways is unable to operate (provider failure,
routing error up stream) I should be able to temporarely route all
traffic to the other internet gateway.

How to configure the box?

Help, links etc are very much appreciated.

Thanks
Paul van den Bogaard

