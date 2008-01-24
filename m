From: "David Harris" <protectpoint@gmail.com>
Subject: Packets being natted (unwanted) when asymmtric routing
Date: Thu, 24 Jan 2008 10:06:46 -0500
Message-ID: <9e6a20d20801240706h454dfefdwd9982f360e7130be@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=i9dwNwMeCUmSfA/WbwyTnWaqBp7UfDMT6mUyShlQRwM=;
        b=e95/J8o8y8TtcQ/IYi5IClv14oPp40Ow1zp9eyPbFpgDsCkuepeT3FFeWDvrhrQRHmmIumX/jZEr6dGTqVACO4mNHpli8p8ZDUgw9Woi/qqe9eyGaHMRsu6S1zQmQyk/zLOZamx3s94j6cGUF9afQmGRDffCJvN/BAC5N23Jlsc=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I have the following scenario, any insight into why this is happening
would be great:

HTTP initial SYN comes in eth4 out eth0.
SYN-ACK comes back in eth0 out eth4.
ACK comes in eth4 out eth0.
GET request comes in eth4 out eth0.

This is all fine and good. Then:

The response from the HTTP server comes in eth1 and goes out eth4.

The problem is, my linux box changes the source port from port 80 to
something else and I have no idea why.  This obviously causes the
request to not work

SYN
=-=-=-=
11:16:57.442624 eth4 < 10.175.130.221.3326 > 74.52.32.85.http: S
1975949470:1975949470(0) win 65535 <mss 1380,nop,nop,sackOK> (DF)
11:16:57.442668 eth0 > 66.129.118.229.3326 > 74.52.32.85.http: S
1975949470:1975949470(0) win 65535 <mss 1380,nop,nop,sackOK> (DF)

SYN-ACK
=-=-=-=
11:16:57.579041 eth0 < 74.52.32.85.http > 66.129.118.229.3326: S
344376811:344376811(0) ack 1975949471 win 5840 <mss
1460,nop,nop,sackOK> (DF)
11:16:57.579049 eth4 > 74.52.32.85.http > 10.175.130.221.3326: S
344376811:344376811(0) ack 1975949471 win 5840 <mss
1460,nop,nop,sackOK> (DF)

SYN
=-=-=-=
11:16:57.716492 eth4 < 10.175.130.221.3326 > 74.52.32.85.http: .
1:1(0) ack 1 win 65535 (DF)
11:16:57.716498 eth0 > 66.129.118.229.3326 > 74.52.32.85.http: .
1:1(0) ack 1 win 65535 (DF)

HTTP GET
=-=-=-=
11:16:58.447934 eth4 < 10.175.130.221.3326 > 74.52.32.85.http: P
1:196(195) ack 1 win 65535 (DF)
11:16:58.447948 eth0 > 66.129.118.229.3326 > 74.52.32.85.http: P
1:196(195) ack 1 win 65535 (DF)

HTTP RESPONSE - Here is the problem. The websense is replying on
behalf of the HTTP server with a 302, with the goal of redirecting the
client to a blocked page. It comes in eth1 from the websense, then it
goes out eth4 where the client is, which is good. But the linux box
has changed the source port from 80 to 126. This is the problem.
=-=-=-=
11:16:58.450321 eth1 < 74.52.32.85.http > 10.175.130.221.3326: FP
1:148(147) ack 196 win 1024 [tos 0x10] 11:16:58.450340 eth4 >
74.52.32.85.126 > 10.175.130.221.3326: FP 344376812:344376959(147) ack
1975949666 win 1024 [tos 0x10]

Thanks,
David Harris
