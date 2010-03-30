From: Stig Thormodsrud <stig@vyatta.com>
Subject: Re: NetFlow / sFlow / IPFIX network probe proposal
Date: Tue, 30 Mar 2010 12:06:32 -0700
Message-ID: <4BB24BB8.7000808@vyatta.com>
References: <22578828.43001269973644747.JavaMail.root@tahiti.vyatta.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <22578828.43001269973644747.JavaMail.root@tahiti.vyatta.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org, roman@tsisyk.com

> What is wrong in ipt_NETFLOW module
> (http://sourceforge.net/projects/ipt-netflow/) ?
> Ipt_NETFLOW is a really useful module and it never load CPU more than
> 1%. But internal architecture of ipt_NETFLOW cannot support all of
> described above features (because have one common hash table and
> configuration with module params). I'd prefer not to reinvent the
> wheel and think about redesigning ipt_NETFLOW or writing new module
> using ipt_NETFLOW base.
> 
> I'm a student and want to work on this project within Summer of Code
> program. The Linux Foundation site pointed to the mail list.
> My main goal is to make high-quality featured module, that will be
> useful for anybody and acceptable for inclusion into mainstream
> Kernel.
> 
> What do you think about this? Please, advice me or give some ideas.
> May be somebody wanted to be a mentor? I'll send detailed information
> about my bio, contacts, skills, work experience as well as schedule
> plan directly to a potential mentor and/or GSoC site.
> 
> BTW, a NetFlow exporter feature is a most rated request on the Vyatta
> site, so it should be interesting not only for me.

Hi Roman,

You mentioned that netflow exporter is the most requested feature on
Vyatta.  That was true until today when VC6 was release with our 1st
netflow/sflow exporter.  I used pmacct (http://www.pmacct.net) and ULOG
to get the packets to uacctd.  There's certainly a lot more that can be
done to support higher bandwidth interfaces.  I'm considering PF_RING.
At any rate I'd be glad to work with you if you want to improve our
netflow support.  The pmacct developer is also very helpful in answering
 pmacct questions and getting patches integrated into pmacct.

For an example of how to use netflow in vyatta VC6 see:
http://www.vyatta.org/forum/viewtopic.php?p=27038#27038

stig


