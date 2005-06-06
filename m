From: "Douglas Lane" <doug@interserve.co.za>
Subject: Iptables counting with Layer7 patch
Date: Mon, 6 Jun 2005 13:36:07 +0200
Message-ID: <20050606113623.0586C2E9E5@smtp02.isdsl.net>
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


Hi All,

I am wondering, if its possible to setup counters using mark under MANGLE to
mark certain packets that get tagged by the Layer7 patch.

Basically I want to take certain traffic (such as VoIP,HTTP,FTP,etc...) and
mark it on INPUT, OUTPUT and FORWARD chains and then using iptables -v to
get the packet statistics and log it into MRTG or something similar.

Is it possible, and any ideas how I go about doing this?

Thanks
Doug



