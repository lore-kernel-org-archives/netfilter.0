From: Kail <kaildio@gmail.com>
Subject: Duplicate UDP Broadcast on all interfaces
Date: Tue, 22 Apr 2008 12:48:09 +0200
Message-ID: <ef400da20804220348j60b7f148x5244646a6538d2e4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=dLdEQOcQyoFcDkVZdCz3PBvEJkAjaHS9PZUInCWNXys=;
        b=WDsboHR4y6FfLkUxAd68cBUFaCVgr6Oe6ups3HxLnimYSOH9ydQsmCqeOflWr7POGE/st8jwp/OmunWfv5FPB/n5bQNXV+wHrGdkf3jvNr8Wj4BIhPSCyJzfUJXK8/AWak+rFMWyzrc+UwINpiCTJwiVS8ojBCrDx1xbzG+wbuc=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

i've an application that broadcast udp packets to 255.255.255.255 but
only on one interface. I need to relay that broadcast to all
interfaces, but also mangling the source ip of that broadcast.

For example:
eth0 on 192.168.1.0/24
eth2 on 10.0.12.0/24
the broadcast have the source address of eth0 and is sent only over eth0.
I need to copy (not redirect) on eth2 with the right source address.

A solution i've found (yet to test, but should work) is using bcrelay and SNAT.
There is solution completely based on iptables?

Thanks,
Andrea Cuneo
