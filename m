From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Wildcards / large ranges in concatenations
Date: Tue, 16 Feb 2021 22:09:25 -0500
Message-ID: <f3caadb1-4c04-c1b2-96df-8ed4f08698db@fhmtech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:Subject:From:To; bh=NqaGj1fzClKbMh8DiNg59g4BGcrCdIWaFuiFLW/X73U=;
        b=jdIBBSpBQDXvOi8nlFqXMNJz2INEGytSuZrAW6ZuPFqYs/YuYkUbODlpg3V02Hquze7gTuHWz7r+OTK/NzuJWAzNrwsCL6xvancbQxWJTTQttoscttHnDl5qOzrZ63O/29f0IMwKkaPCyygWjbqgqP3gGMgBMHRBlXAmwDZQV+o=;
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

A couple of weeks ago I played around a bit with using ranges in 
concatenations, a very cool feature added in nftables 0.9.4. Somehow I 
wound up with set with nonsensical keys, and not long after a kernel 
oops. I suppose this was very likely my own fault and/or due to very 
limited memory inside a virtual machine. I ended up going with a 
different ruleset config.

But I have a couple lingering questions about using ranges in 
concatenations:

1) Would it be possible to specify a wildcard (* or similar) for one of 
the constituent values? I had a vmap (if I remember correctly) using 
concatenated keys like ifname . ifname . inet_service . inet_service. 
For one element I didn't care about one of the inet_service values, and 
since '*' didn't seem to work, specified a range of all possible values 
0-65535. The oops happened not long after this.

2) Are concatenations of large (or wildcard) ranges inefficient (in 
execution speed and/or memory use), even if they work? I started to 
suspect this might be the case, and so changed my ruleset design.

Thanks,
Frank
