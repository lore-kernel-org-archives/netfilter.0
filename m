From: JD <jd1008@gmail.com>
Subject: Question about dropped packets
Date: Mon, 18 Oct 2010 21:42:47 -0700
Message-ID: <4CBD21C7.2080604@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=Ru/ZQanhW7Mmqt+T6zjZ3Ft3yuML9YUQgcWRvqFKzd8=;
        b=QwSw3KnqrQNFXyYymP0+kFg0dtJznVWBaAJXZmDLNyjTET1mxgqt8yM1jmNNbnX1LN
         AHpZlJvYrzoB/BCaR8p3WrzfZSi7Z1Omky6E+GuwsSlRONPmXW63cDreGKRnFIqjTlen
         s+MIRDPN6Ov8DFtb1zdkOmzbVrXuQkJu4l87s=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

  I am seeing a lot of

Dropped by firewall: IN=wlan0 OUT= 
MAC=ff:ff:ff:ff:ff:ff:60:fb:42:d1:69:71:08:00 SRC=0.0.0.0 
DST=255.255.255.255 LEN=328 TOS=0x00 PREC=0x00 TTL=255 ID=25801 
PROTO=UDP SPT=68 DPT=67 LEN=308


How can I know who is sending it to my machine if the source IP is all 
zeros?
I have no idea if it is coming from the lan or from the wan?

