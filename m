From: Ignatich <ignatich@gmail.com>
Subject: Re: owner based routing
Date: Tue, 11 Oct 2005 18:25:32 +0400
Message-ID: <1854128681.20051011182532@gmail.com>
Reply-To: Ignatich <ignatich@gmail.com>
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

Hello,

dr> On Tuesday 2005-October-11 08:57, Ignatich wrote:
>> Since ipt_owner does not work in PREROUTING chain and fwmark is
>> pointless, I thought that ipt_ROUTE from p-o-m can help me.

dr> Why is fwmark pointless?

>> Any ideas how to solve my problem?

dr> I would try -j MARK --set-mark $UID for your -m owner matched packets
dr> and use a ip rule / ip route combination. I've not done this, but I
dr> don't see why it wouldn't work.

It's pointless because ipt_owner does not work in PREROUTING table. So
even if I mark packet routing decision is already made.

-- 
 Ignatich                          mailto:ignatich@gmail.com


