From: "Rouslin Vr" <msrcnwn@gmail.com>
Subject: Does the latest patch-o-matic include 'random'?
Date: Thu, 12 Jul 2007 17:03:29 +0800
Message-ID: <ccb0a27f0707120203n18403896p5362531826e5a9a4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=phrEUb3jC2+cwWGb3RtruOOXzKtbWhtaJg1TvpYBL6HK4MWc/V9QWPweIBXhO7DpwoyIahBDM3SolQVzST8oSTjgphIpXJN+yKMwygGW5hDBehd0vajMMk9zzmkKGsXLXwVOnMZL7EP1aUrmaBqqm341gFEdyYFJ8Sv9I7WbKSQ=
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

Good day,

I am trying to make my iptables work with '-m random', which is a
topic discussed many times by many people, as you know.
From already existing information on the network, everyone said the
'official' way is to using the 'patch-o-matic' to patch iptables and
the kernel. So I downloaded these things:

kernel version: 2.6.16.21
iptables version: 1.3.8-6904 (svn checkout)
patch-o-matic-ng version: 20070711 (snapshot)

but after going through the '#./runme extra' script within
patch-o-matic, I found no patch is related to the '-m random' thing.
So my question is: does patch-o-matic-ng include a patch for '-m
random'? If not, is there some place I can get that patch?

PS: I've also found a discussion on lists.netfilter.org, in which a
manual method is suggested:
 http://lists.netfilter.org/pipermail/netfilter/2006-July/066313.html
However, it seems that the suggestion is for older kernels because
kernel implementation in those places have changed somehow:
1. Although I can find the 'match()' and 'checkentry()' methods in
'include/linux/netfilter/x
_tables.h', they take another form now,
2. and more importantly, the whole kernel sources don't contain a
'ipt_rand_info' structure (and I am a little confusing about where to
put '.matchsize = sizeof(ipt_rand_info)')

Any idea? Thank you! :)


Regards,
- Feng

