From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Need help have some questions...
Date: Mon, 18 Aug 2003 16:52:23 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030818205223.GA3993@cannon.eng.us.uu.net>
References: <1061192932.1915.10.camel@kermit> <20030818201333.57194.qmail@web40202.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030818201333.57194.qmail@web40202.mail.yahoo.com>
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
To: SBlaze <dagent.geo@yahoo.com>
Cc: Ralf Spenneberg <lists@spenneberg.org>, nf <netfilter@lists.netfilter.org>, cc@belfordhk.com

On Mon, Aug 18, 2003 at 01:13:33PM -0700, SBlaze wrote:

> To Ralf, the netfilter team, and the whole of the OS community
> 
> How am I supposed to proxy apache? Why should I have to? Is it not a firewalls
> job to protect a system(and LAN behind it)? This is a very valid form of
> protection I'm asking for here.

First of all, cool down. Secondly, read up on layered model of networking
and try to understand, each layer and its functionality, like, IP is meant
for routing, TCP is meant for reliable end to end communication and HTTP
is meant for retrieval of the hyper text (and images and audio and video...).

Once you get there, you'll understand the goals of netfilter and the layer(s)
it's supposed to function upon. However, there have been some adhoc 
developements here and there by means of different (pom) modules which have
extended the borders of what netfilter can/should do like the "string" module.
But when you get to the bits and bytes of how things work you would realize
that, eg, the "string" module kills your system by its extensive scan of
the packets. It does not know that an "invalid" HTTP request happens at the
very beginning of the HTTP communication after a "GET" command... And again
because of some technical issues like fragmentation (which can be found in the
readings you've already done) this "string" module is not bullet-proof for
catching the HTTP requests you don't like.

What Ralf mentioned earlier is absolutely valid. If you want to filter based
on an application specific property (eg, "Get cmd.exe", or whatever the M$
hacks look like) then you need to make use of a filter at the application
level. In this case, a process which terminates the HTTP dialog, looks for
(in)valid requests and acts upon it accordingly.

This is a .02$ explanation you asked for.

Ramin

