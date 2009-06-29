From: Ramunas Vabolis <ramuva@openoffice.lt>
Subject: Re: raw table and NOTRACK target
Date: Mon, 29 Jun 2009 10:33:55 +0300
Message-ID: <20090629073355.GA1897@openoffice.lt>
References: <20090625130555.GB9856@openoffice.lt> <1246000121.3985.5.camel@casper.meteor.dp.ua> <20090626074317.GA11753@openoffice.lt> <1246020740.3985.11.camel@casper.meteor.dp.ua> <20090626130944.GA18792@openoffice.lt> <1246023084.3985.17.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1246023084.3985.17.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

> Is host.ip the host from which you are trying to run lynx?
> 
> This is strange behaviour, but it seems that problems occur when you are
> trying to use conntack. Maybe conntrack modules are not loaded or some
> rules in -t nat are acting like this. Does the nat table have rules? Can
> you show it (iptables-save -t nat)? Show output of "lsmod | grep conn".
	Thank you for your suggestions. I've left DNAT rule in nat table - 
forgot about it. Then started retracing the steps again. 
	The problem was with SNAT rule. With added additional entry in raw 
table for DNAT target everything started working. 
	Thank you for your time.
