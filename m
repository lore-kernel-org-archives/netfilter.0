From: "Pranav Desai" <pranavadesai@gmail.com>
Subject: Some weird issue with return traffic with redirect rule
Date: Thu, 16 Oct 2008 23:30:56 -0700
Message-ID: <cc64e8ce0810162330i44d61166xc16eafc0cfbf3834@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=4Jic3nDtq3pNlNLko34gClvM5C3Cby55IVXhhLa0Vjg=;
        b=pvQEd+vaINIlwD9CCw3p2hd34+HH40+AkmYzD6n8+RRJl7qMByFiO8NOhQyoteU77a
         qBuYPoyZ2+qaJ2xNu0Xj6vwCTN8nTOspBLejaAHGahRLCMgAWryrlIcPqnWaJoDK1Db9
         VHzJUx9a3xSwQchKzcOF14A3grbKRexMUTjz4=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello All,

We have a http proxy server running in transparent mode, with the
following rule to redirect port 80 traffic to the proxy port 8001.

1348K   81M REDIRECT   tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           tcp dpts:80:82 redir ports 8001

We are running with iptables 1.3.8 and kernel 2.6.20.15

We are seeing cases where the return traffic is going out using the
proxyIP and port 8001, instead of using the origin servers IP and port
80. I have added the traces for both cases below. Most of the traffic
goes out correctly using the origin server IP and port, but the
traffic using port 8001 is not insignificant, hence we are a bit
concerned about it.

There are no connections coming in to port 8001.

I am not sure what could be causing this behavior or how I should go
about debugging this. Could the conntrack table or its usage be
screwed up?

I would appreciate any help I can get.

Thanks
-- Pranav


trace with traffic showing expected srcIP:srcPORT of the origin server
(80.93.57.77:80)
the 10.1.20.130 is the client.
======================================================
3:47:32.681258 IP 80.93.57.77.80 > 10.1.20.130.46236: P 1:511(510) ack
409 win 1716 <nop,nop,timestamp 21142119 3794704082>
13:47:32.681268 IP 80.93.57.77.80 > 10.1.20.130.46236: P 1:511(510)
ack 409 win 1716 <nop,nop,timestamp 21142119 3794704082>
13:47:32.766609 IP 80.93.57.77.80 > 10.1.20.130.2812: . ack 497 win
6432 <nop,nop,timestamp 2878779340 21142116>
13:47:32.787985 IP 81.176.228.45.80 > 10.1.20.130.13698: P 1:234(233)
ack 410 win 33304 <nop,nop,timestamp 3734311841 21142115>
13:47:32.788002 IP 10.1.20.130.13698 > 81.176.228.45.80: . ack 234 win
1716 <nop,nop,timestamp 21142145 3734311841>
13:47:32.788003 IP 10.1.20.130.13698 > 81.176.228.45.80: . ack 234 win
1716 <nop,nop,timestamp 21142145 3734311841>
13:47:32.797206 IP 10.1.20.130.13698 > 81.176.228.45.80: F 410:410(0)
ack 234 win 1716 <nop,nop,timestamp 21142148 3734311841>
13:47:32.797211 IP 10.1.20.130.13698 > 81.176.228.45.80: F 410:410(0)
ack 234 win 1716 <nop,nop,timestamp 21142148 3734311841>
13:47:32.797273 IP 81.176.228.45.80 > 10.1.20.130.50121: P 1:234(233)
ack 426 win 1716 <nop,nop,timestamp 21142148 3791907207>


Part of the trace which show traffic going out incorrectly using
proxyIP 10.10.224.5:8001
===========================================================
13:44:35.129072 IP 10.10.224.5.8001 > 10.1.20.130.36356: P
3807971279:3807971789(510) ack 897430549 win 1716 <nop,nop,timestamp
21097733 3542594707>
13:44:35.129079 IP 10.10.224.5.8001 > 10.1.20.130.36356: P 0:510(510)
ack 1 win 1716 <nop,nop,timestamp 21097733 3542594707>
13:44:35.158793 IP 10.10.224.5.8001 > 10.1.20.130.37781: P
3805867807:3805868040(233) ack 897312088 win 1716 <nop,nop,timestamp
21097741 3542594707>
13:44:35.158801 IP 10.10.224.5.8001 > 10.1.20.130.37781: P 0:233(233)
ack 1 win 1716 <nop,nop,timestamp 21097741 3542594707>
13:44:45.690977 IP 10.10.224.5.8001 > 10.1.20.130.49664: P
3804891276:3804891509(233) ack 898418728 win 1716 <nop,nop,timestamp
21100373 3542594707>
