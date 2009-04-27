From: mopsosforum <mopsosforum@gmail.com>
Subject: drop all packet on one interface of a bridge.
Date: Mon, 27 Apr 2009 17:05:42 +0100
Message-ID: <6EFFAB74-FFB0-4793-B702-1BA3DC56545D@gmail.com>
Mime-Version: 1.0 (Apple Message framework v930.3)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:from:to
         :content-type:content-transfer-encoding:mime-version:subject:date
         :x-mailer;
        bh=6dSAI5mbcbZL3nlniOjr8ABr6yvF3g3+Cpq9UufcC2k=;
        b=hcHrr7AWFMXgGhzscc391eTOaIQOTVF9JaGZXSELXftmqX9UxK79mpUi/hDCUYMziO
         Jc9LGFzm7oLBS31b/BPWBQIxOM+D67oFVHS+zigt+z18LeNNVmKYluvtIpOMfxJJIgRt
         AwfPh/hp1zdBmuDKxNZpPmatjijMaKi1w96ME=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: netfilter@vger.kernel.org

Hello,

I have a bridge (on debian) with 2 interfaces.
eth1, eth2

eth2 is connected to an other server and eth1 is connected to  a  
switch for my computers.
Everythings is ok.

But I want to add another interface, eth3 on the bridge and for the  
moment, drop all the packet.

I tried :

ebtables -A INPUT -i eth3 -j DROP
ebtables -A OUPUT -o eth3 -j DROP
ebtables -A FORWARD -i eth3 -j DROP
ebtables -A FORWARD -o eth3 -j DROP

But I have always some packet :
arp and msdns what always allow.

How is it possible?
How Can I drop this type on packet?

Best Regards.

