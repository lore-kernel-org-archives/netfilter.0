From: ivan <lagigliaivan@gmail.com>
Subject: L2 NAT
Date: Fri, 14 Nov 2008 14:34:40 -0200
Message-ID: <f4d9d6df0811140834h5e8397b9y1b544c637bb29d78@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=grPr2zZrKUZgB5MVsJEikXGPHfstlTghz23kUJ5iL+M=;
        b=A2xluJkRo8TwjRgNvtcMqzR/AJ6wtDuI6r0YMdM0coOfEFoS5wHwYC/xYZ45llXgZF
         9ufPF5gojApkGyGn63wiCeKiLEPDd+VJysJQciUxYhZlTMeFBAffDbTEwIDRaPpOec9h
         8AYV0w/Hz22f4Be1eTTOKtn7ju0WyEMMRGaHY=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi All,

I need to connect three devices via ethernet, through a switch, to the
same tftp server. The problem is that these devices have the same IPs,
i.e. 192.168.0.181, and when I address to or get data from one of
them, I can't tell which device I'm actually talking to. The devices
are three items of the same product, and their IP cannot be changed.

I have implemented a perl script that changes the ARP table in tftp
server side, but I need a stronger solution.

I was thinking on developing a sort of L2 NAT which could change the
IP source address of a package according to its MAC address, and put
it in the middle of the tftp server and the devices.

Using the current iptables command can I set up this?? or  I need to
develop my own kernel module???

If you have any idea please let me know.


Thanks.
