From: "Chua Boon Ping" <nitb@hotmail.com>
Subject: Re: why must linux for halted firewall?
Date: Tue, 16 Sep 2003 19:43:57 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY8-F93nZtpNHH7nqd000177b8@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pheusion@snet.net
Cc: netfilter@lists.netfilter.org

well... i am currently doing a research paper on Halted Firewall on Linux 
platform. I would like to know can OpenBSD implement such a firewall? can 
OpenBSD halted just like Linux kernel does?

i had read the article. thanks.


>From: Nox <pheusion@snet.net>
>To: Chua Boon Ping <nitb@hotmail.com>
>CC: netfilter@lists.netfilter.org
>Subject: Re: why must linux for halted firewall?
>Date: Tue, 16 Sep 2003 15:33:36 -0400
>
>For us,
>We have a runlevel 0 firewall, from Debian
>it was developed in house, fine tuned by this article:
>
>http://www.samag.com/documents/s=1824/sam0201d/0201d.htm
>
>For us, this FW protects a Bioinformatics cluster,
>which rarely changes on the rules side of things,
>the benefit form our standpoint is the non-access into the machine,
>(No user priv escalation due to no logon)
>the drawback is we currently have no logging enabled.
>(We are working on it.
>
>Hope that helps
>
>Nox
>GenMicro systems
>Bioinformatics applications and devices
>(Website in development)
>
>On Sun, 2003-09-14 at 23:16, Chua Boon Ping wrote:
> > dear all,
> >    I am newbie in open source and recently i am busy on some assignment
> > concerning "why opts for Linux(netfilter/iptables) rather than OpenBSD 
>to
> > implement a Halted Firewall". actually, can OpenBSD be halted just like
> > Linux kernel do? As i mentioned, i am newbie and would like have some
> > guidance from you guys. Thanks.
> >
> > Chua
> >
> > _________________________________________________________________
> > Using a handphone prepaid card? Reload your credit online!
> > http://www.msn.com.my/reloadredir/default.asp
> >
> >
>

_________________________________________________________________
Are you in love? Find a date on MSN Personals http://match.msn.com.my/


