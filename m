From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ip_tables_names not showing any results.. please help
Date: Sun, 2 May 2004 22:53:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405022253.14529.Antony@Soft-Solutions.co.uk>
References: <1402.216.22.86.180.1083517083.squirrel@www.123plaza.com> <200405021823.58366.Antony@Soft-Solutions.co.uk> <2846.216.22.86.180.1083527377.squirrel@www.123plaza.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2846.216.22.86.180.1083527377.squirrel@www.123plaza.net>
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
To: netfilter@lists.netfilter.org

On Sunday 02 May 2004 8:49 pm, ignaciob@123plaza.com wrote:

> > On Sunday 02 May 2004 5:58 pm, 123plaza Malls wrote:
> >> Hi All,
> >>
> >> Please forgive my ignorance, but being an inexperienced linux user I
> >> managed to break something with my iptables
> >
> > What were you doing when it broke?   Recompiling your kernel?
> > Recompiling
> > iptables?   Fiddling with the startup scripts?  Un/Installing netfilter
> > RPMs?
>
> The last thing I remember doing was 2 things:
>
> 1) Modify a script I use via cron.hourly used to clear iptables blocking
> entries set by portsentry, AND made a mistake when calling a command to
> clear history files.
>
> 2) Other than this recently upgraded the kernel to latest (rpm) version
> from redhat

I would say that item number 2 has caused your problem.

1. Reboot using the previous kernel version and check whether the problem goes 
away.

2. Check whether the new kernel includes netfilter support.

3. Check (if you are using modules) whether you have the correct version of 
netfilter modules for the new kernel.

4. If none of the above solves the problem, ask on a Red Hat support mailing 
list.

Regards,

Antony.

-- 
There's no such thing as bad weather - only the wrong clothes.

 - Billy Connolly

                                                     Please reply to the list;
                                                           please don't CC me.


