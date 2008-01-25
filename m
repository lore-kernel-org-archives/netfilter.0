From: Eial Czerwacki <eial@cs.bgu.ac.il>
Subject: Re: iptables block samba or not?
Date: Fri, 25 Jan 2008 12:40:48 +0200 (IST)
Message-ID: <200801251040.m0PAemU6005548@indigo.cs.bgu.ac.il>
References: <4798FF72.2020609@netoyen.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4798FF72.2020609@netoyen.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mouss <mouss@netoyen.net>
Cc: netfilter@vger.kernel.org


so I need to add the same line to the output rules?
On Thu 24 Jan 23:13 2008 mouss wrote:
> Eial Czerwacki wrote:
> > I've got this too has part of the rules
> >
> > -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> >   
> 
> but not for output. what if your linux box initiates the connection?
> 
> Also, as I said before, allow for icmp (echo if you add a stateful 
> accept for output icmp's if you don't have the stateful rule).
> >
> > On Thu 24 Jan 0:00 2008 Dzianis Kahanovich wrote:
> >   
> >> Eial Czerwacki wrote:
> >>
> >>     
> >>> -A INPUT -p tcp -m state --state NEW --dport 135 -s 132.72.144.0/20 -j ACCEPT
> >>> -A INPUT -p tcp -m state --state NEW --dport 139 -s 132.72.144.0/20 -j ACCEPT
> >>> -A INPUT -p udp -m state --state NEW --dport 137:138 -s 132.72.144.0/20 -j ACCEPT
> >>> -A INPUT -p tcp -m state --state NEW --dport 426 -s 132.72.144.0/20 -j ACCEPT
> >>> -A INPUT -p tcp -m state --state NEW --dport 445 -s 132.72.144.0/20 -j ACCEPT
> >>>
> >>> -A INPUT -p tcp -m state --state NEW --dport 135 -s 192.168.114.0/24 -j ACCEPT
> >>> -A INPUT -p tcp -m state --state NEW --dport 139 -s 192.168.114.0/24 -j ACCEPT
> >>> -A INPUT -p udp -m state --state NEW --dport 137:138 -s 192.168.114.0/24 -j ACCEPT
> >>> -A INPUT -p tcp -m state --state NEW --dport 426 -s 192.168.114.0/24 -j ACCEPT
> >>> -A INPUT -p tcp -m state --state NEW --dport 445 -s 192.168.114.0/24 -j ACCEPT
> >>>
> >>> # up to 5 Bit-torrent connections
> >>> -A INPUT -p tcp -m state --state NEW --dport 6881:6886 -j ACCEPT
> >>>
> >>> #else
> >>> -A INPUT -j REJECT --reject-with icmp-port-unreachable
> >>>       
> >> You ACCEPTing only NEW connection state - initial packets for every session.
> >> Remove "-m state -- state NEW".
> >>
> >>
> >> -- 
> >> WBR,
> >> Denis Kaganovich,  mahatma@eu.by  http://mahatma.bspu.unibel.by
> >>
> >> -
> >> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> >> the body of a message to majordomo@vger.kernel.org
> >> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >>
> >>     
> >
> >
> >
> >
> > -
> > To unsubscribe from this list: send the line "unsubscribe netfilter" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >   
> 
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 




