From: "Rob Sterenborg (lists)" <lists@sterenborg.info>
Subject: RE: Extended IPTables options
Date: Mon, 06 Feb 2012 11:53:45 +0100
Message-ID: <1328525625.2970.3.camel@ns014530.dcyb.net>
References: <E7E899956E6065488DBC6623F76F36A2650ADB4520@RAMNL-EX02.Ram.nl>
	 <1328030605.2018.6.camel@andy-laptop>
	 <E7E899956E6065488DBC6623F76F36A2650AE9663F@RAMNL-EX02.Ram.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <E7E899956E6065488DBC6623F76F36A2650AE9663F@RAMNL-EX02.Ram.nl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Mon, 2012-02-06 at 11:41 +0100, Arnoud Tijssen wrote:
> Thanks, and I know that nearly all of the options are listed in the
> manpage, but I`m also looking for an article of some sort that explains
> what options best to use for what kind of situations. A bit more
> background info on specific optios. I would like to extend the scripts
> I`m using for specific situations.

It's a bit aging these days (2006) and probably does not hold all the
information you're looking for, but did you check this tutorial:

http://www.frozentux.net/iptables-tutorial/iptables-tutorial.html


--
Rob


 
> -----Original Message-----
> From: netfilter-owner@vger.kernel.org [mailto:netfilter-owner@vger.kernel.org] On Behalf Of Andrew Beverley
> Sent: dinsdag 31 januari 2012 18:23
> To: Arnoud Tijssen
> Cc: netfilter@vger.kernel.org
> Subject: Re: Extended IPTables options
> 
> On Mon, 2012-01-30 at 08:40 +0100, Arnoud Tijssen wrote:
> > I`m looking for the more sophisticated options of iptables/netfilter
> > like: connmark, quota, qos, recent, netmap, tos, ulog, clustering and
> > failover etc etc.
> 
> Have you tried the iptables man page? Personally I think that's pretty
> well written and a good place to start. If you've got any specific
> questions then feel free to post to this list.
> 
> > Is it possible to create a modular setup with iptables that offers the
> > possibility to reload a specific part of the iptables rulebase instead
> > of the entire rulebase.
> 
> You can add and remove rules "on the fly". There's no need to reload the
> whole ruleset. Use "iptables -L  --line-numbers" to see all your rules
> with associated rule number, and then use the "-D" command with that
> number to delete as required.
> 
> Andy


