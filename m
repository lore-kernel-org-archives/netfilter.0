From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: netfilter and IIS5
Date: Mon, 7 Oct 2002 20:48:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021007194849.DSNA7631.mta03-svc.ntlworld.com@there>
References: <AF435BB1224A4C4888B58C546728EE322FF3@s2.valiant.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <AF435BB1224A4C4888B58C546728EE322FF3@s2.valiant.com>
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

On Monday 07 October 2002 8:41 pm, Keith R. Weiner wrote:

> I actually got it working.  However, I remember having problems in the past
> with IIS running behind an netfilter firewall.  The problem was when I
> changed the external address to forward to the same internal address.

What do you mean by that ?

> Even rebooting both the linux and the windows servers didn't help.
> Microsoft had a bulletin on the subject of IIS having problems behind a
> natted firewall, but offered no solution.

When you say you are running IIS, what network services are you talking 
about?   Is this HTTP, FTP, SMB file sharing, or what ?

Antony.

> -----Original Message-----
> From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]
> Sent: Monday, October 07, 2002 3:14 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: netfilter and IIS5
>
> On Monday 07 October 2002 5:21 pm, Keith R. Weiner wrote:
> > Excuse me if this is a newbie question.
> >
> > I am running IIS on Windows 2000 behind the DMZ.  The first linux box is
> > using the old ipchains.  The second box is using netfilter.  From within
> > the DMZ, I can access it.  From the outside world, it is not accessible.
> > Other services are, but not IIS.
>
> Tell us your firewall rules and show us your network configuration.
>
> Antony.

-- 

Success is a lousy teacher.   It seduces smart people into thinking they 
can't lose.

 - William H Gates III

