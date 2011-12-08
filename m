From: ratheesh kannoth <ratheesh.ksz@gmail.com>
Subject: Sending ICMP echo request out
Date: Thu, 8 Dec 2011 12:46:36 +0530
Message-ID: <CAGZFCEEux4TBE+JAqzx9CDJ1HGdNXnqQBHBxhJ8TXEQh3Zq7_w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=i7yAWdukqk5NKjIiS4goC1Mnd2dnfdxBdq1pluz6pBw=;
        b=e1varidzFpDHabUf+jAiP5UxCjlqmn0lq62DVVNbGJV/EN+WiULY32R9FR/dD4BAvt
         y6/LPtcLVVMxSyBfahVlMshUDRxuOiVj6LBgTTS2it+Jv9lm1uwYGH1yO1e94fblzENP
         g1gem14e6AX/rrVBdyxpB8v5/ZoAlavX7Fh+w=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-newbie <linux-newbie@vger.kernel.org>, Netfilter mailing list <netfilter@vger.kernel.org>, linux-net@vger.kernel.org

Hi ,

I have a linux machine with two interfaces  eth0 (192.168.1.100 )  and
eth1  ( 192.168.1.200 ) . Both are in same subnet ( 192.168.1.0/24 ) .

eth0  and eth1 are  connected to a switch . I want to send an icmp
packet from eth0 and reach eth1 thru the switch. As of now linux
machine , bypass the packet thru
the stack since both this interfaces are on the same machine. Is there
any way to do this ?


-Ratheesh
