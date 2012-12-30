From: Aaron Lewis <the.warl0ck.1989@gmail.com>
Subject: Mirroring traffic with iptables TEE target
Date: Sun, 30 Dec 2012 17:10:48 +0800
Message-ID: <20121230091048.GA4575@devnull.qunarservers.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:date:from:to:subject:message-id:mime-version
         :content-type:content-disposition:user-agent;
        bh=xGv9L5nsCAaYPMbyXfW1BtiKyBA9yMkGOd0i1HTsoh0=;
        b=cXBSoJtDqRq/dg8Stowt68zlJ2vEImhfVzd6fEGaxmQKJrtrGNGKllYzrL7J5Lr5jS
         gW9SGUsyoEusSwNbYpKSv8G2LCIPHEUteYaQqYiLQ3fIm/hdzO+dqNsAdfTRbOqa/JL/
         DlGHxtclwwQo80ZhvOG4sYC01SjDCDPuvopbrtOMhv+LEFzSQ4V+kBMa61S9l8xNO67M
         hIz4s+LankqlIY2GGhkXSdiaVXHHMDy4RxrFW/HPvrpU+D0Zta2OEK0B291uWZAHhmkN
         EKKGsIwuxmKDQk6GAeTKoo5gxf6O0SRcCYLvrhnmyTHbpYBA+x4e2GLKMi8fpi/CA5bg
         9TQw==
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter mailing list <netfilter@vger.kernel.org>

Hi,

I tried to mirror TCP traffic with mangle chain, 

that all packets sent to 192.168.56.2 would be copied to 192.168.56.1,

# On 192.168.56.2 I executed,
iptables -A PREROUTING -p tcp --dport 80 -j TEE --gateway 192.168.56.1

But on 192.168.56.1 no traffic to port 80 was seen

Anything wrong?

-- 
Best Regards,
Aaron Lewis - PGP: 0xDFE6C29E ( http://pgp.mit.edu/ )
Finger Print: 9482 448F C7C3 896C 1DFE 7DD3 2492 A7D0 DFE6 C29E
