From: "semi linux" <linuxsemi@gmail.com>
Subject: Bonding & Bridging.
Date: Fri, 15 Jun 2007 15:14:43 -0700
Message-ID: <e53321d30706151514u5882efaapaf153a91537bd253@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=r2c8mlYU/N6JKZ4CA5B2Zt9Pq03mPYMgPXjKgjLXchQscSsVvBmj9wpITIMNuu8z4IYO8CGhULku2W2C3qPEmppGsAGtIyBUYrCBQL82N9Xc9iYRCipudmi8lMBafrNEaQeG/GRP7ssMmxoXWVJ/ZDd+caFguysGWuorFewvHmc=
Content-Disposition: inline
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

Can you bond two Ethernet ports together and then bridge that bond to
a third interface?

It would look something like this...

A       B       C
 |       |       |
--bond0--       |
    |           |
    ------br0----

Any problems with doing this?

-Gareth

