From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: HELP!!! (ip_conntrack: table full)
Date: Tue, 28 Oct 2003 20:58:18 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310282058.18831.Alistair@nerdnet.ca>
References: <007e01c39dbc$d606fae0$de0018ac@admin.monash.edu.my>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <007e01c39dbc$d606fae0$de0018ac@admin.monash.edu.my>
Content-Disposition: inline
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
To: eturner@monash.edu.my, netfilter@lists.netfilter.org

On October 28, 2003 08:34 pm, Edmund Turner wrote:
> Hey guys, its been awhile,(im getting old and my memory seems to escape
> me.) so please bear with me. :)
>
> TO remove the module
>  rmmod ip_conntrack.o
> How do I reinstate the module?????



	*THWACK* 

	insmod
	modprobe
	
	(oops .. that fish was dead .. .sorry)

>
>
> Regards
> edmund
>
>
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of NightHawk
> Sent: Tuesday, October 28, 2003 4:22 AM
> To: netfilter@lists.netfilter.org
> Subject: Re: HELP!!! (ip_conntrack: table full)
>
> Warren,
>    I would only raise the value in /proc/net/ip_conntrack a little bit
> at a
> time till you find the lowest number that works for your situation.
> Once you
> have everything under control, the number shouldn't have to be too high,
> at
> least this has been my experience.  I only raise the number when having
> a
> "situation", and then lower it back down once things are calmed down.
>
> And yes, I did mean to rmmod ip_conntack, when I mentioned dropping
> ip_conntrack.  Although, this tends to require dropping a few other
> modules
> as well, and also tends to require stopping iptables while you do so.
> (due to
> some of the modules that you have to remove.)  Which is why it is not
> the
> best solution for all situations....
>
> NH
>
> On Monday 27 October 2003 2:52 pm, Warren P wrote:
> > hi
> >
> > WRT echo ## > /proc/net/ip_conntrack
> >
> > Considering i've got 1gig of RAM ... what is a safe value i
> > can set ip_conntrack_max to? The current value is 65528
> >
> > Also when you refer to dropping ip_conntrack ... do mean
> > like rmmod ip_conntrack.o?
> >
> > Regards,
> > Warren P

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

