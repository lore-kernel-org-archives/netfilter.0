From: Patrick McHardy <kaber@trash.net>
Subject: Re: nf_conntrack_sip problem
Date: Wed, 01 Jul 2009 14:03:40 +0200
Message-ID: <4A4B509C.3080600@trash.net>
References: <20090701113701.GZ9285@Redstar.dorchain.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090701113701.GZ9285@Redstar.dorchain.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Joerg Dorchain <joerg@dorchain.net>
Cc: netfilter@vger.kernel.org

Joerg Dorchain wrote:
> Hello,
> 
> I have some problems understanding nf_conntrack_sip. I want to
> use it avoid having static entries for the rtp stream, as IMHO
> those should be catched by a RELATED rules when nf_conntrack_sip
> works properly.
> 
> I have a machine with a pppoe interface connected to the
> internet, with asterisk running on it, and a small local network
> behind it on eth1, where I want to force sip traffic going
> through the local asterisk.
> 
> Unfortunately it doesn't work as expected. I use vanilla kernel
> 2.6.30. My iptable rules that do not work look like this:
> 
> Maybe I am missing something obvious, but I'd appreciate a hint.
> (yes, nf_conntrack_sip is loaded)

Depending on how your SIP provider works, you might need to set the
sip_direct_signalling option to zero (in case signalling connections
can arrive from different addresses than the one registered with),
additionally you might need to set the sip_direct_media option to
0 in case the RTP streams arrive from different addresses than the
signalling endpoint.

