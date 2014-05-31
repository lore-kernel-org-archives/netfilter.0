From: Robin Schroer <sulamiification@gmail.com>
Subject: [PATCH] driver/netfilter/nfnetlink: removed unused variable
Date: Sat, 31 May 2014 13:06:28 +0200
Message-ID: <20140531110628.GA30443@shodan.fritz.box>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:mime-version:content-type
         :content-disposition:user-agent;
        bh=TUr2wBn4qFiTbjvoMY3yDa5NlSCfmzmU0N1yE0FiUNU=;
        b=jz1KGggcFy1oG0X1OjEs7zWjOiVRDvSgeEclgUubWJp3N1YDA2Yt90ESqaurhlziGr
         rxwayNTCCHduPLvcIVrnEQkiwU9bhSQQM3OuE5kxwG9aa9p7w/1pE3VMaSNgpIXze3td
         7v/RXrC4cst0GmwWkfMWGLT6iQFqs90rFguFyc4hktscNUo11qkQs8EIJqbj6ll+swxZ
         tzOGW3e5JHBr4qqW1c/P1G6w8/mDpO1VsgVyHeN3EPJwU2+PD/+i3huKfNYi94kNOPVo
         3TYhEZr68qCaEdBIEXsHEkAga+HHuowUyTnk0/+2qYZ1EUsMAVhv7kGLzJISWrDtltsl
         PKEQ==
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pablo@netfilter.org
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, linux-kernel@vger.kernel.org

Removes the unused struct net *net = sock_net(skb->sk);

Signed-off-by: Robin Schroer <sulamiification@gmail.com>
---
 net/netfilter/nfnetlink.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/netfilter/nfnetlink.c b/net/netfilter/nfnetlink.c
index c138b8f..5cc9db2 100644
--- a/net/netfilter/nfnetlink.c
+++ b/net/netfilter/nfnetlink.c
@@ -226,7 +226,6 @@ static void nfnetlink_rcv_batch(struct sk_buff *skb, struct nlmsghdr *nlh,
 				u_int16_t subsys_id)
 {
 	struct sk_buff *nskb, *oskb = skb;
-	struct net *net = sock_net(skb->sk);
 	const struct nfnetlink_subsystem *ss;
 	const struct nfnl_callback *nc;
 	bool success = true, done = false;
-- 
1.9.3


-- 

Robin Schroer
