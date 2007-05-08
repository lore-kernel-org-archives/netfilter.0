From: "Michael Ransburg" <michael.ransburg@gmail.com>
Subject: Handling queued packets?
Date: Tue, 8 May 2007 09:00:47 +0200
Message-ID: <22b256140705080000g2da19b53ifdc18b5b1a91807b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=hICYhuqOjnMgvOpaHKvOUx70BR0G7sxGksTZk8SYY5HljEcogZaTLS41DBGkA1HoSLaNIq2oD3ZggXBmbEYU/j9GXpAcQ3L8aztbdHyXBcG9z8LBKnqDCSxaT381OD05Ynje4Ovsga5y76IHxARnYHys7xHq4tUkimaSIpnR2HY=
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

I'm currently going through the netfilter documentation and I'm
particularly interested in queuing packets in order to handle them in
userspace.

A few initial questions on this:
1) The docs frequently mention redirect.c as an example for handling
the packets in userspace which should be available in the test suit on
CVS. I checked out all the modules from SVN but redirect.c seems not
to be part of them. Can anyone give me a hint on this? Was redirect.c
renamed to something else?

2) Will the packets which are received by the userspace application be
defragmented already?

Any additional pointers to information on queuing packets and handling
them in userspace would be very much appreciated.

Thanks so far,
Michael
-- 
icq: 71772353 | skype: daneel1409 | msn: mike@unfolded.com

