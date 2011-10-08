From: Prashant Batra <prashant0100@gmail.com>
Subject: user-space ipsec implementation using netfilter_firewall
Date: Sat, 8 Oct 2011 12:20:34 +0530
Message-ID: <CAG+XuE5sguwOVK1oasmD2ou8BMZEN=F333h9P0X12uHE1oLawg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=dr4WHHDc8mavQikS19xu2d6eW/Bijw7f+pJBvpq5I1U=;
        b=ml2fMHcuUY16UziPvk7OO7hKbee96l3TnqFWI3lKCtxiaW8ow4xMOC2yJ84lFTcGZ0
         0ls/M5+FFN8jXcnIM46fxk/XkVbTCNoN3khN/J9k+Fs8qdQHZMlBEQFToxeRT0VtWOqu
         gfmRcoZWD1bPjkIFD91m8r9/3J4i2Y8v0dF0A=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I am thinking to implement user-space IPSec using NETLINK_FIREWALL
protocol. This is how, I am thinking to proceed-

-Get the plain packet sent out using OUTPUT rule with QUEUE target in
the user space. Encapsulate the packet and send out ESP packet.
-Similarly get the ESP packet sent from the peer gateway, get it into
user space with INPUT ESP based rule, decrypt the packet
and send it to the application using raw sockets.

But I have some doubts whether this will work just fine or not.
Lets say that I am trying to IPSec SCTP data. The client is using
kernel-sctp, but as I block the sctp packet(say connect) using
firewall,
convert it to esp packet and send out, will the sctp layer of kernel
maintain the sctp states properly.
Similarly, for recv part.

Please comment.

-- Thanks
Prashant Batra
