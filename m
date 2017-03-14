From: Jamal Hadi Salim <jhs@mojatatu.com>
Subject: ANNOUNCE: New talk accepted on Netesto tool suite
Date: Tue, 14 Mar 2017 08:11:34 -0400
Message-ID: <f3f5ac35-b685-a2f6-ed89-277996dc3c17@mojatatu.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=/BBWmvBQpeGQ7PqxYz9kf4JUMLMz9mhk7jF55zhsTIA=;
        b=jOryZX+5hhNfklwc6EX0j/lfW0CxgBB0HwVed9KJyDOIAI/jEdK+nfHqErnijB6ZoR
         90ER4vYbadokn4WKIHSKNtz70uvXn+aRHtgFZsM2P9+F2fBHevucjmQ0mWvDda9I9hE4
         3xoCUQHknk3tDB5F9ZA3SpoP8OFpgRBYOdxIPQxT9kzbY11SVEsjR876L+wJpaFr5I9b
         TthJxi4R4tyFBQG6VYI/BLUcuwAuikHbSMw9awOFSDjLpfvQVjWgdZbTeLYy+1pyJYmb
         mJcd+VF2nZwQilx7Sozjur0yXMcsi/1coYcpHY0s0vjFGpIo9Fx/4qaiFUEEBVntX7W4
         0I9Q==
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: people@netdevconf.org
Cc: tech-committee@netdevconf.org, netfilter-devel@vger.kernel.org, Brenda Butler <bjb@mojatatu.com>, Stephen Jaworski <jaws@mojatatu.com>, netfilter@vger.kernel.org, linux-wireless@vger.kernel.org, Heri Muhero <hmuhero@gmail.com>

The tech committee would like to announce a new accepted talk.

Lawrence Brakmo  will talk about Netesto tool suite

Details are as follows:
-----
Netesto (NEtwork TESting TOolkit) is a suite of tools for running 
multi-host network experiments that supports the collection and display 
of relevant data and statistics. It currently supports TCP RPC and 
STREAM transfers through netperf. Although the framework itself can 
easily be expanded to support other protocols and transfer programs. It 
has some similarities to Flent (The Flexible Network Tester) in that it 
is based on Python, but unlike Flent, Netesto supports:

Multiple senders and receivers
Detailed flow information: RTTs, cwnds, etc.
Per host statistics and state
Creation of csv file with results
Creation of html file with results in table plus detailed results 
including graphs of cwnds, RTTs, goodput
Support for creating complex scenarios through macros
Support for adding delays with netem
Netesto can run complex scenarios consisting of multiple individual 
tests with just a few commands due to the use of macros and libraries. 
The end result is an HTML page consisting of a table with one or more 
lines per test, plus links to pages for individual results which contain 
graphs showing goodputs, RTTs and cwnds. Netesto has proved very 
valuable for comparing the performance of different TCP variants (such 
as Cubic, Reno, BBR, NV). For example, it was used to evaluate BBR and 
compare its performance to Cubic 
(https://drive.google.com/file/d/0B4YZ_0yTgbJEa21CbUVLWFdrX2c/view)
----

cheers,
jamal
