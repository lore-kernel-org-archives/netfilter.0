From: Askar <askarali@gmail.com>
Subject: Re: slow ftp
Date: Fri, 18 Feb 2005 09:51:32 +0500
Message-ID: <a0f69e505021720512ec9468a@mail.gmail.com>
References: <a0f69e505021708481c4be836@mail.gmail.com>
	<Pine.LNX.4.05.10502171248010.4403-100000@darkstar.sysinfo.com>
Reply-To: Askar <askarali@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.05.10502171248010.4403-100000@darkstar.sysinfo.com>
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
To: "R. DuFresne" <dufresne@sysinfo.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

hello Dufresne,

Problem solved after I added ...
     UseReverseDNS                   off
     IdentLookups                    off

to proftpd.conf as Michael Gale suggested

Thanks and regards

Askar 
On Thu, 17 Feb 2005 12:51:56 -0500 (EST), R. DuFresne
<dufresne@sysinfo.com> wrote:
> 
> What kind of latencies are you observing?  any time one puts a firewall
> into the miix, or encryption there is agont to be an increase in latency.
> Add state tracking and increase the latency level, add large rules sets,
> and increase the latency level, ftp via ssh'ed connections, add latency,
> hope from one system to another hitting firewall boundries and adding
> ssh'ed connections up the latency level.  Try and connect to a server that
> is running with a sysload on the high end, add latency as the remote
> server needs to deal with interupts.
> 
> The question though is, are the latencies you are observing out of norm?
> <see question 1 above>
> 
> Thanks,
> 
> Ron DuFresne
> 
> On Thu, 17 Feb 2005, Askar wrote:
> 
> > hi list
> >
> > we are running ftp "proftpd" server it takes times when a user
> > connects to ftp server however when I flush the iptables rules
> > connection doesn't takes time, iptables firewall on the same machine,
> > default policies are DROP,
> > firewall script is very straight forward
> >
> > rules
> > .
> > .
> > # Using Connection State to By-pass Rule Checking
> > iptables -A INPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
> > iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> > iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> > .
> > .
> > .iptables -A INPUT -p tcp --dport 20:21 -m state --state NEW -j ACCEPT
> > .
> > .
> >
> > # Load the FTP connection state helper module.
> > modprobe ip_conntrack_ftp
> > # Load the FTP NAT module.
> > modprobe ip_nat_ftp
> >
> > any idea?
> >
> > regards
> >
> >
> 
> --
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>         admin & senior security consultant:  sysinfo.com
>                         http://sysinfo.com
> 
> ...Love is the ultimate outlaw.  It just won't adhere to rules.
> The most any of us can do is sign on as it's accomplice.  Instead
> of vowing to honor and obey, maybe we should swear to aid and abet.
> That would mean that security is out of the question.  The words
> "make" and "stay" become inappropriate.  My love for you has no
> strings attached.  I love you for free...
>                         -Tom Robins <Still Life With Woodpecker>
> 
> 


-- 
I love deadlines. I like the whooshing sound they make as they fly by.
Douglas Adams

