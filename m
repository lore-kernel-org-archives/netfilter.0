From: Matthew Sims <matt@simsweb.org>
Subject: iptables ip tracking buffer size?
Date: Fri, 3 Mar 2017 10:20:20 -0800
Message-ID: <CAJV-0PdPVVBbMR+HcE5mjjkuKquR60c-n=D3b6N_j_+HK6wx6w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=simsweb-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=WDBwD4ho3A5fjqDQl/s95y7+osyJcoyL3U59PXIh7tU=;
        b=tEADPen8ZZvBd5kwNgvnKNRmAsW02euBjrT6/KNUY0r0EvgFouH+V6FpAdYxcRCdv7
         xln8MOTNrRq8yFfzOVxVpumEPOjiMTQ51UQXMbWwRE22ou+pqDWEUWV+EhxyH3bpg1Cb
         brrM8S1p9R2PME6QXz50R5wCjBYDJ617A4ZLPHw19UYiHzyak63Ka6dk1CQlvE8iEA4S
         4uSmq1E3cFFKrbY1kJFhzvJWwJj7JSZTtSU0xlrSh59RzAq2iak21qwZI/sTFTFlbIlb
         cbnns/dyWJqH3ONhrMQ/UTP+oyjy9N1NhPrOYYMlxWnEhOfbWbq8UvSPbL09qPSNKoPq
         jUiQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Quick backstory. I recently took over an unused project from a co-worker
who left over a year ago. The idea was to block IPs that reached a certain
hit_count limit within a minute.

When this was enabled, it worked...sort of. While iptables was keeping
track of IPs, we weren't able to block when tests were performed.

The reason had something to do with IPs in a "buffer pool" (??) were being
knocked out when new IPs were tracked? I don't have the actual issue as he
never documented it. I'm guessing that while iptables was keeping track of
hit_counts, the list grew so big that it had to bump out IPs at the end of
the list to track new ones.

This is the best I can do to describe this and wondered if anyone knows
about this. I don't have a name that allows me to research this so its been
difficult to find a solution.
