From: Daniel Huhardeaux <tech@tootai.net>
Subject: nft - execute command without returning error
Date: Sat, 12 Oct 2019 22:32:38 +0200
Message-ID: <74e77ccc-f437-6368-37b6-72fdd102ea9a@tootai.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1570912359; bh=eDQZmrZOgQHOvX9LAizJXIsYtxCQvIO/Z/9bjq6a2WY=;
        h=To:From:Subject:Date:From;
        b=bYGqsZyHhc4BtD07AW/x3N/NtOTMHedAs41djXxlyVJUaX7DkiPVtaz4N1GLM6We7
         TWbzanlAXL8DDYrFd9uxPRyyI4MrH+AHSI6HXjol1EfcBAWm7u7eDPFyU3DNy7ZWgw
         ZuCjSVgrlHxm+rmVE9LWDxk/S0gRbYPrxRPwmJrA=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1570912359; bh=eDQZmrZOgQHOvX9LAizJXIsYtxCQvIO/Z/9bjq6a2WY=;
        h=To:From:Subject:Date:From;
        b=bYGqsZyHhc4BtD07AW/x3N/NtOTMHedAs41djXxlyVJUaX7DkiPVtaz4N1GLM6We7
         TWbzanlAXL8DDYrFd9uxPRyyI4MrH+AHSI6HXjol1EfcBAWm7u7eDPFyU3DNy7ZWgw
         ZuCjSVgrlHxm+rmVE9LWDxk/S0gRbYPrxRPwmJrA=
Content-Language: fr
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

for instance, I want to delete a table which is not existing. Problem is 
that nft return an error and stop processing the script. It's the same 
for other commands like adding an already existing chain.

If I run all nft stuff in a bash script I can use eg

nft delete table mytable 2>/dev/null || true or
nft add chain mychain input { ... } 2>/dev/null || true

to get around.

With table, using add instead of create does the job. What are the 
solutions for others command like showned above ?
-- 
Daniel
