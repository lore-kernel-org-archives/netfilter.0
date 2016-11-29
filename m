From: Kevin Wilson <wkevils@gmail.com>
Subject: Check whether any netfilter rules are set on a host
Date: Tue, 29 Nov 2016 13:33:16 +0200
Message-ID: <CAGXs5wU=MBMtTPQ-Ori5RgazkJ=33h5SLaMQMoCTpCZR+Hq6ow@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to;
        bh=dLi0MJA+5NMSVtcqzRPIXl3f1+NrrmG5QHe2EITyvf8=;
        b=uOZKdaSVT/lOsfv84C42mwV2vYT70A4iMw8V/yWpJB0z4c5obOBWNApW/n5v2beCez
         cqieIHnMl6GDaIQ/mIXDWUjUCzd3t8/Ybr4batKLj+iPLQFuuekmOapMJITlUhErCaaK
         lvQtIZy5aPUYXBiMhZ5SbQcymE7HAwPewpy8/OAjWG8ayb9AAfSOtqM+x0JAVYCBrX+Q
         l/ZeLhJxEQzuNtioVYZOoCeJtmmvLQ1mAu26MRKX3mlTDqp7g03zo+loDsCiXlkFIm9n
         c4KjUDIrMpwo6o1YVlxSxeXIU+e2YwATTWdKJ77VkqJ5G1PohdNI5smuqjI4SPf/yqZj
         tnfg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,
Is there a way to find out if there any iptables rules set on a machine ?

There are some indirect ways which will not always work; for example,
I know that on most hosts,
iptables -S
will return the following output (when no iptable rules are set)
-P INPUT ACCEPT
-P FORWARD ACCEPT
-P OUTPUT ACCEPT

So you can check whether or not the number of output lines is greater
than 3 (as an indication of whether or not iptables
rules are set).
But there are hosts on which there are more chains then these 3; these
chains are set by application/services, even without any iptable rules
which are set. And after running
iptables -F on these machines, iptables -S will still show more than 3
chains, even that there are no iptables rules set in these chains.

So the question is - is there a way to know whether or not netfilter
rules are set on a host, regardless of the number of chains ?


Regards,
Kevin
