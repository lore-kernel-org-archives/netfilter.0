From: =?UTF-8?B?UGF3ZcWCIFN0YXN6ZXdza2k=?= <pstaszewski@artcom.pl>
Subject: nf-hipac v0.9.0: Couldn't load match
 `physdev':/lib/iptables/libipt_physdev.so:
 undefined symbol: parse_interface
Date: Thu, 06 Oct 2005 14:19:18 +0200
Message-ID: <43451646.7040707@artcom.pl>
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
To: netfilter@lists.netfilter.org, hno@marasystems.com

Some problems with physdev iptables match :

gcc version 3.3.6
kernel 2.6.12 (physdev is selected as module in kernel / netfilter)
iptables 1.3.2 or 1.3.3
nf-hipac v0.9.0

commands:

nf-hipac -m physdev --help
nf-hipac -A FORWARD -m physdev --help

i see error like this:

nf-hipac v0.9.0: Couldn't load match 
`physdev':/lib/iptables/libipt_physdev.so: undefined symbol: parse_interface



