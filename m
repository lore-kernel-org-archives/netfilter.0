From: Aaron Lewis <the.warl0ck.1989@gmail.com>
Subject: Append rule to a NFQUEUE?
Date: Tue, 12 Feb 2013 17:50:49 +0800
Message-ID: <20130212095049.GA21858@devnull>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:date:from:to:subject:message-id:mime-version
         :content-type:content-disposition:user-agent;
        bh=/wEOh2hdPCbsx8Yyvyelee2SzUH+xVjq8qYaJWtROPY=;
        b=Mv/u7UIjec6oRp5geYqkRevJaclekPrBQWYUTYdBEft8pW/Xnn/9ItlJVqNZcHvvWv
         CmXa/9lHB1LBYUzrNlaUC/roDy5kJYIbAbEKOceJgmj7Ef/lg3/RHIZBZBjjhiTEf6LU
         RxAc+l7hBc/TtrQrmyH51u1bWprxP2V7NcZXPa0UtaAeSL79iMoZKTPznYIlye4xViOV
         k6u30YGV9+/xbvy1XPA/6o2+XKTpsQ1SphSNdJgwP+ccU1twBmgy8zf6z7mRnOxJZDwu
         4LQBhgUmxZgjp2Gnvv65llR/CVJTrUKCvtY6xNVgYnT5rn9KmFVDpzy4Pu1IjfLgal5H
         bjkw==
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter mailing list <netfilter@vger.kernel.org>

Hi,

I would like to log everything in a created queue,

iptables -A NFQUEUE --queue-num 0 -j LOG

But that doesn't work, any ideas?


-- 
Best Regards,
Aaron Lewis - PGP: 0xDFE6C29E ( http://pgp.mit.edu/ )
Finger Print: 9482 448F C7C3 896C 1DFE 7DD3 2492 A7D0 DFE6 C29E
