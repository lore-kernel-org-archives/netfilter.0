From: Jason Opperisano <opie@817west.com>
Subject: Re: static IP to dynamic IP
Date: Fri, 15 Oct 2004 14:55:51 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041015185551.GA7745@bender.817west.com>
References: <20041015182253.GA7592@bender.817west.com>
	<20041015184106.39028.qmail@web21526.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20041015184106.39028.qmail@web21526.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, Oct 15, 2004 at 11:41:06AM -0700, kate wrote:
> 1. yes I have ipt_MASQUERADE loaded.
> 2. my logic was to substitute any static_ip refernce
> with -i eth0, but you're saying that doesn't work.

no--it doesn't work.  might be a nice feature request...but alas at the
current state of technology--no dice.

> Would refernce to the box eg. myfw.mydomain.com work
> instead of ip_static ?

nope--same problem, essentially.  when you use an FQDN in a rule--it is
resolved to an IP address once, at the time the rule is loaded.

> Your neat script, where would I place that in my fw
> script? at the top? Does it need anything else to make
> it work?

it's really just a variable declaration, but yeah--at the top would be a
good place for it.

once you have a script that can figure out your IP addresses for you at
the time of execution--the only other piece you need is to reload your
rules each time your IP address changes--the man page of your particular
DHCP client should have details on how to execute a script on IP
change.

this also isn't as big a deal in practice as it may seem--my firewall on
my cable modem at my house has had the same IP address since 11-27-2003
(the day i upgraded it).

> you can see that I am new at this!

s'alright--that's what these lists are for.  a good read for newbies is
the IPTables Tutorial, located at:

http://iptables-tutorial.frozentux.net/iptables-tutorial.html

-j

-- 
Jason Opperisano <opie@817west.com>

