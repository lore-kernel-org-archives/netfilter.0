From: Guido Trentalancia <guido@trentalancia.com>
Subject: Re: Natting html traffic
Date: Sat, 13 Feb 2010 17:19:11 +0100
Message-ID: <1266077951.2916.58.camel@tesla.lan>
References: <368e93c51002121503y2bf70ddbh85c0c377356a345@mail.gmail.com>
	 <1266016722.2980.159.camel@tesla.lan>
	 <1266027202.3899.1.camel@casper.meteor.dp.ua>
	 <33be4bb31002130208p53b4db41j1e46b3a3920b1fa4@mail.gmail.com>
	 <368e93c51002130422la851213ud93649e9ccc5519c@mail.gmail.com>
	 <1266072434.2916.46.camel@tesla.lan>
	 <368e93c51002130729n4ef2b669r30c6ee64c2077df7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <368e93c51002130729n4ef2b669r30c6ee64c2077df7@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bojan Sukalo <shukalo83@gmail.com>
Cc: netfilter@vger.kernel.org

Hello again !

On Sat, 2010-02-13 at 16:29 +0100, Bojan Sukalo wrote:
> >> iptables -t mangle -A FORWARD -i eth1 -o eth0 -p tcp --tcp-flags
> >> SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu
> >
> > What do you want to achieve with the last rule ?
> 
> I tried to set mss in my last rule because this type of problem
> (acording to iptables man page) can happen because of bigger mss
> values and fragmenting packets after that.
> When I say this type of problem I mean "established tcp session but no
> traffic after that"

Well, in the manual page it mentions about "criminally braindead ISPs or
servers". So, to make sure that is the cause, you could try the existing
setup with another ISP using one of the many free dial-up connections
that are generally available.

If the problem persists with other ISPs, then at least you know it might
be a different cause perhaps something to do with your setup.

Regards,

Guido

