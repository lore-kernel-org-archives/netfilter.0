From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Advanced Logging
Date: Sun, 30 May 2010 19:58:46 +0530
Message-ID: <AANLkTimgYvZZ80VgAU4kpLyqKwOMo6u81QCDhX_lD72p@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=CdHdC9AIZz7V9AVRy4PFlCVbTcFb4m/awzckwFf9AqM=;
        b=i3zHFn2eyF00NCy8iTuS+EQ9T7bSwnOufI+hgowaEApd7as7Zhyrn2Y5cP6cm3RoMi
         4KUt4nm4zbrqjXbCqniv4aL7ZPGL6fCOkxYzlVFQ0Re8BOpBV/G3DLsXmirEL3KW/cOa
         jJllWf+OV6jwnlVxZKDdsNvSbkdQ61wG0FKmI=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter mailing list <netfilter@vger.kernel.org>

Hi ,

           I have implemented  firewall  in my linux machine using
iptables . It is able to prevent attacks and LOG just before dropping
packets . Since i know a little about iptables , i could go thru
/var/log/messages and find out information about attacks . Is there
any application which will analyze logs and  give a brief information
to user about the attacks  ?

For example , suppose there was a syn flood attack ,the application
should analyse the /var/log/messages or by some means should know
about the attack and let the user know about that .If there is no
application ,  could you give some hints on how to develop an
application .Any comment is  appreciated .

Thanks,
Ratheesh
