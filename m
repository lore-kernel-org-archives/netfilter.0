From: Cupertino Miranda <philfine@gmail.com>
Subject: Filtering by Mac Address
Date: Wed, 13 Feb 2008 17:54:44 +0000
Message-ID: <63D06BD7-145A-4A49-8E64-D91C813B987F@gmail.com>
Mime-Version: 1.0 (Apple Message framework v919.2)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:from:to:content-type:content-transfer-encoding:mime-version:subject:date:x-mailer;
        bh=IYLOcDcT6lL1ZlaGppFhyLLC6lnuo85yVmQbpbSE48c=;
        b=BVBQ/15aHlXZ2GEjTXi+xFRsLo5rrsSvX3KWmno2qThlgNcNektvxx0CY3xsJj45XKRcZHNFCNYxUJBPypedcIMV5EXwN03cDKtzHqVtn6KCuE6jaCS7U2YAjxPaZkR5mAWOS4ELE9CUhfXD+sAeBXPArkOZkO3yiMxnMA0OhtU=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: netfilter@vger.kernel.org

Hello everyone,

For one of my current hackings I need to construct the following  
network rules.

I need to disable internet access to all the local network hosts by  
redirecting them the my webserver (allowing to show some web page in  
case of http connection).
Enable internet access by mac address to some of this hosts.

I have currently general NAT rules in gateway machine.

Can someone provide me some details how can I do it.

Thanks a lot
