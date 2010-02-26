From: Christoph Paasch <christoph.paasch@gmail.com>
Subject: Re: multicast packets
Date: Fri, 26 Feb 2010 07:41:42 +0100
Message-ID: <201002260741.43169.christoph.paasch@gmail.com>
References: <cfeab66d1002240643s6c4b87dfl5c3069f1c91cecd8@mail.gmail.com> <201002260016.03945.christoph.paasch@gmail.com> <cfeab66d1002252117p3ecaba32l265f102d0e61a43b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:references:in-reply-to:cc:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=r3Qw3O74qX+t7plXJGIb637jzwR3WCTwZMKH8QYllzY=;
        b=fX4kaZK9OmJMBAqvysp21EEBvR/PyFrd4v+o/ewiGIGJlBk5nCdQvqo0/32+W6mgPI
         fpJjBiq5T4rcVnpkrWbzRc+iOBnkunia+TWZpe6Rrx7JaZHf7cO+0ppWEWhj0BL47h/9
         GQu+FDXfB7YLBd1YRe+LH3nCL8wfnYytUhPTY=
In-Reply-To: <cfeab66d1002252117p3ecaba32l265f102d0e61a43b@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: netfilter@vger.kernel.org


On Fri 26 February 2010, ratheesh k wrote:
> INPUT  policy is DROP
> FORWARD policy is DROP
> OUTPUT policy is accept
> 
> 
> INPUT chain
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A INPUT  -i eth0  -j ACCEPT
> 
> 
> FORWARD
> iptables -A FORWARD  -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A INPUT  -i eth0  -o eth1 -j ACCEPT
I imagine that this is a typo and that you meant the FORWARD chain.

> 
> machine                    Gateway machine B
>    A -------------------->eth0              eth1 -------------> internet
> 
> I have a machine A . which is connected to a linux gateway machine .
> Ruleset and policy mentioned are for machine B . There is no iptables
> rules in machine A .
> 
> >>>>>>>>>What do you want to achieve ?
> 
> As per the current rule , no igmp packet should come to GATEWAY
> machine , since there is no firewall hole in input chain .
> 
> >>>>>>>>>>what are you observing?
> 
> But i can see , igmp packets flowing into machine B from internet .
Where can you see these igmp packets? With wireshark/tcpdump? If it is one of 
those, than it is normal, because these capture the packets before the 
iptables filter.

Seen your ruleset, the packets should not enter, if they are coming from the 
internet.

Regards,
Christoph

> On Fri, Feb 26, 2010 at 4:46 AM, Christoph Paasch
> 
> <christoph.paasch@gmail.com> wrote:
> > Please, provide more information about your setup.
> > 
> > What are the policies of your chains? What is your ruleset?
> > What is your topology?
> > What do you want to achieve, and what are you observing?
> > 
> > Christoph
> > 
> > On Thu 25 February 2010 wrote ratheesh k:
> >> iptables -A INPUT -m state --state ESTABLISHED,RELATES -j ACCEPT .
> >> 
> >> This is the only rule . No firewall hole for igmp packets .
> >> 
> >> On Thu, Feb 25, 2010 at 12:08 PM, ratheesh k <ratheesh.ksz@gmail.com> 
wrote:
> >> >>>>>>>>>>udp doesn't go into the established state.
> >> > 
> >> > I am running "igmpproxy" on my gateway box . I didnot add any rule in
> >> > INPUT chain to accept igmp packets . But  i hve a rule to accept all
> >> > ESTABLISHED state packets . It am able to stream igmp from my desktop
> >> > .
> >> > 
> >> > I really believe that " We dont need any rule in FORWARD chain " .
> >> > Because packets are flowing from node to node and routed . So only
> >> > INPUT and OUTPUT chains are involved .
> >> > 
> >> > Thanks,
> >> > Ratheesh
> >> > 
> >> > 
> >> > 
> >> > On Thu, Feb 25, 2010 at 12:03 AM, Christoph Paasch
> >> > 
> >> > <christoph.paasch@gmail.com> wrote:
> >> >> As long as there isn't any return-traffic (as it is the case for
> >> >> multicast- udp), udp doesn't go into the established state.
> >> >> 
> >> >> Regards,
> >> >> Christoph
> >> >> 
> >> >> On Wed 24 February 2010 wrote ratheesh k:
> >> >>> multicast packets are udp packets . But its flowing only from
> >> >>> upstream to downstream . So packet state will be always "NEW" . ??
> >> >>> 
> >> >>> my question is : whether we can see multicast data packets in
> >> >>> ESTABLISHED state ??
> >> >>> 
> >> >>> Thanks,
> >> >>> Ratheesh
> >> >>> --
> >> >>> To unsubscribe from this list: send the line "unsubscribe netfilter"
> >> >>> in the body of a message to majordomo@vger.kernel.org
> >> >>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >> >> 
> >> >> --
> >> >> Christoph Paasch
> >> >> 
> >> >> Alcatel-Lucent
> >> >> IP Development
> >> >> 
> >> >> www.rollerbulls.be
> >> >> --
> >> >> --
> >> >> To unsubscribe from this list: send the line "unsubscribe netfilter"
> >> >> in the body of a message to majordomo@vger.kernel.org
> >> >> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >> 
> >> --
> >> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> >> the body of a message to majordomo@vger.kernel.org
> >> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > 
> > --
> > Christoph Paasch
> > 
> > Alcatel-Lucent
> > IP Development
> > 
> > www.rollerbulls.be
> > --
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
