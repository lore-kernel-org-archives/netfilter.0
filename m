From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: the impossible "iptables -C" option
Date: Sat, 24 Jul 2004 21:13:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407242113.48128.Antony@Soft-Solutions.co.uk>
References: <01be01c4710c$440a79e0$5100a8c0@egp> <1090664200.2012.21.camel@grendel> <1090694781.17721.43.camel@les-home.futuresource.com>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1090694781.17721.43.camel@les-home.futuresource.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

On Saturday 24 July 2004 7:46 pm, Les Mikesell wrote:

> I have a situation where I can see strange results with tcpdump and would
> like to know what combination of rules is causing it.

I suggest you take some of the features you can see from the tcpdump output 
and create some logging rules to find out how far through your ruleset the 
packets are getting.

Regards,

Antony.

-- 
Tax inspectors are just accountants who work for the evil dictators of 
democracy.

                                                     Please reply to the list;
                                                           please don't CC me.


