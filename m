From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Request: Submission of Rulesets
Date: Wed, 24 Aug 2005 16:07:43 -0500
Message-ID: <200508241607.43943.rob0@gmx.co.uk>
References: <200508241314.37034.admin@buddhalinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200508241314.37034.admin@buddhalinux.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wednesday 2005-August-24 13:14, Thomas Jones wrote:
> Abstract:

I readily admit that this is not a good day for me. I am not operating 
at full capacity, so to speak. But I have to say that this post made no 
sense at all to me. Is it just me? Did anyone else understand it? If 
so, can you explain it?

> The Security Document Initiative is an implementation of the domain
> of applied cryptography as it relates to XML Markup Language and the
> creation of a security infrastructure to protect information systems
> and resources.

I once saw an online automated generator of scholarly papers. It was 
hilarious! It used language just like this.

> This project is charged with developing a XML Document Type
> Definition document model that Netfilter rulesets can be validated
> against. Any document instance of the "Firewall Rule Subset" must be
> well-formed and comply with the structured XML Markup Language. This
> language is being designed to provide all VALID rule entries that are
> available under the netfilter framework.

Okay, I think I see a little substance here. The poster wants something 
which lists every possible valid netfilter rule. Right?

Unfortunately, the list of valid rules is almost infinite. And what's 
valid may vary in context: what's available in the kernel, other rules 
in the chain, et c. "iptables I OUTPUT -j LOG" is a valid rule (rather 
unfortunate if the local syslogd is logging to a remote syslog server, 
as each packet generates another one ad infinitum), but only valid if 
the LOG target is available.

> This is where you the end-user come into play. Obviously, it would
> take me an untold number of days/weeks/months/years to construct a
> comprehensive and stable compilation of valid rules. The compilation

It's not even possible.

> of the rules and rulesets are a key step in this development process.
> Without, all representative rules and rulesets; a correct and valid
> netfilter rule will be deemed invalid under an improperly constructed
> document model. Thus, negating the purpose and intent of the SDI
> Firewall Rule Subset project.

Perhaps the purpose and intent of the SDI Firewall Rule Subset project 
should be reevaluated.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

