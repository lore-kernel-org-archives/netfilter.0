From: Raymond Burkholder <ray@oneunified.net>
Subject: Re: Netfilter Study material
Date: Sat, 12 Aug 2017 10:29:43 -0300
Message-ID: <003dd0d1-c5cc-3deb-e466-90a96e073e62@oneunified.net>
References: <83F37397-6A0C-4129-8186-4A710932E1DF@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <83F37397-6A0C-4129-8186-4A710932E1DF@gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Sina Owolabi <notify.sina@gmail.com>, netfilter@vger.kernel.org

On 08/12/17 03:46, Sina Owolabi wrote:

> I'm interested in using Linux network software  to route and filter on my network.
> Please where can I find reading material to get me properly started?

http://www.policyrouting.org/iproute2.doc.html -- one of many sites

> I also have a very interesting (to me) problem to solve: I need to have some endpoints failover between two gateway routers on my network which happen to be on the same subnet (both routers have ips  on the same subnet as the endpoints) . Is this possible?

http://www.keepalived.org/documentation.html -- look for vrrp

https://netfilter.org/projects/conntrack-tools/index.html -- used to 
create high availability firewall clusters

> cordially yours,
> Sina Owolabi--

Raymond Burkholder
https://blog.raymond.burkholder.net/


> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.

