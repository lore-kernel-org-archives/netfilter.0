From: Julian Gomez <kluivert@tm.net.my>
Subject: Re: Linux firewall hardware specs
Date: Fri, 5 Sep 2003 21:02:54 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030905130254.GA2790@propaganda.localdomain>
References: <20030905121050.88228.qmail@web11605.mail.yahoo.com>
Reply-To: kluivert@tm.net.my
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030905121050.88228.qmail@web11605.mail.yahoo.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, Sep 05, 2003 at 05:10:50AM -0700, Grant Moby spoke thusly:

>I need to setup a NetFilter/Linux firewall at my company, but I'm not sure
>what spec hardware box I need.
> 
>There are about 100 users surfing the web, sending and receiving email
>over a 256k line, a couple of subnets, a DMZ, etc.

OK. 256k line will be easily handled by a 486/Pentium 100Mhz host. How many
subnets and what is their interconnectivity ? Very high traffic Mbits/s ?

How many connections per second are initiated (to keep up with conntrack) ?
Short / long lived ?

The only way to be sure is to benchmark it in your own network, that said
-- I'll be surprised is a PII 266Mhz, 128Mb of RAM won't be able to handle
your setup. Unless you've got funky going-ons in your network :-)

(snip remaining)

