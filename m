From: "Ed Street" <blacknet@simplyaquatics.com>
Subject: RE: How to ACCEPT or DENY or DROP and also LOG in the same rule ?
Date: Thu, 4 Jul 2002 11:04:13 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <005e01c2236c$0f1a7ef0$0a01a8c0@ed>
References: <200207041500.g64F0sU32109@vulcan.rissington.net>
Reply-To: <blacknet@simplyaquatics.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200207041500.g64F0sU32109@vulcan.rissington.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: 'Antony Stone' <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

Hello,

Ok fine. 1 line

Log_drop function, parameters, goes, here

The log_drop function would do the 
Iptables foo log
Iptables foo drop


Ed

-----Original Message-----
From: netfilter-admin@lists.samba.org
[mailto:netfilter-admin@lists.samba.org] On Behalf Of Antony Stone
Sent: Thursday, July 04, 2002 11:01 AM
To: netfilter@lists.samba.org
Subject: Re: How to ACCEPT or DENY or DROP and also LOG in the same rule
?

On Thursday 04 July 2002 3:54 pm, Ed Street wrote:

> Hello,
>
> Actually you can:
> Rule #1 is to log
> Rule #2 is to deny

The original question was: I want to both DENY and LOG *in the same
rule*.

Other posters suggested doing it in two rules, but this can make the
rulesets 
unnecessarily long and tedious; it's far easier to read if you create
your 
own chain to do the two operations and then call it from a single rule
when 
you want to both LOG and DROP.

Antony.

> -----Original Message-----
> From: netfilter-admin@lists.samba.org
> [mailto:netfilter-admin@lists.samba.org] On Behalf Of Antony Stone
> Sent: Thursday, July 04, 2002 3:51 AM
> To: netfilter@lists.samba.org
> Subject: Re: How to ACCEPT or DENY or DROP and also LOG in the same
rule
> ?
>
> On Thursday 04 July 2002 5:31 am, Orca J. wrote:
> > Hi
> >   I want to both DENY and LOG in the same rule ? or ACCEPT and LOG ,
>
> or
>
> > DENY and LOG
>
> You can't put them both in the same rule, butyou can create a
> user-defined
> chain and jump to that:
>
> iptables -N LOGDROP
> iptables -A LOGDROP -j LOG --log-options........
> iptables -A LOGDROP -j DROP
>
> Then use that single target in your rules:
>
> iptables -A INPUT -i eth0 -j LOGDROP
>
>
>
> Antony/.


