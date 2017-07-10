From: Amit Limaye <amit.limaye@gmail.com>
Subject: cgroup match failing for synack packets
Date: Mon, 10 Jul 2017 16:42:08 -0700
Message-ID: <CAGFnk5Fm5+VZ5oVnzP6sQG1X6kH2JSM5GC=EXXXrr7LiRT7f+A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=sqM6oGxx0Rw6Am6bwu6UYklH+7uW7p48i+lWdT+jlBs=;
        b=KWjf6Gwbmp3g154EWo3lNr4Kl1KsjKyXj+VDPqRm+nRzM9oNtDGARvl3tyQ95KrZY7
         snhmJqmsRQrbFP6JMjCvHFZ4m4nFd9h0/uJbNBbn6Sh1kEFx8uVl/2xVuxJ0Kc9NiWYj
         2cFUFoVtVtKxHdiYYWfltDh4yuOTYgyCYzPUOAstAEmWnMVHMbVFSmIj1pzmDkuPla93
         RTK9V2GjqKyx62kd5OQQoBuEVdRNy2hcjFob/8RSqAsAWM+BV6kJdQZ5izk0zGSAozfJ
         +tkgpP9AAA+Mh73apV4xb6UdkVUGA0EKq/mxZcq5Vu4DdDZx0cqDvdqZ1ZWRj3yHx2hd
         zgNg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,
        i am trying to capture packets coming out a process by
matching the cgroup the process is in.
The match for cgroup works syn packets in the tcp handshake but fails
for the syn ack packet.
i can match SYN for cgroup 102 using
  1    60 MARK       tcp  --  *      *       0.0.0.0/0
0.0.0.0/0            tcp flags:0x12/0x02 cgroup 102 MARK set 0x66

but it fails if i try SYNACK on the server end and not packets hit my rule.

My rule on the server side is
 0     0 MARK       tcp  --  *      *       0.0.0.0/0
0.0.0.0/0            tcp flags:0x12/0x12 cgroup 101 MARK set 0x65

where the server is a part of cgroup 101

Am i missing something here or is this a new bug ?
-SIGTERM
amit
