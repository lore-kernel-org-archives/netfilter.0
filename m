From: William Stearns <wstearns@pobox.com>
Subject: Re: ULOG: invalid argument
Date: Fri, 20 Feb 2004 09:16:54 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0402200907580.3252-100000@sparrow>
References: <BAY15-F10Ln5U9T3TGJ00000452@hotmail.com>
Reply-To: William Stearns <wstearns@pobox.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY15-F10Ln5U9T3TGJ00000452@hotmail.com>
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
To: "T. Take" <t_takejp@hotmail.com>
Cc: ML-netfilter <netfilter@lists.netfilter.org>, William Stearns <wstearns@pobox.com>

Good day, T.,

On Fri, 20 Feb 2004, T. Take wrote:

> Hi, Mr. Stearns.
> 
> thank you for replying me.

	You're quite welcome.

> >	The command you're using would normally be run from a script.
> >Would you please check the values of $OUTER_PORT and $INNER_IP and make
> >sure they're valid?
> >	The rest looks good, assuming your kernel and iptables binary have
> >ULOG support.
> 
> I checked the values by changing $OUTER_PORT and $INNER_PORT to eth0 and 
> 192.168.1.0/24 respectively. But, I got the same output "invalid argument"
> 
> I'm sure that I set "ULOG target support" as a module when I compiled 
> kernel, so I think my kernel have ULOG support. And I don't know how to 
> check the iptalbe binary have ULOG support.

	One quick check is to type:

iptables -j ULOG -h

	which should show the help text for the ULOG module at the end if 
your binary has support for ULOG.
	The iptables binary support is generally provided as a module.  
Where this is found depends on the compile time options used, but on a 
Redhat stock system it's found as /lib/iptables/libipt_ULOG.so (worst 
case, do a "locate libipt_ULOG.so").  That module not only provides the 
help text but also all the code necessary to parse command line options 
and actually insert your request to _use_ the ULOG kernel module into the 
kernel.

	If you don't have that file, you'll need to compile the iptables
binary.  The source code is available from
ftp://ftp.netfilter.org/pub/iptables/ (I personally get the snapshots, but
for critical systems you might want to stick with the last released
1.2.9).  The INSTALL file should provide enough hints of what you need to 
do.
	Cheers,
	- Bill

---------------------------------------------------------------------------
        "Absence diminishes mediocre passions and increases great ones,
as the wind blows out candles and fans fires."
        -- La Rochefoucauld
--------------------------------------------------------------------------
William Stearns (wstearns@pobox.com).  Mason, Buildkernel, freedups, p0f,
rsync-backup, ssh-keyinstall, dns-check, more at:   http://www.stearns.org
--------------------------------------------------------------------------


