From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: Is it possible to log SNAT mappings?
Date: Wed, 11 Jun 2008 17:32:38 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.0806111730490.4607-100000@iolanthe.rowland.org>
References: <20080611144116.GG10043@khasse.inl.fr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080611144116.GG10043@khasse.inl.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Leblond <eric@inl.fr>
Cc: netfilter@vger.kernel.org

On Wed, 11 Jun 2008, Eric Leblond wrote:

> Hello,
> 
> On Wednesday, 2008 June 11 at 10:25:07 -0400, Alan Stern wrote:
> > Is there any setting in the kernel or in iptables that will enable
> > generation of a log of all SNAT mappings as they are created?  The log
> > should include the original source [IP, protocol, port] plus the mapped
> > [IP, port].
> 
> You can use ulogd2 to achieve this. It can take netfilter_conntrack as
> input and store the event in database or files.
> 
> The software is in pre rc state but it is working fine for me.
> 
> URLs:
>  * Homepage: http://www.netfilter.org/projects/ulogd/index.html
>  * user doc: http://software.inl.fr/trac/wiki/ulogd2/user 
>  * tutorial: http://www.wzdftpd.net/blog/index.php?2008/04/05/19-ulogd2-the-new-userspace-logging-daemon-for-netfilter-iptables-part-2
>  * devel doc: http://home.regit.org/?page_id=90

Thanks for your help.  It turns out I don't need ulogd2; the conntrack
program does what I need.  But I wouldn't have found it without your
assistance.

Alan Stern

