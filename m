From: Mark Ryden <markryde@gmail.com>
Subject: netlink sockets and NETFILTER_FIREWALL
Date: Sun, 10 May 2009 15:17:42 +0300
Message-ID: <dac45060905100517j63fe6f13v6c623635f6c4ef6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=ePG2hYXm8J+VR0TCNyPg6FIbo6C8pwxL+OyrEx2w4Lo=;
        b=TTj8kesQ1LhRKtNkELlkDu23R7mvQYXftxYOFx2x3x2wcHqjggXQDWPYBxhFmcUuc9
         XmTYjJb67t8CAsJZ2u6GcX1pLeE1Hcc2GtqcFBy9lbq+FBofyQIxVpwAYWFecyif5XRn
         xKp9YXcc8Kizmivj8/DO+6ic+EyaVDev4erk0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,
I saw that there is a way to pass packets to user space by this
iptables rule (on Linux):

iptables -A FORWARD -t filter -j QUEUE
and running:
modprobe iptable_filter
modprobe ip_queue


My question is: I want to open a user space application
which opens socket and catch these packets.
Is there some good link demonstrating how to do it ?
I saw some sites which talk about NETFILTER_FIREWALL and netlink sockets, but
I am not sure. Any ideas?

Rgs,
Mark
