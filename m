From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: Re: conntrack helpers in kernel 4.7
Date: Thu, 11 Aug 2016 15:29:55 +0200
Message-ID: <20160811132955.GZ9430@torres.zugschlus.de>
References: <20160811085251.GR9430@torres.zugschlus.de>
 <20160811113435.GA4544@salvia>
 <20160811115335.GY9430@torres.zugschlus.de>
 <20160811121734.GA1155@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160811121734.GA1155@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hi Pablo,

this looks good now.

On Thu, Aug 11, 2016 at 02:17:34PM +0200, Pablo Neira Ayuso wrote:
> On Thu, Aug 11, 2016 at 01:53:36PM +0200, Marc Haber wrote:
> > Can I see in conntrack(1) output whether a flow has a helper attached?
> 
> Yes, conntrack -L shows here:
> 
> tcp      6 431999 ESTABLISHED src=192.168.3.132 dst=130.89.148.12
> sport=54736 dport=21 src=130.89.148.12 dst=192.168.3.132 sport=21
> dport=54736 [ASSURED] mark=0 helper=ftp use=2
> 
> it should show similar thing for sip.

It does. I never saw the helper clause because I had the CT rule wrong.

> > Is the helper supposed to be attached to the first packet only?
> 
> It is attached to the flow and remains there until the flow is teared
> down, the first packet creates the flow entry in the conntrack table.
> By then, the helper is set up.

But the rule attaching the helper needs to match the first packet of
the connection? Or does it suffice to slap the helper on any packet to
have it attached in the future?

> > -A PREROUTING -p udp -m udp --dport 5060 -m helper --helper sip -j CT
> 
> note that:
> 
>         -m helper sip
> 
> is used to match based on the helper name and you have no helper yet.
> 
> To attach the helper you have to use:
> 
>         -j CT --helper sip
> 
> and remove the -m helper match given, so this looks like:
> 
> -A PREROUTING -p udp -m udp --dport 5060 -j CT --helper sip
> 
> in the raw table.

Ah! I missed the difference between CT --helper and --module helper.

jftr, in ferm this would be
table raw {
        chain PREROUTING {
                proto udp dport 5060 CT helper sip;
        }
}

Just to be sure: The changes needed are only related to protocols that
need helpers, --mod conntrack --ctstate ESTABLISHED/RELATED works the
same as --mod state --state ESTABLISHED/RELATED for other things such
as ICMP messages regarding a connection etc foo?

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Leimen, Germany    |  lose things."    Winona Ryder | Fon: *49 6224 1600402
Nordisch by Nature |  How to make an American Quilt | Fax: *49 6224 1600421
