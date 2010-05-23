From: Mistick Levi <gmistick@gmail.com>
Subject: Mark packets/Transfer data from iptables to QUEUE
Date: Sun, 23 May 2010 22:22:39 +0300
Message-ID: <AANLkTimSsbzA3pBz3QyjHN4-LnEwou7oaNRkEsaZ9QGs@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=Acrgcbl/c2OwZzpsou+yr1oyBVCUWu4fln1dQzHUbTc=;
        b=IsPrxE9WhWCzmVjaEyXoy4cIobZiLdBgG72SUYmTkJ1OeveW7vlW4f/OApVYdLMOGP
         0Pdwm3bXABq90w2KDCOhlHmVn3I6TUCU0PBZ5NageKTElTuuBYGQZ1ZYF5ljUAvomA3p
         qkxXzyyemPQozcAobAPkitw1Cq4k20MtMPyW8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,
I'm using libnetfilter_queue, and i would like to treat packets from
different rules differently, in the same queue.
Example:
rulematch: ipsrc: 123.132.123.232 ipdst = 1.2.3.4 udp port-12321 -J
NFQUEUE --queue-num 2  - "DANPACKET"
rulematch ipsrc: 123.132.123.232 ipdst = 1.2.3.4 udp port-12221 -J
NFQUEUE --queue-num 2   - "LaneyPacket"

And when this messages get to userspace application, i want to be able
to extract the comment and treat each packet by a different method...
Any idea's?

Kind regards
Levi Yechiel
