From: Brent Gregersen <gregerse@chemsun.chem.umn.edu>
Subject: RE: work ip address at home
Date: Wed, 22 Oct 2003 13:15:31 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031022125857.K34090@chemsun.chem.umn.edu>
References: <7C9884991ADAE0479C14F10C858BCDF5122E78@alderaan.smgtec.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF5122E78@alderaan.smgtec.com>
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
To: Daniel Chemko <dchemko@smgtec.com>
Cc: netfilter@lists.netfilter.org

On Wed, 22 Oct 2003, Daniel Chemko wrote:

> Well, I'd say that VPN is the most obvious solution for this problem,
> but since you haven't done that already, I assume you aren't doing this
> above the radar, or without network competent administrators.
>
> An SSH tunnel is feasible as long as the client side doesn't need to use
> the work IP for the protocol to function. Maybe if you gave some details
> on this 'license server' we could get a better idea on what we're
> working on. Is this plugging into something like LM Server?

The license server is a machine I do not have access to. It is running
Elan License Manager software for Tecplot (application I want to use at
home to prepare graphs/plots for journal articles). I believe tecplot
compares the ip address of application machine to a 'valid' ip domain
contained in license obtained from the license server.  This was the reasoning
behind the 'trick application into thinking I am at work' approch. I
could be wrong on this however. If thats the case, I'll look into
implementing a VPN solution between my home machine and work machine.
(wrong forum, but any pointers/urls on useful VPN software?)



>
>
> -----Original Message-----
> From: Brent Gregersen [mailto:gregerse@chemsun.chem.umn.edu]
> Sent: Wednesday, October 22, 2003 10:08 AM
> To: netfilter@lists.netfilter.org
> Subject: work ip address at home
>
> I need help with the following setup.
>
> I have one machine at home that gets an IP address (say 1.2.3.4) by DHCP
> from an ISP. However, I would like applications on my home machine to
> think it has the ip address of my machine at work (say 4.3.2.1).
> I would then like to forward a specific port of my home machine to my
> work
> machine, and then forward that to a license server at work. Thus,
> application thinks I'm at work, license server thinks Im at work, but Im
> really sitting comfortably in my own home.
>
> Is this possible? Should this be done with netfilter/iptables or should
> I
> be looking at another option?
>
> If it is possible, I could get some extra work done at home, without
> having to use certain graphics intensive programs over a tunneled X
> connection to my work machine(which is extreamly slow).
>
> A diagram:
>
>         LinuxA                 LinuxB            LinuxC
> |---------HOME---------|     |---Work--|     |-Work Server-|
> |'4.3.2.1' <--> 1.2.3.4|<--->| 4.3.2.1 |<--->|   4.3.2.2   |
> |----------------------|     |---------|     |-------------|
>
>
> Thanks for any help/suggestions
>
>

