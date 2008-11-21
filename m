From: "varun uppal" <varuneet.uppal@gmail.com>
Subject: problem with ip_queue
Date: Fri, 21 Nov 2008 15:13:32 +0000
Message-ID: <ed1bf3f70811210713w7bc46adbp17a24c9ece01fedf@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=M2iBArrNxfsteg4hCPXP1OytvijJN4QwJFEmzOrkmic=;
        b=Jo3Z36ls+lqNPz4Fnvbjl7D2vRgddcnZHcnz4BjnYMlNzN92UmzbV3B3DZ5h9gwviE
         d4oZCROrTYN96Q6RTv1KvFWAm/5ZqQJTLGV9AWDfpAdK5PX2PG5Ra01gkJuUGOHGxET/
         AJkKAEYwkFpagYmX3Xok/pkG6Vv+qvc6dYcC0=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

  I am using a utility which reads packets from ip_queue, queued by
iptables  capture on INPUT chain of filter table using QUEUE target.
 I am getting a wierd problem, the incoming TCP segments especially
with size larger than around 200 bytes get corrupted.
I took tcpdump on the machine and the data in the segments looks fine,
but when read by utility, most of the TCP payload looks to be reset,
and checksum value is same as was seen in the tcpdump traces taken on
the interface.
Is this a problem with ip_queue module, which is not being able to
copy larger packets to user space.
I have red hat enterprise linux 4, with kernel 2.6.9-42 and iptables
version 1.2.11

The same utility works fine with kernel 2.4.26 and 2.6.18. My problem
is i cannot change the kernel on the machine on which i am getting the
problem. Can someone please help.

thanks
varun
