From: "Michael Ransburg" <michael.ransburg@gmail.com>
Subject: Queued packet in user space: network order or host order?
Date: Wed, 23 May 2007 17:58:04 +0200
Message-ID: <22b256140705230858u125619f4kdcdcca6f424a9ed1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=k/qWqZJRbgb8vz/IsgfAFjXwVFaVL3rjyOtTGG9yv6yt1mhDpMm+9BTWHqXWwsNgIMrByqBDOWDmFrJu2U34MV7M9Z0P+Su2XvNN1jnl1ZAqfQNMmSva2jyWCs6+AiqOP7HWNUr0623rmukod/92GCyyzGp3XQE8oxlAsp27FmY=
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
To: netfilter@lists.netfilter.org

Hi all,

I'm using ip_queue to process packets in user space. It seems that
these packets are already in host order when I process them - is this
correct? Does the network order --> host order conversion happen
before any packets are queued for userspace handling?

Many thanks,
Michael
-- 
icq: 71772353 | skype: daneel1409 | msn: mike@unfolded.com

