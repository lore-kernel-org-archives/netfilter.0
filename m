From: "Mike Tubby" <mike.tubby@thorcom.co.uk>
Subject: Re: sqlnet conntrack/nat modules?
Date: Sun, 19 Oct 2003 19:01:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005b01c3966b$142d3540$0a90a8c0@zen>
References: <3F92A82D.000013.29759@bj222.163.com> <878ynhus4s.fsf@stark.dyndns.tv>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org, Greg Stark <gsstark@mit.edu>


>
> "XX" <zijiepan@163.com> writes:
>
> >    I want use it to SqlPlus to connect to a Oracle Server behind a linux
box
> >    using iptables.Does anyone have the sqlnet conntrack/nat modules?
>
> I used to forward sqlnet connections via ssh. That would imply that it
ought
> to work just fine without using any special nat modules. That was with
Oracle
> 8.0.5 so it's possible this has changed since, but I doubt it.
>
> -- 
> greg
>
>


We use SQL Relay as an application-layer proxy sat on our main Linux
firewall box (one leg in the DMZ; one leg on the inside) passing Oracle-8
queries from our public website back in to our internal server(s). Works
a treat.

Have a look at: http://sqlrelay.sourceforge.net

Mike


