From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: active firewall
Date: Tue, 23 Sep 2003 09:32:26 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F704B6A.7010905@chrisbrenton.org>
References: <03092320103102.01185@slinky.exmosys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nik Trevallyn-Jones <nik@designer.com.au>
Cc: netfilter@lists.netfilter.org

Nik Trevallyn-Jones wrote:
> 
>    As a result of experiences deploying PortSentry behind an ipchains 
> firewall recently, I started considering how iptables could be used to deploy 
> a dynamic firewall which would be able to modify itself in response to 
> predefined events.

Be very careful with this. I've seen savvy attackers spoof attacks from 
the root name servers in order to make the firewall DoS the local 
environment. :(

> Q: Has anyone considered or suggested this before?

Yup, and the feature is built into many commercial firewalls (FW-1, PIX, 
etc.). I know Bill Stearns was working on this at one point. You might 
be able to find more info at:
http://www.stearns.org

> 1  two new targets: ENLIST, DELIST
> These targets effectively cause one or more new rules to be automatically 
> added/removed to/from the firewall in response to matching the associated 
> rule.

Depending on your IDS, you can script this as well. I seem to remember a 
paper floating around at one point that shows how to set this up with 
Snort and iptables.

> I would like to write a rule which asserts: "BLACKLIST any host that sends a 
> SYN packet to any ports between 1025-50000 unless there is a socket listening 
> to the port at the time the packet arrives".

Hummm, so if I back door your system the firewall will happily update 
the ruleset to permit me access to that port. That's very polite of it. ;-)

HTH,
C


