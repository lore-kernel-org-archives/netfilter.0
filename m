From: "Rob Sterenborg (lists)" <lists@sterenborg.info>
Subject: Re: masquerade error
Date: Fri, 14 Oct 2011 11:05:18 +0200
Message-ID: <1318583118.3179.6.camel@ns014530.dcyb.net>
References: <4E93E9B8.3010005@gmail.com> <4E94480C.4050604@googlemail.com>
	 <4E95D9E2.4010002@gmail.com>  <4E97E602.3000809@gmail.com>
	 <1318582536.3179.5.camel@ns014530.dcyb.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1318582536.3179.5.camel@ns014530.dcyb.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: J Webster <jw.jwebster@gmail.com>
Cc: netfilter@vger.kernel.org

On Fri, 2011-10-14 at 10:55 +0200, Rob Sterenborg (lists) wrote:
> On Fri, 2011-10-14 at 08:34 +0100, J Webster wrote:
> > The hosting company have told me that masquerade is not activated:
> > 
> > MASQUERADE target isn\'t activate on your VPS.
> > You can use SNAT or DNAT target in nat tables.
> > 
> > So, how can I use SNAT and DNAT to route the traffic to my OpenVPN?
> 
> -j SNAT --to-source <internet_ip>

To reply to self.. a better description here would be <external_ip>.

> -j DNAT --to-destination <internal_ip>
> 
> Please check the SNAT and DNAT targets with 'man iptables' for the
> details.
> 
> 
> --
> Rob


