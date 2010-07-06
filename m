From: Wade Gasior <wadegasior@gmail.com>
Subject: Redirecting a Pre-existing SSH Session
Date: Tue, 6 Jul 2010 07:28:52 -0400
Message-ID: <AANLkTil-BzqRmzGX951pWLLkVqeO8Y_vwywQOD8z2Drj@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=/OYyeBAf8x3OenO71KxFRvfVlWR3wqABorSTcVhOHmw=;
        b=DTPbr17aGKKGiNqN75OMEsa7mDv2TvcuyosOkZRJYAVPTwq3pxccEi8ohJF9S6Im9k
         Jd4XuZia0DPIfmBbdxK5G/ttguYDSiq8WiS0ERebNXM8RveTqfnLPKzzn8Cc6fu09Qi+
         6NjpQEvDOSg1tP8N2T7F9fLBIuTA++VEi38lY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi... I am hoping that someone can help me with routing an already
established SSH session.

I have two physical servers set up: 192.168.1.150 and 192.168.1.160

All external traffic comes in to server .150

Initially, I want all traffic to be served by server 150. So for this
purpose I am leaving the IPTables on .150 empty (for sake of
simplicity).

At a point in time, I want to forward all incoming traffic to be
served by .160 instead.
I have accomplished this using these commands (on .150):

iptables -t nat -A PREROUTING -j DNAT --to 192.168.1.160
iptables -t nat -I POSTROUTING -j MASQUERADE

My problem is that if I have an open SSH connection to .150 (prior to
adding the rules), the packets are still handled by .150 after adding
the rules.. e.g. my SSH session stays active. I want these packets to
be forwarded to .160, which would effectively disconnect the SSH
session in a sense (I will later be performing a live server migration
from 150 to 160, so the SSH session should stay valid). I do not want
the packets flat out dropped, I need them to be forwarded on in
whatever state they are in.

If I try a _NEW_ SSH session, the packets are properly forwarded to .160

Any help would be appreciated to get these packets from the existing
session forwarded.

Thank you!
