From: "Vitthaladevuni, Pavan Kumar" <pavanv@qti.qualcomm.com>
Subject: Reading packets larger than MTU size from netfilter queue
Date: Tue, 2 Sep 2014 20:28:01 +0000
Message-ID: <80a719e3475b44f580d8f0494ea688b0@NASANEXM01D.na.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
  s=qcdkim; t=1409689701; x=1441225701;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=SEXPWWhM2jQt8fJtzBSGcwPwgR3KCgTfZopirUIggkw=;
  b=SnP3ZnNEjZfIqGm7nWT7HL+ZtXemWHV/Fcnnptpgez8DWPZe154VDYSj
   7y5PJ3ElYwHT3B9UZvJibAyWkOH1w2i8oincLOgfTZf5e8WlpgBYQ9r3j
   yOhGe22j7hykn9vd9cs4UnJiRn5EZ01pWF++CZugZNOnxVxbqmzUGq3rl
   A=;
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello,

I am trying to read incoming TCP packets. TCPdump shows that there are packets of size 20-30KB that are arriving.The IP header of these packets has the "Do Not Fragment" flag set to true. 

When I try to read them from the netfilter queue, I am failing. I am using this command: 

"status = recv(nfq_fd(_NFQHandle), buf, sizeof(buf), MSG_WAITALL)." 

Even with MSG_PEEK or MSG_MSG_DONTWAIT, these packets are not being read. I am able to increase the MTU size only upto 9KB. Any packet that is larger than this MTU size is not being read by the recv function.

My question is: Is it possible to read un-fragmented packets that are larger than MTU size using the recv function from the netfilter queue?

Thanks
