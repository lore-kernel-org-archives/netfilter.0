From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: telnet question
Date: Wed, 7 Jul 2004 19:49:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407071949.17661.Antony@Soft-Solutions.co.uk>
References: <a0f69e5040706225576326815@mail.gmail.com> <200407071408.36725.Antony@Soft-Solutions.co.uk> <a0f69e5040707114531248581@mail.gmail.com>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <a0f69e5040707114531248581@mail.gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Wednesday 07 July 2004 7:45 pm, Askar Ali Khan wrote:

> On Wed, 7 Jul 2004 14:08:36 +0100, Antony Stone
>
> <antony@soft-solutions.co.uk> wrote:
> > On Wednesday 07 July 2004 10:32 am, Askar Ali Khan wrote:
> > > On Wed, 7 Jul 2004 08:43:58 +0200, Patrick Leslie Polzer
> > >
> > > <leslie.polzer@gmx.net> wrote:
> > > > On Wed, 7 Jul 2004 10:55:21 +0500
> > > >
> > > > Askar Ali Khan <askarali@gmail.com> wrote:
> > > > > my question is that how to makes Linux Box (B) direct to machine C
> > > > > i-e like that Linux Box A.
> > > >
> > > > That depends on your network architecture. Could you please provide
> > > > more information? Use dummy IPs and network ranges that resemble the
> > > > real setup and maybe draw some ASCII stuff.
> > >
> > > okay i will try with dumy IPs, I don't know whats more information you
> > > are asking for :)?
> >
> > We need to understand  how your computers are connected together - ie:
> > what shape your network is.   Imagine one of us had to recreate your
> > network layout in our own office - give us enough information that we'd
> > be able to do that.
>
> machine C is sorta access server we connect it though telnet, and we
> first connect to net using dialup and then telnet to machine C, first
> we ssh to one of our Linux machine and then telnet to C, however its
> possible to telnet directly to C, however due to security we prefer
> first SSHing then from there Telnetting
> all systems are on same netmask.

Okay, so you have a flat network with only one subnet.

In that case I don't understand where netfilter comes into the question, 
because netfilter runs on routers (and helps them say "no" to certain 
packets, basically), and you don't have a router between machines on the same 
subnet.

So, you have three machines all on the same subnet, called A, B and C.

Please state clearly what the problem is, and where you have netfilter 
installed.

Regards,

Antony.

-- 
The words "e pluribus unum" on the Great Seal of the United States are from a 
poem by Virgil entitled "Moretum", which is about cheese and garlic salad 
dressing.


