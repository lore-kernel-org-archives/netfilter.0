From: William Stearns <wstearns@pobox.com>
Subject: Re: Packet dumping or mirroring
Date: Wed, 18 Feb 2004 16:20:56 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0402181619310.3252-100000@sparrow>
References: <Pine.LNX.4.44.0402181605270.3252-100000@sparrow>
Reply-To: William Stearns <wstearns@pobox.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0402181605270.3252-100000@sparrow>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Gale <michael.gale@utilitran.com>
Cc: ML-netfilter <netfilter@lists.netfilter.org>, William Stearns <wstearns@pobox.com>

Good afternoon, Michael,

On Wed, 18 Feb 2004, William Stearns wrote:

> On Wed, 18 Feb 2004, Michael Gale wrote:
> 
> > First you create a "tmpfs" .. for example in your NTOP home directory call it
> > tmp (/home/ntop/tmp). Now make this directory a RAM drive that gets mount
> > everytime we boot up, about 50MB (maybe).
> > 
> > Now we create a module for iptables to send a copy of every packet on every
> > interface to the RAM drive or dummy device.
> > 
> > What do you think ... I do not believe there is a way to do this now :(
> 
> 	You seem to be describing ulogd:
> http://www.stearns.org/doc/iptables-ulog.current.html
> 	(with pointers to other relevant sites).  You'd instruct ulogd to 
> save its files to a ramdisk as opposed to a physical disk.

	BTW, ntop will gladly read from pcap files (the "-f" parameter;  
see http://www.stearns.org/doc/pcap-apps.html ).
	Cheers,
	- Bill

---------------------------------------------------------------------------
        Santa Clara, CA (Reuters): Sources close to the spiritual leader
of the Linux movement report that Linus Torvalds has entered his 23rd
day of fasting.  The move is apparently not for religious reasons. 
"I've spent so much time looking at vomit-producing code, that Tove
refuses to feed me any more, and gives me Karate chops whenever I even
threaten to blow chunks.  Our carpet cleaning bill exceeds our mortgage. 
Hell, the ISDN subsystem alone turned our favourite Persian rug into a
monstrosity that college students won't even pick up off the street
corner.  With Jeff Dike's memory management code coming up, I thought
I'd best be prepared."
        -- WLS
--------------------------------------------------------------------------
William Stearns (wstearns@pobox.com).  Mason, Buildkernel, freedups, p0f,
rsync-backup, ssh-keyinstall, dns-check, more at:   http://www.stearns.org
--------------------------------------------------------------------------


