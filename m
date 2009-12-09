From: Gurvan Le Guernic <gleguern@gmail.com>
Subject: configure iptables on lo for transparent proxy avoiding infinite 
	loops
Date: Wed, 9 Dec 2009 17:19:15 +0100
Message-ID: <b8d5c3c40912090819p982db8fta9c9f475bb5ff667@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=evQvrY0Nj6zTfC+/rxq7PzjPNhJ3GtLGOwk4WYqq2tQ=;
        b=Kylx9i6J0gGxjNit7l7fszqtM+YoaDSGmkc1a+0nQ7FVFiHB6zSWZ0hfqXbQKgIwrs
         6+QpWWbraagMbf+6TTS47DKfTUxcuXcvtPExTndhHSapsf1zYfN4tPCzYZ6c+TQ1Er/J
         PGuemQsSmGrRMVA1G48MApgcpJNbNi32eHTvc=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

   Hi,
 I need to test a network application for data integrity on a single computer.
 I have 2 instance of the program, A listens to 127.0.0.1:xxx0 and B
listens to 127.0.0.1:xxx1. When A send a tcp message to B, I want to
capture it, modify the payload (changing all 'f' characters to 'b',
for examples), and send it back to B.
 I was thinking about using netsed which needs packets to be
redirected to a port that it listens to. Let's say netsed listens to
127.0.0.1:xxx2.
 What I am afraid of is that if I redirect packets going to
127.0.0.1:xxx1 (B) to 127.0.0.1:xxx2 (netsed), when netsed will send
back the packet after modification, it will send the packet to
127.0.0.1:xxx1, which would then be redirected once again to
127.0.0.1:xxx2. That would create an infinite rerouting loop.
 Is there a way to configure iptables to do what I want ? Maybe by
marking packets so that they are rerouted only once (but the netsed
modification may break the marking)
   Thanks,
   Gurvan

PS: is there a better utility than netsed to replace a string by
another in the payload of tcp packets?
