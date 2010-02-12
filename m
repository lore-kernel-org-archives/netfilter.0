From: Guido Trentalancia <guido@trentalancia.com>
Subject: Re: Port forwarding with iptables on tunnel interface
Date: Fri, 12 Feb 2010 23:27:40 +0100
Message-ID: <1266013660.2980.150.camel@tesla.lan>
References: <1265912094.2985.44.camel@tesla.lan>
	 <4B745327.9020806@trash.net> <1265916014.2985.72.camel@tesla.lan>
	 <4B74E736.2020307@trash.net> <1265981292.2980.67.camel@tesla.lan>
	 <4B756895.2060106@trash.net> <1265995841.2980.125.camel@tesla.lan>
	 <4B75A5A5.1000402@mailinator.com> <1266002586.2980.135.camel@tesla.lan>
	 <4B75B283.1040300@mailinator.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B75B283.1040300@mailinator.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Wright <mike.wright@mailinator.com>
Cc: netfilter@vger.kernel.org

Hello again Mike,

On Fri, 2010-02-12 at 11:56 -0800, Mike Wright wrote:
> >> Salve, Guido.  I gave this a verrrry quick glance and off the top of my 
> >> head I think something looks fishy in the POSTROUTING rules.
> >>
> >> In the PREROUTING you are selecting based on the *destination* port.  On 
> >> the return trip shouldn't POSTROUTING use *source* port?
> > 
> > Hold on a second. The originating caller expects a reply on *its 25
> > port*. Therefore my originating port could be everything and usually is
> > an high port (> 1024) different than 25, but the important is that the
> > destination port is 25 because there is the caller waiting a reply. 
> > 
> > Therefore even in the case of SNAT, I am selecting the destination port.
> > 
> > Do you convene with me now ?
> 
> Yes, indeed.  It seems I have my brain in backwards ;D
> 
> Buona fortuna !

You were actually right. The SNAT needs to be done with --sport 25 and
not with --dport 25. But still I cannot get the mail delivered and
actually I cannot see POSTROUTING but only untranslated reply packets...

Any other idea ?

Regards,

Guido


