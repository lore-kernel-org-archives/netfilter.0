From: Michael Gale <michael.gale@utilitran.com>
Subject: Re: bandwidth monitoring
Date: Thu, 06 Jan 2005 14:28:21 -0700
Message-ID: <41DDAD75.5000103@utilitran.com>
References: <200501061128.04741.patrick.leduc@novipro.com>	
	<41DD9AE3.4060207@utilitran.com>
	<1105042784.27950.12.camel@josh-desk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1105042784.27950.12.camel@josh-desk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

	I am not sure I follow ... NTOP takes care of providing the stats, so 
if you firewall box or ntop server can handle your network.

The storage box can be what and where ever ... for example you could 
have a low end box somewhere on the network that makes the http 
connection, downloads the stats and stores them in a database.

Then you only need a simple method to display them when needed. If you 
are a large company it might be easier to setup multiple ntop servers 
and have all the stats stored in a central location.

Michael.



J. Nerius wrote:
> How many hosts and how much traffic are you running through it? I've
> wanted to come up with a solution similar to the one you've described to
> replace my current bandwidthd setup but I'm thinking that my network may
> be too large with too much traffic to support something like that
> without building a monster box just to capture the stats. 
> 
> J.N.
> 
> On Thu, 2005-01-06 at 13:09 -0700, Michael Gale wrote:
> 
>>Hello,
>>
>>	To run NTOP permanitly you just have to clear the stats nightly. I have 
>>a php script that makes a HTTP connection, downloads the stats from NTOP 
>>and saves them in a mysql database. It then makes another connection and 
>>tells NTOP to reset the stats.
>>
>>That keeps the memory and CPU usage low ... so you could run it 
>>continuously.
>>
>>Michael.
>>
>>
>>patrick.leduc@novipro.com wrote:
>>
>>>Hello
>>>
>>>Does somebody know a program for monitoring bandwidth by ip? I have one 
>>>internet interface and I must monitor many ips adresses on this interface. I 
>>>tried Ipac-ng and, I worked a lot to do this config but it seems not working 
>>>this way.
>>>
>>>thanx
>>>
>>
> 

-- 
Michael Gale
Lan Administrator
Utilitran Corp.

I make better friends with those who think for them selves

