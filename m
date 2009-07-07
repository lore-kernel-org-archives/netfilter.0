From: =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Subject: How to do a "double" NAT ?
Date: Tue, 7 Jul 2009 22:48:43 +0200
Message-ID: <9948385e0907071348g3aa24b91of296401ff38e3eea@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=qF9mMZxM3U34D1rkjdys85Sgnsgs+YGWUFMtVj3WNqA=;
        b=Me2NCfqPUz0YCjV5EJ7dkT6ow7ZbgxSKFiZywacVoliuavvq/Fb8QGdnMF6IqwzKGO
         J3NEtzR4Q8RG80JF1Y80r0m02LDPAs2S+dVceR0d4fa1/lnd4qGuYqH35Pd5/otFogIc
         fUokYrWDj0pXw4eBQ8896BUnU0YIf3v6PAiSs=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi!

I have a bit specific, but not that unusual problem.

I have linux 2.4 (OpenWRT 1.0) running on a home router.
ppp0 has the connection to outside world and br0 is the local network
and is "NAT-ed".

I also have a vlan0 interface with IP address  192.168.1.1. On that
network there is a host that has a HTTP server on port 80 and accepts
connections only from 192.168.1.x.

What I want is to set up a rule that allows outside hosts (the entire
internet, ok maybe limited to a single IP) access to that port and of
course masquerades it to appear as if coming from 192.168.1.x.

There I'm lost. I have good unix experience, but managed to avoid
packet filters until now ;-)

So please help.

Thanks and regards,
David
