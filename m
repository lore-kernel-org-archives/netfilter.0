From: Foxtrot Mike <foxtrotmike59@gmail.com>
Subject: Reroute VPN server outgoing traffic to TOR
Date: Sun, 10 May 2015 18:04:20 +0800
Message-ID: <554F2D24.6040603@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=Ebkdv0BU43dqcuqo6KJq1jhTASPTzLbeupfkWIiSQow=;
        b=CZfd9lA5chTKjf+Fs/hkzzDCupE9g7bmthpBDU20qM8gLTuGGEGJcQY+wocgk/lm3V
         Qghy25yrt4p4rSopAGHeOkzejrZvq4yt7egOBWC+fxmxdOZtiBP1M5Prf69y1kG9olPo
         e58b3KNEWMbaHcfLQeEoriSzMspee22IJloujXJecSLFkGh5iBolHKRjYGcFMRvlOXxu
         TzxGe8q0d2PVznMjjXmakgtbTsOwnTZ2xoBugozrJuR5H8wfKqQjQLEYsNWyKPGEon1I
         POp8sIeWD12NR9MFKQJx6pLcRTCzXtXSIwY5/eYnPdWPZjAlSiAfHsD1WC6JG1EDLc+B
         egAQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi people

After three days of following HowTos, guides, some debugging and help 
from guys at users@lists.strongswan.org I was able to setup a VPN server 
on my spare PC (Ubuntu Server 14.04) using StrongSwan. The clients are 
able to connect to the VPN server successfully.

I want the VPN server to redirect all the outgoing traffic to TOR. IPsec 
VPN is listening at default 0.0.0.0:500 and TOR is listening at 
localhost:9050. Ideally, all my clients would connect to the VPN server 
which would then send all the traffic over TOR.

I have very little knowledge of iptables. I tried understanding it but 
it requires a lot of TCP/IP and networking knowledge which I lack. I was 
wondering if someone here could provide me a solution, or atleast guide 
me  in the right direction.

Regards,
Foxtrot
