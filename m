From: "Mikhail Kruk" <meshko@gmail.com>
Subject: question about snat on a router/firewall with 2 uplinks
Date: Fri, 18 Jan 2008 19:29:58 -0500
Message-ID: <5a28e8c20801181629r6299c8e4yab5b190384441952@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=xiJM1+9Dkq6lF9A4xKm7CnSHBwaBi9uZ/Yapl8wf12M=;
        b=kqGoUzgErnhqMJbgh85J618XeujGNljh+WlGswlUx+odufWJuyPHuth/0C4EMLuFkSgbTf6ojsjBGYoU+FQ0dlMOBUDVdjsrX6pVERSGHJaIDcR3hTAmI67TTG+jEXRZf1EQDIQb7D2Ykkziyvto3NDBcLCWZd9vixD84xjHriU=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I'm going to add the second uplink to my firewall.  Right now I have a
SNAT rule which puts an ip address with a PTR record for the traffic
originating from the internal mail servers.
What should I do now that I will be having 2 sets of ip addresses?  I
want it to be fault tolerant so that if one of the uplinks goes down
things would still work.
Is there a way to achieve this?

Thanks!
