From: Christoph Paasch <christoph.paasch@gmail.com>
Subject: Re: multicast packets
Date: Fri, 26 Feb 2010 00:16:03 +0100
Message-ID: <201002260016.03945.christoph.paasch@gmail.com>
References: <cfeab66d1002240643s6c4b87dfl5c3069f1c91cecd8@mail.gmail.com> <cfeab66d1002242238m3216eb64ice0ca627cb30fa39@mail.gmail.com> <cfeab66d1002250952w58e1651dnd5c104ab10c626d1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=uMwIlSV55Gn40YtWTfqeX31cXRWvkWvqrTX4OERi0k4=;
        b=LFR31F00oNO2p9oSF7Yh/UBloocItsUMRAYoRLMD+sxnJsF9pfx3MJcj8NTzaVta6r
         Gi/19sGyDPZt9ZL5VMjY3Q/gvX34OqGE+H0VC4lvRN18fhNfx9SPjcF2XD8WuPRqPeVu
         T1hLtwVbqKcGMLeiyoeFJs2JYn/3xX6Gyhui4=
In-Reply-To: <cfeab66d1002250952w58e1651dnd5c104ab10c626d1@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: netfilter@vger.kernel.org

Please, provide more information about your setup.

What are the policies of your chains? What is your ruleset?
What is your topology?
What do you want to achieve, and what are you observing?

Christoph


On Thu 25 February 2010 wrote ratheesh k:
> iptables -A INPUT -m state --state ESTABLISHED,RELATES -j ACCEPT .
> 
> This is the only rule . No firewall hole for igmp packets .
> 
> On Thu, Feb 25, 2010 at 12:08 PM, ratheesh k <ratheesh.ksz@gmail.com> wrote:
> >>>>>>>>>>udp doesn't go into the established state.
> > 
> > I am running "igmpproxy" on my gateway box . I didnot add any rule in
> > INPUT chain to accept igmp packets . But  i hve a rule to accept all
> > ESTABLISHED state packets . It am able to stream igmp from my desktop
> > .
> > 
> > I really believe that " We dont need any rule in FORWARD chain " .
> > Because packets are flowing from node to node and routed . So only
> > INPUT and OUTPUT chains are involved .
> > 
> > Thanks,
> > Ratheesh
> > 
> > 
> > 
> > On Thu, Feb 25, 2010 at 12:03 AM, Christoph Paasch
> > 
> > <christoph.paasch@gmail.com> wrote:
> >> As long as there isn't any return-traffic (as it is the case for
> >> multicast- udp), udp doesn't go into the established state.
> >> 
> >> Regards,
> >> Christoph
> >> 
> >> On Wed 24 February 2010 wrote ratheesh k:
> >>> multicast packets are udp packets . But its flowing only from
> >>> upstream to downstream . So packet state will be always "NEW" . ??
> >>> 
> >>> my question is : whether we can see multicast data packets in
> >>> ESTABLISHED state ??
> >>> 
> >>> Thanks,
> >>> Ratheesh
> >>> --
> >>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> >>> the body of a message to majordomo@vger.kernel.org
> >>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >> 
> >> --
> >> Christoph Paasch
> >> 
> >> Alcatel-Lucent
> >> IP Development
> >> 
> >> www.rollerbulls.be
> >> --
> >> --
> >> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> >> the body of a message to majordomo@vger.kernel.org
> >> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
Christoph Paasch

Alcatel-Lucent
IP Development

www.rollerbulls.be
--
