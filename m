From: Jon Wilson <lists@erentil.net>
Subject: Re: Port forwarding (non-NAT)
Date: Mon, 18 Feb 2008 17:26:29 -0700
Message-ID: <47BA2235.4050806@erentil.net>
References: <16791323.9561203376688071.JavaMail.SYSTEM@tater>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <16791323.9561203376688071.JavaMail.SYSTEM@tater>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Kristofer <kristofer@cybernetik.net>

Kristofer wrote:
> I've googled and done some searches, and the only information I can find is for port forwarding with NAT. Perhaps that's what I need to accomplish what I am trying to do. If I missed an obvious link or source with this information, I apologize and please slap me. 
>
> I currently have an SMTP server listening on port 25, and the machine has its own static IP address, no NAT is being used. 
>
> I want to use iptables to forward inbound traffic on port 587 to port 25 of that same machine, so basically making SMTP listen on both ports. I do not wish to configure the SMTP software to listen on multiple ports, since I may want to open up several more ports in the future and that would be a lot of idle daemons listening on ports they may or may not use. 
>
> So, my questions is: how can I have incoming traffic on port 587 go to port 25 of the localhost? 
>
> Thanks, 
> Kristofer 
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   
if iptables on the same computer as the smtp server:

iptables -t nat -A PREROUTING -p tcp --dport 587 -m state --state NEW -d 
$IP_OF_MAIL_SERVER -j REDIRECT --to-ports 25

else:

iptables -t nat -A PREROUTING -p tcp --dport 587 -m state --state NEW -d 
$IP_OF_MAIL_SERVER -j DNAT --to $IP_OF_MAIL_SERVER:25

(assuming you allow established, related through)
-- 
Jon Wilson
