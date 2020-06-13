From: Robin Kuiper <kuiper.robin@gmail.com>
Subject: nftables drops related traffic
Date: Sat, 13 Jun 2020 23:21:48 +0200
Message-ID: <4baae47f34b92314090a0cda3b7b50bb3f253b8d.camel@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=xzD0G1TM+ggpZbaI9UJ46Z6ACbQ2YGcmuxzU+bhLxX4=;
        b=eDxv0CjP5XSbP0nT1NBj2WnDx6haXeglcV6AArzMUK7WPfOIPZaOMVaCCX8HQbl2Nh
         HfMqtf/+WUtntq8DMgR8c6BQoYATyj0qlMpNDALbyjnU1GxAYIE+4NpTbfXUyDLGtPhA
         sOAETpTlGx86XFJOsnBV3A73ycWrWumFFc4Ko/5HQ2HYHhpSt4nBA9lFIBqFmGvfYPa+
         wuOqIZ88tSgeV3Q13vgAvAimx6Q6VykJy/h0cmNSDNNGuziLYbjL7e9ZUZ7UKo1AB7iC
         1xftz7JGrCymXOciJGfqZrC8XGS1QFie2AaMtO25aU3Q42SljkfkRC9y9O4eOIzprZSH
         GHSQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I'm running into an issue where nftables drops all related traffic,
even if it should accept it.

When using, for example, an [archwiki example nftables ruleset][1] it
contains the line `ct state established,related accept`. This is
supposed to accept related and established traffic.

Established works: otherwise, I wouldn't be able to browse the web!
Related however, doesn't appear to work.

My proof is my TFTP server: if you [look at the protocol][2], its a
simple example of related traffic. However, it only works when my
firewall is disabled. TCPdumping the server shows that my server sends
the data packet, but never receives an ACK. ([wiki example][2] image
R2/R3)

Any help would be greatly appreciated!


  [1]: https://wiki.archlinux.org/index.php/Nftables#Workstation
  [2]: 
https://en.wikipedia.org/wiki/Trivial_File_Transfer_Protocol#Details

