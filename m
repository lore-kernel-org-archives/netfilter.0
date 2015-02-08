From: jack Linux <ilinuxer.85@gmail.com>
Subject: Limit transfer speed rate by Iptables Rules
Date: Sun, 8 Feb 2015 09:21:36 +0200
Message-ID: <CAGHcRxabrZY2BO-by4L266cokmhtFp5Vrzbr-vp1t5Mkp4n8vA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=PEn/7hl5OBbyJKeP5+a6GPE2Wlmybh/FtZzVdqk8g+o=;
        b=klrVTnpxzgVS2bm0bcD68Gc4Vas7ighKfOZbpWYK58+kY0Pf46qZYGFIO1hq28G8uG
         hTMcuXbc/pl6BLEMiLYYrqiodncMscOgCLDoewInelQ8Rk+axHcOG1+hIjEkprjT9BU/
         GAK3PNWg9A6H5MECF3kkZLnpWZO3uHp9jGz7f7GpRmSOMEaZzXOydPIP4C/wE0RDDrRp
         FYMk7MgUGqZszrOlgyLhUmqFGZrzzb9NBgEyfJTwLefMuK72TRyfgz2itWtJY0rYqmAx
         xiA2OuoubmfmzXlx0TB/Al5Lp1ZKmfGJKPiRPIZO2rHYCvW9fZvfiKI6VC4ZfCn6tTF3
         VBJw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have D-Link Router DSL-2730U that support busybox OS and iptables
version 1.4.0

I managed successfully to block the host for being connect to the
internet using the following command

Block by ip address

iptables -I  FORWARD -d 192.168.1.6 -j DROP

Or By mac source

iptables -I FORWARD -m mac --mac-source bc:20:a4:ff:79:80 -j DROP

The only problem now i have is trying to limit transfer speed rate
(upload & download) to be only serve 30/kbps by MAC Address using

iptables

I tried to make iptables rule like

iptables -I FORWARD -m mac --mac-source bc:20:a4:ff:79:80 -m state
--state RELATED,ESTABLISHED -m limit --limit 100/second --limit-burst
30 -j ACCEPT

But it didn't work

Note : this router cannot modify , delete or add any files . i cannot
make a bash or script file inside the router run , and unfortunately
the iptables connlimit module not supported in this iptables version
too
