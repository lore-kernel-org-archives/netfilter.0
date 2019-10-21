From: Daniel Huhardeaux <tech@tootai.net>
Subject: nftables v0.9.0 netlink: Error: set is not a map
Date: Mon, 21 Oct 2019 22:08:17 +0200
Message-ID: <37d8e802-87c2-4ef6-d0da-173bbd2ded60@tootai.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1571688499; bh=kH7TPA9VFugtSpur7Kg9DsLfVdavZrk0Urg3WifghDc=;
        h=To:From:Subject:Date:From;
        b=pSb4M7IbSvTqtA2AQom3Yhlb38rRsanYfFLQLQkvGkWW5dRW5wxKGzT3mCE97fSIq
         6zt5KyUKb07U443Q+jpD0vSnzrRc2gfFkF7J19oqYOJ0BxBXd7YVNzhvDnQ/eApgzx
         QpmEP+l8IjzhmBVDyMBtGNz0u7gQfSVx5+wnAIwI=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1571688498; bh=kH7TPA9VFugtSpur7Kg9DsLfVdavZrk0Urg3WifghDc=;
        h=To:From:Subject:Date:From;
        b=sWzVSL/pYf+3HtXK3vwSETDcQIOyjUgtbvoj/Ce38CDxpO6I7Rp7RazJ4tk7IUG3t
         /PvjirTmuAcczv5BbbS6K+gQZwKAG9+SaKjIRla06R1nPNOwZh/ZHfWzd6DL6faltD
         pQydM5RCCbFVabt7YTjwh5I/wk2ZZ7UvV/a4CeGQ=
Content-Language: fr
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

I created a bash script under Debian/Buster to create nft rules: it 
works perfectly.

Now I copy this script to a Debian/Stretch machine (nftables v0.7.0) and 
get in troubles to make it work: at some point I receive the subject error.

OK, I think it's a version problem: I installed nftables from Stretch 
backports which is the same version as the Buster one, v0.9.0 But bang, 
error is still here :(

What can be the cause of this error? Yes, I use sets, and no, they are 
no maps defined.

Thanks for any hint

-- 
TOOTAi Networks
Daniel
