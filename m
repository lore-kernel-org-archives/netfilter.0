From: Aleksander Kamenik <aleksander@krediidiinfo.ee>
Subject: Re: Port Forwarding
Date: Fri, 05 Jun 2009 16:47:35 +0300
Message-ID: <4A2921F7.10407@krediidiinfo.ee>
References: <002201c9dfcd$83cd7660$8b686320$@com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <002201c9dfcd$83cd7660$8b686320$@com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: barich@trisectrix.com
Cc: netfilter@vger.kernel.org

Barry A Rich wrote:
> iptables -t nat -A PREROUTING -p tcp -d 192.168.0.1 --dport 5000 -j DNAT
> --to 192.168.4.2:5000
> 
> iptables -t nat -A PREROUTING -p tcp -d 192.168.0.1 --dport 5001 -j DNAT
> --to 192.168.5.2:5000
> 
> It does not work and I'm not sure what's wrong. What is the correct way to
> do this?

I'd say your modems don't know nothing about the 192.168.0.x subnet, so 
they route the reply packets via their default route which is the ISP's 
gateway.

If you can add the 192.168.0.x route to the modem, you might be fine.

Or you could SNAT the packets going to the modems (in addition to the 
DNAT) as if they are from 192.168.4.x and 192.168.5.x respectively.

Though I have to say it, do you really need the 192.168.4/5.x subnets?

Regards,

-- 

Aleksander Kamenik
System Administrator
Krediidiinfo AS
an Experian Company
Phone: +372 665 9649
Email: aleksander@krediidiinfo.ee

http://www.krediidiinfo.ee/
http://www.experiangroup.com/
