From: "Deepak Seshadri" <dseshadri@broadbandmaritime.com>
Subject: How to make the default gateway permanent after restart?
Date: Mon, 20 Sep 2004 11:17:28 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409201513.i8KFDCKG083935@jkcpub.iserver.net>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: 'Netfilter ML' <netfilter@lists.netfilter.org>
Cc: ibashir@broadbandmaritime.com, 'Veena' <vrao@broadbandmaritime.com>, 'Syed Amjad Ali' <sali@broadbandmaritime.com>, 'Syed Ziaullah ' <szia@broadbandmaritime.com>

Hello everybody,

 

My Linux firewall (Fedora Core 2 & kernel 2.6.8.1) is configured the
following way:

Eth0 - WAN

Eth1 - LAN

Eth2 - DMZ

 

With the above setup my default gateway is Eth0. For some reason, when the
machine boots up it takes Eth1 for default gateway. This not only messes up
the Internet connection but also my firewall rules. I have to then manually
delete that entry and add Eth0 as the default gateway. Could someone please
let me know how to make Eth0 as the permanent default gateway?

 

Thank you,

Deepak Seshadri

 

