From: "Eric Estes" <Eric_Estes@aspensquare.com>
Subject: RE: [l7-filter-users] Problem on Blocking Gnutella
Date: Wed, 5 Mar 2008 10:13:17 -0500
Message-ID: <665B03CFBE2C1346A66B0CB9A9A0EE3801C7E9A5@ASM220.aspen.com>
References: <894043.42372.qm@web56606.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <894043.42372.qm@web56606.mail.re3.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Tolga Onbay <tolgaonbay@yahoo.com>

> -----Original Message-----
> From: l7-filter-users-bounces@lists.sourceforge.net [mailto:l7-filter-
> users-bounces@lists.sourceforge.net] On Behalf Of Tolga Onbay
> Sent: Wednesday, March 05, 2008 9:46 AM
> To: l7-filter-users@lists.sourceforge.net
> Subject: Re: [l7-filter-users] Problem on Blocking Gnutella
> 
> Any idea?
> 
> ----- Original Message ----
> From: Tolga Onbay <tolgaonbay@yahoo.com>
> To: l7-filter-users@lists.sourceforge.net
> Sent: Monday, February 11, 2008 2:45:43 PM
> Subject: Problem on Blocking Gnutella
> 
> Hi,
> 
> I have been using l7-filter for 2 years. I blocked all P2P, IM and
audio
> traffic. I used ares, gnutella, edonkey, imesh to block the P2P
traffic
> and all had been working well. But today i realized that users on the
> network can use limewire without problem. I changed the rule to LOG
the
> traffic using gnutella protocol. And it logged the traffic. But still
all
> users can connect/download and upload files.
> 
> Did you notice this problem? Is there any way to block the gnutella
> traffic?
> 
> Thanks


Try filtering 'unknown'. That usually catches a ton of P2P for me. Also,
you might want to check out these two links.

http://l7-filter.sourceforge.net/protocols

http://www.mastershaper.org


