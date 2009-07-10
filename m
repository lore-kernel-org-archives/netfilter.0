From: Fabio Marcone <fabio.marcone@duet.it>
Subject: tc and virtual interfaces
Date: Fri, 10 Jul 2009 14:01:16 +0200
Message-ID: <4A572D8C.7010703@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi all,
I need to add traffic shaping in a linux router (debian) and I need to 
understand tc behaviour with virtual interfaces.

Examples:
I have eth0 and eth0:0, if I set a limit on eth0 datarate, is also 
eth0:0 involved?
...or...
If I have a tunnel OpenVPN (tun0) on eth0, how is managed data rate limit?

Thanks in advance,
Fabio (I hope this post is not OT)
