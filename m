From: Gio <gioflux@gmail.com>
Subject: nft -f fails with netlink: Error: Could not process rule: Message too long
Date: Fri, 13 Jan 2023 02:05:08 -0500
Message-ID: <CADhidkpArx5nfn-gir4NJv-aL4Ykx7mOyUutCknhRYbCv5dzeA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=80VDLUtPHjepnpPgBXrSV12vSJCK5iQ2P2mZoxVb2sI=;
        b=DIKJ6gpWZANSF1Ns5huuSSVBTF1aQW18mxSYcJJ7mhJ8NEYc/Dz4kRBuwRtUCRVK5G
         DL6P9Z5dhcX4sxM+InH9/+iy+kc74d+ekYV86MBjED12IE9vOXqJq52468FSPASuLxtn
         zlIi3/Rv6ErklaihJlVp9Q3RJr66nBvJEhrLCwIgnbKiesuGkpxER7raqHmgB6d6Ec32
         tePo9UCMGEzrVo5qHvMpNnmq0t3vQBK1N+4F6R2cQIVImuETncWoQbzDUa0PJwGjk3dp
         X5VkJsN2jua6ctxtNp2CS29vec8u3/tIq7WxfcG0kyNYlJmee/HIl9HGwBcXNlrn6Soz
         N3ig==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,
I have a relatively small config.nft file with ~220 lines that I am
trying to load onto my system. When I do this I get the below error
message.

The ruleset is very small, so I don't expect this to be a buffer
issue. Are there any recommended troubleshooting steps or perhaps a
way to load the file in a more verbose way to see in which line of the
config.nft file this error is triggered?

Thanks.

root@nf:~/nftables-geoip# nft -f noverbose.nft
netlink: Error: Could not process rule: Message too long
root@nf:~/nftables-geoip# wc -l noverbose.nft
221 noverbose.nft
