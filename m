From: Curby <curby@cur.by>
Subject: Re: iptables NEW or SYN
Date: Thu, 13 May 2010 16:46:04 -0600
Message-ID: <AANLkTikYXNQRQq4e-qX7IgMXT8UAOqR5ZTCgV7_Osof-@mail.gmail.com>
References: <hshbmv$547$1@dough.gmane.org> <alpine.LSU.2.01.1005131916320.9398@obet.zrqbmnf.qr> 
	<hshf0k$ine$1@dough.gmane.org> <AANLkTimpGd4uEnY5UiFQDs1oE6uEji6lbLnUej7eCXoX@mail.gmail.com> 
	<hshhcg$rl3$1@dough.gmane.org> <AANLkTilx7Gimy8RwVszEx1ijkR4mx2Q70HKJO72fAhTK@mail.gmail.com> 
	<hshruc$34i$1@dough.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <hshruc$34i$1@dough.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Feldmann <feldmann_markus@gmx.de>
Cc: netfilter@vger.kernel.org

On Thu, May 13, 2010 at 3:45 PM, Markus Feldmann <feldmann_markus@gmx.de> wrote:
> Thanks for your answer,
>
> i have an ESTABLISHED rule, look at line 127

Having a rule doesn't mean that it's doing what you want it to.  =)
Since you have DROP policies, having EST/REL packets return to the
originating INPUT/FORWARD chain just drops them if nothing else
matches.  Instead, try ACCEPT, as in:

iptables -A attacksinput -m state --state ESTABLISHED,RELATED -j ACCEPT

Can I get confirmation from Jan or someone else that a preferred and
more future-proof syntax is the following?

iptables -A attacksinput -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

--Mike
