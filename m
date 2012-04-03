From: richard lucassen <mailinglists@lucassen.org>
Subject: Re: ip a a /32 or used netmask
Date: Tue, 3 Apr 2012 23:32:39 +0200
Message-ID: <20120403233239.13aac474bb84047ff90efec7@lucassen.org>
References: <20120402230510.8b17b5dbc6d1f421fe9476aa@lucassen.org>
	<alpine.LNX.2.01.1204031421590.15235@frira.zrqbmnf.qr>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1204031421590.15235@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Tue, 3 Apr 2012 14:22:49 +0200 (CEST)
Jan Engelhardt <jengelh@medozas.de> wrote:

> >Just a question:
> >
> >I have a NIC eth0 with address 10.0.0.1/24
> >
> >I want to add an ip address to that NIC. Both ways work:
> >
> >ip a a 10.0.0.2/32 dev eth0
> >
> >ip a a 10.0.0.2/24 dev eth0
> >
> >Is there anyhow some or other difference between the two? And is one
> >of the two ways preferred?
> 
> The difference lies in the route that is implicitly added.

AFAIUI this is valid if it's another subnet, e.g.:

ip a a 10.0.255.2/24 dev eth0

But as long as the added ip is in the existing range of the NIC, then
there is no difference between adding a 10.0.0.2/32 or a 10.0.0.2/24.

Right or wrong? Or am I still missing something crucial?

R.

-- 
___________________________________________________________________
It is better to remain silent and be thought a fool, than to speak
aloud and remove all doubt.

+------------------------------------------------------------------+
| Richard Lucassen, Utrecht                                        |
| Public key and email address:                                    |
| http://www.lucassen.org/mail-pubkey.html                         |
+------------------------------------------------------------------+
