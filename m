From: ToddAndMargo <ToddAndMargo@zoho.com>
Subject: nf_conntrack_helper replacement?
Date: Tue, 20 Dec 2022 11:00:43 -0800
Message-ID: <518aeae6-e89b-62f0-0a5b-86264a51edde@zoho.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1671562846;
        s=zm2022; d=zoho.com; i=ToddAndMargo@zoho.com;
        h=Message-ID:Date:Date:MIME-Version:To:To:From:From:Subject:Subject:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
        bh=8vAtbKfIYbOwhvczvzE5HkCiZ0brtKUA7sYRmm/yua4=;
        b=W/1h1fvm8sfvzW+5da9K32Xq7nUdW5QoOgJWihYK9pTbJBi/yzCC3Lr5AV362RMV
        2mztz26l9FDQhjtX10I1FjRKnVotGnQlrtQEkRu7bpC+FQhyWUwYnFIjpSzvhsRJFlG
        lu1i2jMkoTq+zkRulVT19n6mlQQ60T8fyuxYZPzI=
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi All,

$ uname -r
6.0.12-300.fc37.x86_64

Since kernel 6.0.1,
    /proc/sys/net/netfilter/nf_conntrack_helper
has been removed.

This breaks passive ftp.

What do you guys do to work around the problem?

Many thanks,
-T


-- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Computers are like air conditioners.
They malfunction when you open windows
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
