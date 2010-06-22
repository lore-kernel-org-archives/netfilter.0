From: Jeff Largent <jwlargent@vlsmaps.com>
Subject: Re: randomly changing IPs from different subnets (Google Mail)
Date: Tue, 22 Jun 2010 13:55:22 -0500
Message-ID: <20100622135522.a0eec81e.jwlargent@vlsmaps.com>
References: <B993B335-596D-48D3-9767-F3565C3B1112@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <B993B335-596D-48D3-9767-F3565C3B1112@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Florian Effenberger <floeff@gmail.com>
Cc: netfilter@vger.kernel.org

On Tue, 22 Jun 2010 20:16:34 +0200
Florian Effenberger <floeff@gmail.com> wrote:

> Hi,
> 
> my default network policy is to block all outgoing traffic and only allow certain packets to pass. For some users, I'd like to open up Google Mail (imap.gmail.com:993 and smtp.gmail.com:587). However, Google's DNS give randomly out different IPs per query. Sadly, they are not all located within a subnet, but vary in all parts of the address.
> 
> If I want to have destination host based rules, how can I do this with iptables? My current idea is to run a cron job every few minutes to add the rules again with the changed IPs, but this sounds like an ugly workaround, and will clutter my user-defined chain heavily.
> 
> Is there any other approach, other than opening up all traffic to 993 and 587?
> 
> Thanks,
> Florian--
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Are they actually random or are they just round robined from DNS?
If they are coming from a round robin queue then when you add smtp.gmail.com
iptables will add a rule for each address it resolves to.
Another option may be to do a lookup on MX record for gmail.com and add those
hosts.

tracer1:~$> dig -t MX +short gmail.com 
40 alt4.gmail-smtp-in.l.google.com.
5 gmail-smtp-in.l.google.com.
10 alt1.gmail-smtp-in.l.google.com.
20 alt2.gmail-smtp-in.l.google.com.
30 alt3.gmail-smtp-in.l.google.com.





-- 
Jeff Largent <jwlargent@vlsmaps.com>
