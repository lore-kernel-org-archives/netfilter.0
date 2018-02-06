From: Gregory Vander Schueren <gregory.vanderschueren@tessares.net>
Subject: How to retrieve original source address with FTP/NAT/TPROXY
Date: Tue, 6 Feb 2018 15:49:24 +0100
Message-ID: <5a11d6bb-ac44-fb67-779f-4b29f4ecea37@tessares.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares-net.20150623.gappssmtp.com; s=20150623;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language;
        bh=8SI9CAGbVeuPu4UwV0fyZjzJgdZi4Rfsj8CSVOC5qGQ=;
        b=iZz0HzB1ak4IB4L4z6vihzLbuQm3DNTnb++KbDMmAFCu/KVj3nZPDrJEeKTq7UiULg
         C/lXahnXue5d0cAkyTUBMc7iTEPT70hRo2io1IRrq6AmZWhe+iYBFltz3jCywlAvLbDR
         mchJy9OvqSj9qPtQ3seaIKAu2IVe2CBvJX6FRRV5UXivhWxIQ8awsYSLf/mLpeZbz8gn
         vHozotk5tPpCw9yEypL9vNGoNcUzLSqI/mvmeU7j1oglsoI944CvV/f2GRp1xrVpYhq6
         1WV9Z0hamTNLa5oXe6bojbYnD6WlYc4kXVz+eaCwROeE2jrAtP8vK2KQA04gkkcu1p71
         k4xg==
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: Matthieu Baerts <matthieu.baerts@tessares.net>, Gregory Detal <gregory.detal@tessares.net>

Hello,

I have the following IPv4 network:

FTPClient <-----------------> Proxy <--------------> FTPServer.
      10.0.0.2          10.0.0.1   1.1.1.1        1.1.1.2

FTPClient connects to FTPServer in PASSIVE mode, meaning the FTPClient
initiates the data connection towards FTPServer. Proxy performs NAT in 
the POSTROUTING chain using the iptables MASQUERADE target. On Proxy, I 
use the iptables TPROXY target to redirect the FTP data connection 
towards a local socket.

Upon accept() on this socket, the address returned by accept() is 
1.1.1.1, not the IP of the Client (10.0.0.2) as I expected. Using 
getpeername() also returns 1.1.1.1. For other TCP connections than FTP 
accept() or getpeername() returns 10.0.0.2.

I noticed this only occurs when using the NF_CONNTRACK_FTP and 
NF_NAT_FTP kernel modules.

Note that I was able to retrieve the FTPClient IP on Proxy from
/proc/net/ip_conntrack. I also made a quick patch to add a 
SO_ORIGINAL_SRC socket option (similar to SO_ORIGINAL_DST) which allows 
to retrieve the FTPClient IP. Since this option does not exist yet, I am 
wondering if this is relevant to add such an option?

Also, this does not occur in IPv6.

Is this behavior normal?
What is the rationale behind this?

Any help in understanding what happens would be much appreciated,
Gregory

(My apologies for initially sending this on the devel mailing list by 
mistake...)

-- 

------------------------------
DISCLAIMER.
This email and any files transmitted with it are confidential and intended 
solely for the use of the individual or entity to whom they are addressed. 
If you have received this email in error please notify the system manager. 
This message contains confidential information and is intended only for the 
individual named. If you are not the named addressee you should not 
disseminate, distribute or copy this e-mail. Please notify the sender 
immediately by e-mail if you have received this e-mail by mistake and 
delete this e-mail from your system. If you are not the intended recipient 
you are notified that disclosing, copying, distributing or taking any 
action in reliance on the contents of this information is strictly 
prohibited.
