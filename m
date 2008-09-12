From: Vimal <j.vimal@gmail.com>
Subject: Behaving like a switch
Date: Fri, 12 Sep 2008 15:29:31 +0530
Message-ID: <ff71fbf20809120259w49dd28b5xc0912893f7f7e8d9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=IwMtNaT7hy9d/Nh118fRxQCgOPI18Ip/G4ozVJ3aDZs=;
        b=jLBqHdypf84jwzhfzW1I1Qv2USW7W1xcruoxmI+koDLPG4Y+evL0xPugspbVWdrtmI
         oWKbprI7siAoWZ1GZS9a0nq53ewQrPivvexNs2eVUAQngi8dPZmbRog/VlpWvtzgdBK+
         aWyrO4qa1w96W9HeNr9LMgvSlIa52a0h0vM6Y=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I am running Mac OS X Leopard. I would like to perform some
experiments by behaving like a switch. This is the current setup:

[My Laptop] <-----> [Switch] <===(part of a vlan)===>

The switch port to which I am connected to is on a particular vlan.
However, if trunking is enabled on my port, I can see all vlan
traffic.

I would like to configure my laptop so that the default ethernet
device (en0) would be connected to a switch via a trunk line, and all
packets that leave my computer via en0 of a specific type (say, only
ipv6 packets) should be tagged with another vlan-id. The setup should
be such that bidirectional communication is possible.

I have seen that one can setup a vlan virtual device using ifconfig.
But I am unable to setup the policy by which packets are appropriately
forwarded.

Thanks,
-- 
Vimal
