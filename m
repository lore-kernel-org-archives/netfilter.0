From: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Subject: Re: physdev match
Date: Mon, 27 Sep 2004 10:52:32 +0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1403218a04092700525703ea50@mail.gmail.com>
References: <1403218a040923070324faf49f@mail.gmail.com>
	<4152DBF7.9060402@pbl.ca> <1403218a0409230747732d8ff8@mail.gmail.com>
Reply-To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1403218a0409230747732d8ff8@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

Still the problem, doing

iptables -A INPUT -m physdev --physdev-in eth1 -j LOG

Gives me

iptables: Invalid argument


Any ideas !!!

On Thu, 23 Sep 2004 17:47:28 +0300, Mohamed Eldesoky
<eldesoky.lists@gmail.com> wrote:
> 
> 
> I have this in that path.
> libipt_physdev.so
> 
> However, I will try again.
> 
> On Thu, 23 Sep 2004 09:21:43 -0500, Aleksandar Milivojevic
> <amilivojevic@pbl.ca> wrote:
> > Mohamed Eldesoky wrote:
> > > Ok, I got a stock kernel 2.4.27 patched with ebtables-bnrf, and
> > > noticed that it has added physdev match.
> > > But whenever I try to test a rule with -m physdev --physdev-in <int>
> > > it gives me
> > >
> > > iptables: Invalid argument
> > >
> > > Any special requirements to use it ??
> >
> > Have you patched both userspace (iptables utility) and kernel?  This
> > sounds like iptables utility wasn't patched.  Look into /lib/iptables
> > directory and see what modules you have.
> >
> > --
> > Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
> > Systems Administrator                           1499 Buffalo Place
> > Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7
> >
> >
> 
> --
> Mohamed Eldesoky
> www.eldesoky.net
> RHCE
> 



-- 
Mohamed Eldesoky
www.eldesoky.net
RHCE

