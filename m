From: paddy joesoap <paddyjoesoap@gmail.com>
Subject: comments about local loopback interface rule granularity
Date: Tue, 13 Mar 2012 14:28:00 +0000
Message-ID: <CAMmbHwnH1YSW8vFJu2aoFSnY-vSDRS9KtGdhSe2G=tdyhGgmsg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=rUD1e/ThLy8qkbZxk2x93qtUwhm6T8SMEpEnhaENfAY=;
        b=osvX/7EGUfuSCpmMbcr+G/sJkTcZyXl1tK7Ps9ngJJ+cCbQBnQt+ZkXte54G/t9yYI
         SzgKWNyhQMxqsjpXekGezDU9YPTWhFU8P2v+u+S4T6ueK5uw8BK9nvWQ+/cZbCKcyOZp
         HBCr138iEWpYJNP7adQ4xlt2RJDi4MerpB5sOql9+NxYyi3mbIckeO7J3/MWKwvpMuvo
         ZLDRV9nCvZE4TSdnunrhvLtSkGL0zG3Olk4sYd2piVnqtkX2Aglw9L4ezXV4ZCT10+GY
         1Fbzwng0MZR4sKAsWFdKeJaxKX2eRIS8Nv2cMCuZbH+sSif0eOvEiIM3r20hUAkF5tlw
         yHEg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,

What is the correct local loopback iptables rules for a single hosted
firewall (laptop)?

I often see the following:

iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

where a default DROP policy is applied to both INPUT and OUTPUT chains.

I notice with this configuration I can ping the localhost (as
expected) but I also can ping the local IP address of the machine!

Why is this this the case with respect to the local IP address?

Is this the correct set of rules?

iptables -A INPUT -i lo -s 127.0.0.1 -j ACCEPT
iptables -A OUTPUT -o lo -d 127.0.0.1 -j ACCEPT

With this configuration I can ping the localhost (as expected) but NOT
also ping the local IP address of the machine :-)
The loacal IP address of the machine is tied to a real interface such
as eth0 and therefore no ping packets this time as expected.

I presume the only traffic that should ever communicate with the "lo"
interface is traffic to and from IP address 127.0.0.1.

any comments are welcome.
Paddy.
