From: William Stearns <wstearns@pobox.com>
Subject: Re: Packet dumping or mirroring
Date: Wed, 18 Feb 2004 16:07:53 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0402181605270.3252-100000@sparrow>
References: <20040218135436.309837c7@mgalepc.utilitran.com>
Reply-To: William Stearns <wstearns@pobox.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040218135436.309837c7@mgalepc.utilitran.com>
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

On Wed, 18 Feb 2004, Michael Gale wrote:

> So I have the following idea / solution involving iptables :)
> 
> Solution 1:
> First you create a "tmpfs" .. for example in your NTOP home directory call it
> tmp (/home/ntop/tmp). Now make this directory a RAM drive that gets mount
> everytime we boot up, about 50MB (maybe).
> 
> Now we create a module for iptables to send a copy of every packet on every
> interface to the RAM drive or dummy device.
> 
> What do you think ... I do not believe there is a way to do this now :(

	You seem to be describing ulogd:
http://www.stearns.org/doc/iptables-ulog.current.html
	(with pointers to other relevant sites).  You'd instruct ulogd to 
save its files to a ramdisk as opposed to a physical disk.
	Cheers,
	- Bill

---------------------------------------------------------------------------
	"Me spell chucker work grate.  Need grandma chicken."
	-- yakkoj@netscape.net
--------------------------------------------------------------------------
William Stearns (wstearns@pobox.com).  Mason, Buildkernel, freedups, p0f,
rsync-backup, ssh-keyinstall, dns-check, more at:   http://www.stearns.org
--------------------------------------------------------------------------


