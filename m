From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: ftp access problem
Date: Sat, 24 Jul 2004 09:28:20 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407240928.20309.JALaramie@Loudoun-Fairfax.com>
References: <a0f69e504072403057b210342@mail.gmail.com> <a0f69e5040724044591804e0@mail.gmail.com> <200407241413.48571.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407241413.48571.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

On Saturday 24 July 2004 09:13, Antony Stone wrote:
> On Saturday 24 July 2004 12:45 pm, Askar Ali Khan wrote:
> > Hi Antony,
> >
> > On Sat, 24 Jul 2004 11:22:16 +0100, Antony Stone wrote:
> > > I see you are doing NAT on this firewall.   Do you have the nat_ftp
> > > support module loaded or compiled in to your kernel?
> >
> > #modprobe nat_ftp
> >    modprobe: Can't locate module nat_ftp
>
> Okay, that may not be the exact name of it - I don't use modules, so
> perhaps someone else here can tell you the definitive name for the module?

Try using:

ip_tables
iptable_nat
ip_nat_ftp

Jeff

