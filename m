From: "Sebastian Vieira" <sebvieira@gmail.com>
Subject: multiprimary conntrackd setup
Date: Tue, 17 Jun 2008 13:02:30 +0200
Message-ID: <279239c70806170402j47f89251s2379d0909c1bca0e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=vyP92HKtMwBY1c9/XCgar2Tll4gpLJgjGwVHB4EamYU=;
        b=Xuzyq6I2avVuhpQOLiI7Y5eTzAj0ArcMoyzuWyQ2yHl0PzH8bjgI5UHcPi04uQw6KC
         UuqebcM2xnRvYSFVjN1Mv927CFfaP/7X6jihMPBDCsB4gd5iccH6uqVw/L+fsi+J04ZE
         rexs63stgq2/GdtoDCY5k7/Z5TkZFj6mGSUmY=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I must be looking in the wrong places for documentation but so far i'm
unable to find it. I'm trying to set up a multiprimary (active-active)
conntrackd on 2 firewalls. I have conntrackd running on both nodes and
'conntrackd -s' shows that mcast is working. However, i still have to
do a manual 'conntrackd -c;conntrackd -R' to sync both tables (as
would be proper in a failover / active-backup situation). Other than
enable  CacheWriteThrough , i couldn't find anything on multiprimary
setup. If someone could point me to the correct documentation, i would
be very happy indeed :)

thanks,

Sebastian
