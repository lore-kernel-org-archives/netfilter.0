From: "Aldo S. Lagana" <alagana@discmail.com>
Subject: RE: How to keep record of repeat attackers?
Date: Thu, 13 Mar 2003 15:29:59 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001001c2e99f$51792180$3864a8c0@discmail.com>
References: <Pine.LNX.3.96.1030313142253.32436A-100000@gatekeeper.tmr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.3.96.1030313142253.32436A-100000@gatekeeper.tmr.com>
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
To: 'Bill Davidsen' <davidsen@tmr.com>, 'George Chacon' <please.help.me@comcast.net>
Cc: netfilter@newkirk.us, 'Netfilter Mailing List' <netfilter@lists.netfilter.org>

how about portsentry with snort?

portsentry is a simplistic (script kiddie) blocker that can add rules to
iptables dynamically - works good!  then you can peruse the DENY rules
to see how many times they attempted connections
and when the get too sophisticated for portsentry...
snort is also good since it keeps the list of attackers and there may be
good analyzers of the log files for snort..


> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of 
> Bill Davidsen
> Sent: Thursday, March 13, 2003 2:34 PM
> To: George Chacon
> Cc: netfilter@newkirk.us; Netfilter Mailing List
> Subject: RE: How to keep record of repeat attackers?
> 
> 
> On Wed, 12 Mar 2003, George Chacon wrote:
> 
> > >>Your first problem is defining "offenders", then "repeat 
> offenders" 
> > >>and "attackers".  Do you mean simply to track everyone 
> who attempts 
> > >>to connect to you?  I presume you don't expect much if any 
> > >>legitimate incoming NEW traffic if this is the intent?
> > 
> > Thanks for the response Joel.  What I'd like to track are the IP 
> > addresses that get denied or rejected, and the deny/reject 
> rules that 
> > get accessed frequently.  In other words, I'd like to track 
> repeated, 
> > obvious, malicious connections.  I'd like to know if the 
> same person 
> > is relentlessly chipping away at my firewall, looking for 
> weaknesses.
> >
> > I'll take a look at http://ntop.org.  That looks pretty good.
> 
> It may do, but I would still keep LOG in mind. You can catch 
> just what you want, put a useful prefix on the message to 
> simplify analysis, and bang on it with a perl program.
> 
> One hint for quick and dirty values is to write as little 
> custom code as you can. I use perl to identify the offending 
> IPs and dump them to stdout, then something like:
>   perl getIP.pl mylog | sort | uniq -c | sort -n | tail -20
> 
> Emits the IP, sorts for uniq, output a count of how many 
> times the IP showed up, sorts on the count, and displays the 
> top 20 "worst offenders." Since this isn't something I often 
> do the same way twice, it works for me.
> 
> -- 
> bill davidsen <davidsen@tmr.com>
>   CTO, TMR Associates, Inc
> Doing interesting things with little computers since 1979.
> 
> 


