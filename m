From: Philip Craig <philipc@snapgear.com>
Subject: Re: duplicating packets to other interface
Date: Tue, 14 Dec 2004 16:43:16 +1000
Message-ID: <41BE8B84.8040000@snapgear.com>
References: <1102900009.41bceb29f2fac@www.banda.lv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1102900009.41bceb29f2fac@www.banda.lv>
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
To: zhuupa@banda.lv
Cc: netfilter@lists.netfilter.org

zhuupa@banda.lv wrote:
> internet == [:eth0 router eth1:] == ids sensor (192.168.0.0/16)
>             [             eth2:] == clients (10.0.0.0/8) 
> 
> so far it's a router which routes (nat) packets between external network
> and clients. i added ids sensor to eth1 interface and would like incoming
> packets on eth0 interface to be duplicated to eth1 so that ids sees them.

Get the ROUTE extension from patch-o-matic-ng and use the --tee option.

-- 
Philip Craig - SnapGear, A CyberGuard Company - http://www.SnapGear.com

