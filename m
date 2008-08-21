From: Abhishek Singh <aks.abhishek@gmail.com>
Subject: Regarding iptables mac matching
Date: Thu, 21 Aug 2008 20:18:14 +0545
Message-ID: <48AD7CAA.8020205@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:x-enigmail-version:content-type
         :content-transfer-encoding;
        bh=l5yLtKu9i2OXs/ZeDce3zbEotSPNizJCcg89Wp0BiTg=;
        b=wx4qrVxcl5MU5CBKkuGJZACTpEQiWoBbo/0J+fRH/6P47AqLrGImXrWdtb6lvh9LoS
         tUXvBsE5oPQuhUv7R4f9s2TGj/EqS1FQiLb82eWTqCbZhtk5pUfwFBwSUFqW/3JZk87Z
         4HX8u1gZBOaGkZ5Z9ZZAjZ63vysblFPi56Rp8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Dear All,
     I'm using iptables on Fedora 9. I need to block network access to a 
specific mac address. My LAN uses a gateway. On the gateway I'm using 
iptables for firewalling. I monitor the network traffic from hosts on my 
LAN, and need to block the hosts which are consuming too much of network 
traffic. To block a host with MAC address 00:E0:4D:02:1F:B8, I added 
these rules in iptables:

iptables -A INPUT -m mac --mac-source 00:E0:4D:02:1F:B8 -j DROP
iptables -A FORWARD -m mac --mac-source 00:E0:4D:02:1F:B8 -j DROP

I tested the network connection on the host with the mac address 
matching 00:E0:4D:02:1F:B8 and I got the following results:

   * The gateway blocked ssh and ping requests from the host.
   * But I was still able to access other servers on real ip (say
     pinging google.com, worked fine)

I like to block the access of that host to other hosts, the gateway and 
the internet as well. But I'm unable to do that using the above 
mentioned rules. I'm quite optimistic that someone help me with this 
problem.
Thanks in advance.

Regards,
Abhishek Singh


