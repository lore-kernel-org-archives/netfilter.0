From: Jamal Hadi Salim <jhs@mojatatu.com>
Subject: ANNOUNCE: New talk accepted on Netfilter Connection Tracking
Date: Sun, 5 Mar 2017 12:25:37 -0500
Message-ID: <3e9ee6d3-a01b-e7d1-f0d3-487bcc791244@mojatatu.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20150623.gappssmtp.com; s=20150623;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=iCm59RWgBV/fxlmZI6JTJiqkQPXGNcpkpVCmqM21Kr4=;
        b=O6hLNV8794iIiU5Vhp7mmXI9UzavEMhal0TjrgjuUUJi0D6ywsS174cHcG2bx/A+Lv
         zAbGWkl12XfsVnUCb+9JtKgadoRGyf26/NyqKQjAI9wubkTzeB1tB0PeDIpB8lGpaNpL
         0e5abNdZAYkmKWuIOyxeukXY6+cPRKHxBXpvQQhA9cGV7kXJ6SqScP/nhCz8kLv1lvK8
         1ruEJ44UtoRAw8RjuRFwQWX/VE3Tv8dGnHyITwFWtvqZKn8SshTf6zQoV/Wbw7oJhduL
         bzZ6YzzGIYkR185bb14IHKWBDStuU1JpTizUgUVCSia7ETgS9QWdan7iQt+a6BmoTum4
         NSGQ==
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: people@netdevconf.org
Cc: tech-committee@netdevconf.org, netfilter-devel@vger.kernel.org, Brenda Butler <bjb@mojatatu.com>, Stephen Jaworski <jaws@mojatatu.com>, netfilter@vger.kernel.org

The tech committee would like to announce a new accepted talk.

Florian Westphal will be demystifying Netfilter Connection Tracking.
You cant miss this talk!

The description is as follows:
----
  This talk will take a look at netfilters connection tracking, namely:

     data structures
     conntrack extensions (what are these, how are they used)
     NAT handling
     connection tracking helpers (ftp, sip etc)
     connection tracking events

The second part of the talk will focus on conntrack overflow handling 
('table full') under DoS/packet floods and how handling of such 
scenarios could be improved.
----

cheers,
jamal
