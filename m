From: Unknown <unknown@unknown.invalid>
Subject: Re: AW: Firewall workaround
Date: Fri, 16 Jan 2004 14:04:10 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <945.11288120902$1074280069@news.gmane.org>
References: <7A3B4AA360FDEF448F3390421FC8D731014BE567@coxhpexg.coxhp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
From: Alistair Tonner <>
In-Reply-To: <7A3B4AA360FDEF448F3390421FC8D731014BE567@coxhpexg.coxhp.com>
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
To: bmcdowell@coxhealthplans.com, netfilter@lists.netfilter.org

On January 16, 2004 01:44 pm, bmcdowell@coxhealthplans.com wrote:
> And of course, people by-pass firewalls for a reason too.  Clearly the user
> here feels the firewall is too restrictive.
>
> It's a lot like passwords.  If they're complex enough to be secure, people
> use post-it notes.
>
> The real question is whether or not the user has the authority to by-pass
> it and whether or not the firewall admin has the authority to be so
> restrictive in the first place.
>
>
> Bob
>
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Tim Evans
> Sent: Friday, January 16, 2004 12:24 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: AW: Firewall workaround
>
>
> On Fri, 16 Jan 2004 18:10:29 +0000, Antony Stone wrote
>
> > I thought you meant you wanted to bypass the firewall filtering and
> > access some (specific) machines using protocols which were being
> > blocked, but if you want to have a more general routing solution
> > then I agree that a VPN is the way to go.
>
> And you do, of course, mean to observe your organization's Internet
> security policies, right?  Organizations put firewalls in place for a
> reason.
>
> --
> Tim Evans, TKEvans.com, Inc.    |    5 Chestnut Court
> tkevans@tkevans.com             |    Owings Mills, MD 21117
> http://www.tkevans.com/         |    443-394-3864
> http://www.come-here.com/News/  |



	Ethics aside, if the firewall is allowing SSH out, get yourself something like 
	exceed, or vnc and forward your desktop throught the ssh tunnel from the other
	box and run relevant applications from the other box.  At least in this manner you 
	minimize the affect of applications running inside the firewall protected network 
	since the application is actually running outside it.

	*cough* 
	Not that I'd know anything about that from my workplace
	*cough*

	Alistair.

