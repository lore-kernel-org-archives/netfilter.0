From: Jamal Hadi Salim <jhs@mojatatu.com>
Subject: ANNOUNCE: New talk Busypolling next generation
Date: Mon, 13 Mar 2017 10:29:46 -0400
Message-ID: <c957a263-ce4c-b317-efd8-d43c9bc39716@mojatatu.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=yV2og/0hyOlfKc0AU9gC3WhPxjsnZzA0scERBZj5MvA=;
        b=COZnxYoSKxgJhfl135NYDCitBvYTPxg22LNSK/ozsADaoPO2A4DVHJlBaiqqHt9a17
         0gRO6/7sNOou4xqRMwN1CDTbEa0CAV7gtISbL3RCDyTiLWpm6QGZ6GwN7bY6P/P7M0Tx
         5nYIdDpbpBcOoOn+zRRsO88g6Jy9nBfpbZEI76R0XmSdctqxQ9JqXIrC/gEuTpGs3qLt
         a3epKYm1T+rrRDxqN46PYJ8Zn3QuPTRAVTqrvseGi8hlacgIW7oYbpYZw3M7BeRdQdMm
         iurQFoXLuotW5rtLkjMHVdYLXcqH1XhCv6c4AQsTn0IzigBlbtZhs59rMtaaxgkAkDWB
         vtWA==
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: people@netdevconf.org
Cc: tech-committee@netdevconf.org, netfilter-devel@vger.kernel.org, Brenda Butler <bjb@mojatatu.com>, Stephen Jaworski <jaws@mojatatu.com>, netfilter@vger.kernel.org

The tech committee would like to announce a new accepted talk.

Eric Dumazet will be talking about Busypolling next generation

Summary Description of the talk.

----
In this talk I will present the busy polling principles and history in 
linux kernel, and the ongoing work.

Back in linux-3.11, Eliezer Tamir added what he called low latency 
socket polling. Idea is let recvmsg() callers directly call a driver 
polling function, burning cycles an avoiding potential expensive 
scheduler calls to reduce latencies. linux-4.11 has no more 
ndo_busy_poll() method and busy polling is now generic for all NAPI drivers.

Next work is to opt-in drivers in a mode where one (or multiple) cpu 
would be dedicated to run the low-level part of the networking stack, ie 
shifting from an interrupt driven model to a busy polling one.
----

cheers,
jamal
