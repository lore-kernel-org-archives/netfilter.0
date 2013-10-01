From: gaurav sharma <reach2gaurav@gmail.com>
Subject: Is there anyway for Netfilter_queue to provide only control packets.
Date: Tue, 1 Oct 2013 09:18:11 +0530
Message-ID: <CAFHb1iHBWSMbM6vmNLeKGLf80MmLqrEG_dRG+9vx7usP2BmAjg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=vn9a01wAKo/dybYRocNnNkgHCTR+/1kLnVBtVQLQjOg=;
        b=lnl9f6YZki7ZySh56y/P5McB4fHLNPr29gClcy3gP7lKV0vzvaWunHHotbR8C4nCTF
         hCNquI8evv9plWKXMTHXCcXubuuHobdlEU3nI51eZvC7DhsloAWgCcg7ZVOVv/ZMVlrD
         4Otr4HtmyvJajz6Cb52k2Cgw0yZWCP3B6m1wHyiM2eGk2z12mSOQAwnYeiTW/SbDIRiW
         Aq46XlniGTCiVeIsmUnYvftRr2rfRGHq1oJHkfvrkznc45eZQBnIqEAIeeNpxszRwjL1
         CQXppJvgFQrodDyLpKr2elrWbFBBmlyrjUZF4dF4Icp++EzbjJK0BczZSl7W6Or3P0E9
         G+sg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello All,

      I am working on a project to provide ability to intercept
network connections originating from, and coming into Linux machines
at various stages during the network connections life-cycle.

      These stages include the following:
      1. Just before an outbound network connection is made - i.e.
when the first SYN packet is sent out.
      2. Just after an outbound network connection is established.
      3. Just after the connection is terminated.
      4. When an inbound connection is established - i.e. when the
first SYN packet is received from outside.

      For above requirements, I was evaluating netfilter_queue to get
the packets in the user-space and then decide the verdict whether to
allow or drop the packet.

      My main concern here is, that once I am done with
netfilter_queue registration, I'll start getting all the packets. But
I am only interested in control packets and don't want data packets to
be sent to user-space.

      So, my question is - Is there any existing way to tell the
netfilter_queue kernel module to send only the control packets and not
the data packets ? Also, would it be possible to get notified about
the connection establishment and termination ?

      If there is no ready way to achive above, then would it make
sense to modify libnfnetfilter_queue and netfilter_queue kernel module
to provide only control packets depending upon the config mode set,
i.e. introducing NFQNL_COPY_CONTROL_PACKET for copying only control
packets to user-space ?

      Sorry if my questions seems naive as I am still exploring netfilter_queue.

      Thanks for all the help.


Thanks,
Gaurav
