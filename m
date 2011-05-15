From: Paul Hoffman <paul.hoffman@gmail.com>
Subject: Application layer gateway HOWTO?
Date: Sun, 15 May 2011 16:02:06 -0700
Message-ID: <BANLkTi=YDki-6cPLN86CPHmp6NdfnnQ-Rg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=A93jXNNWSdqEQmqyFr8bdgXBEnsFrHO3pJeWCqui5Eg=;
        b=BpGcQWtl97hq2du31TbfFZo/QWl79ZRldCWsabMPvJRGMKNkLfYdzJi8DPzKQyV3qK
         P7sarvzTsxk1RulEN307ku1H3fCdZyYniNODpXZJZTUBpCCLMI8k+uLnTloDaks3ikcJ
         JgTWdRJpoubCPuoeNiZJb7PCJwwMX/BzpUvaA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Greetings. I would like to create an application layer gateway (ALG)
using netfilter. I need to know two things that don't seem to be
obvious from all the FAQs and documentation:

1) An example of the iptables rule needed (I assume using NFQUEUE)

2) A spec for what the userland program needs to be listening for and
sending out.

For example, if I wanted to make a LAN-to-WAN ALG that did something
lame like change the spelling of some HTTP request headers, I would
need t listen on dest port 80 on the LAN interface, grab the traffic,
send it to a program (probably a daemon) that munges the traffic, and
sends it on. What would I need to do this?

--Paul Hoffman
