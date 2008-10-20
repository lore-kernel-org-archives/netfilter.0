From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: is it possible to mix iprange and multiport modules?
Date: Mon, 20 Oct 2008 21:07:37 +1300
Message-ID: <48FC3C49.7010207@treenet.co.nz>
References: <219949.10508.qm@web110412.mail.gq1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <219949.10508.qm@web110412.mail.gq1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cucnews@yahoo.com
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

pedro noticioso wrote:
> Hi there friends!
> 
> I am managing a 15 node vpn network with well over 500 pcs scattered all over, so I am looking for creative ways to simplify and better control my traffic while replacing the old IT guys 1600 line-and-10 seconds to load  firewall script, so I tried a trick that did not seem to actually work:
> 
> /sbin/iptables -A INPUT -p tcp \
>  -m multiport  --source-port 22,53,80,110,443,2525 \
>  -m iprange --src-range 192.168.19.25-192.168.19.100 \
>  -j ACCEPT
> 
> So, am I just dreaming here, or is there a nice trick out there to achieve my goal in an elegant manner?
> 
> thanks a lot!
> 

I'll point you the way of 'ferm'. An iptables utility uses the 
iptables-restore interface for maximum speed on load. With a nice simply 
config file syntax to easily handle fast reload of some complex 
settings. Including methods of doing iterator loops, macro expansion, 
and such if needed.

   http://ferm.foo-projects.org/

NP: My bias here is that of a happy customer.

AYJ
