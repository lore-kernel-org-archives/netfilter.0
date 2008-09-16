From: icovnik <icovnik@gmail.com>
Subject: Possibilities and performance of conntrackd, NATing cluster
Date: Tue, 16 Sep 2008 16:16:08 +0200
Message-ID: <fc69e1200809160716u3ce5a9e2wce6b0035b4f58cc3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=CEK84IBV2tZ6kR6dWUN9dV7p8j7R5tajPKL0k5geW8k=;
        b=XDQPA9nlqedH+SrNYdTB3FJ6n/8NeXD5e2avX0n29k4lo6+9S0Q8emu9W3p3p/qrIf
         WLEbV7IyDIXO7wKyJi71Y50ZW4GsixczZZUTZsJ9lp+zE+C1oLM6IKyj3PMpR0sPCZPM
         OL/oHFkWZtsBrIZTufkn2MZLdJ+hphtaLJBOQ=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I'd like to create high available and high performance router cluster.
Currently I use 1 router performing NAT running on 2.6 kernel. The
router slowly reaches its capacity limit, so I'd like to add another
router (or two) and create a cluster from those routers. I came
accross conntrack-tools which seems to offer some possibilities here -
simply synchronize all router's stacks and distribute traffic to all
routers. Each router would know everything about each connection, so
each of them would "know" what to do witch each packet. I would simply
distribute the traffic to all routers and they would do the job.

I saw this functionality in Checkpoint few years ago. Is it possible
to do this witch linux kernel and conntrackd? Does conntrackd do this
in real-time? With how many routers?

If it is not possible, how would you solve my problem? I need to route
and NAT 500+ mbps in each direction. And the rate is increasing :-)

Thank you

ico
