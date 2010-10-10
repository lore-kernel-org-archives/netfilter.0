From: JD <jd1008@gmail.com>
Subject: Question about a blocked packet sent by a windows machine on my lan
Date: Sun, 10 Oct 2010 13:26:36 -0700
Message-ID: <4CB2217C.6020904@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=rgl2YzSTjCoQOWormGrPiBy7XJt/7IfU0MOhTxOtWCo=;
        b=wWGLjny6zHBdTDLkGBisSyOod5mKgK8RUYJp2ulcJeJY8fCek6jvVuUPf9/bUp98Eg
         kBvLz7k0ldkz7PyPXVEfpOrCWaPLBSvN3iAc6og15TXqoaUOqzVrSZKSN+1zN6yGA0+l
         r5pHljpPZPg+L/Hw0ainTX+C+Q02njJ3qZCPY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

  Our home lan runs through a router/firewall.

I was browsing the router's logs and found this:

INF 2010-10-10T09:46:36-07:00 fw,fwmon src=192.168.1.3 dst=10.64.36.31 
ipprot=6 sport=2588 dport=80 Drop traffic to 10.0.0.0/8

The thing is, I have no 10. on my LAN.
My LAN is all 192.168.1.X, (class C).

Why would a windows machine broadcast this packet to
http server port ports at all 10.0.0.0/8 machines?

Is it an indication that the windows pc is/might be infected?

Thanks for your help.

JD
