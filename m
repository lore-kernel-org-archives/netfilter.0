From: Kenneth Andresen <kenneth@cancun.net>
Subject: RE: How to block MSN messenger? (Solution)
Date: Wed, 19 May 2004 17:13:28 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1085004808.2868.118.camel@kenneth.intracol.net>
References: <7C9884991ADAE0479C14F10C858BCDF5122F55@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF5122F55@alderaan.smgtec.com>
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
To: iptables netfilter <netfilter@lists.netfilter.org>

I have found the solution

http://www.computing.net/linux/wwwboard/forum/25299.html lists the
following block for MSN Instant messanger.

iptables -A FORWARD -p tcp --dport 1863 -j DROP
iptables -A FORWARD -d 64.4.13.0/18 -j DROP

I personally changed the DROP to REJECT, and for those of you with the
oposite problem, just add ACCEPT instead. 

Best regards,
Kenneth Andresen

On Wed, 2004-05-19 at 16:49, Daniel Chemko wrote:
> > Sorry, this is not an answer to your question, but I just wanted to
> > comment on how we seem to get roughly equal numbers of requests on
> > this list from people saying "how can I enable X through my
> > firewall", and "how can I block X with my firewall", for identical
> > values of X. 
> 
> True, half are usually home users that are just using the SNAT
> facilities because of their ISP's IP policies. The other half are
> corporate, educational, and advanced users that actaully want to
> implement best practices in protecting their systems.
> 
> I'm very glad that both groups can find value in netfilter. The
> Netfilter ML has been a very excellent group to work with both in
> questions and answers.
> 
> Give yourselves a pat on the back. :-)
> 
> 
> PS: Does anyone else recommend good ML's/IRC for people to find useful
> information in? I find the following Mailing lists useful for my (admin)
> work:
> 
> Bugtraq: Notifications of security problems and some high-level security
> conversations (10-20/day)
> http://www.securityfocus.com
> 
> Fw-Wiz: General Firewall and Security site, high-level conversations
> (1-10/day)
> http://honor.icsalabs.com/mailman/listinfo/firewall-wizards
> 
> LARTC: Linux networking mostly routing and Traffic Control questions
> (8-15/day)
> http://mailman.ds9a.nl/mailman/listinfo/lartc


