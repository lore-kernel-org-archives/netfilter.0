From: Moritz Gartenmeister <moritz@uplink-verein.ch>
Subject: ARP Proxy
Date: Mon, 31 Jan 2005 15:01:21 +0100
Message-ID: <41FE3A31.4080708@uplink-verein.ch>
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
To: netfilter@lists.netfilter.org

hi

i'm not sure, if am right here, so if i am wrong, pleas point me to a source ;-)

how can i reduce arp-broadcasts without routing?

i have physically 2 subnets (500 and 300 clients), logically this is one subnet. my premature/naive 
idea is, to install a linux-bridge and put arp-proxy on it. as long as the proxy has the correct 
entry, broadcasts are not propagated. this will reduce arp-broadcasts.

i know, i have to bend alot of principles, but will it work?

cheers
moritz

