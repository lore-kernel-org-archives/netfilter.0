From: shardul Adhikari <free2squid@gmail.com>
Subject: Re: iptables query
Date: Sun, 27 Mar 2005 16:44:42 +0530
Message-ID: <6c2d1c9d05032703144438b83b@mail.gmail.com>
References: <6c2d1c9d05032421374d594338@mail.gmail.com>
	<20050325085447.GA30284@ikkoku.ath.cx>
	<6c2d1c9d050325012835503afe@mail.gmail.com>
Reply-To: shardul Adhikari <free2squid@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <6c2d1c9d050325012835503afe@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Fri, 25 Mar 2005 14:58:18 +0530, shardul Adhikari
<free2squid@gmail.com> wrote:
> On Fri, 25 Mar 2005 09:54:47 +0100, Toby <tobia.conforto@linux.it> wrote:
> > shardul Adhikari wrote:
> > > iptables -A PREROUTING -t nat -i eth0 -d 202.75.112.3 --dport 8080 -j
> > > REDIRECT --to-port 3128
> >
> > I don't see "-p tcp" in that rule.  You can use --dport or --sport only
> > if you specify "-p tcp" or "-p udp".
> >
> > For this reason, that rule will give you an error if you try and run it.
> > Before you correct your mistake, you should look for the error message
> > and see where it is displayed, so that you can more easily discover
> > future mistakes and problems.
> >
> > Toby
> >
> > --
> > Love(n): The delusion that one woman differs from another.
> >                                                 H.L. Mencken
> >
> >
> - p tcp  is there , i forgot to mention it , sorry for that
> the rule is getting accepted , as it is showing in iptables -L -t nat
> 

Basically what i am trying to do is redirect any request going to
202.75.112.3 on port 8080 to port 3128 on the same machine .
Will that be possible , or do i have to set up a separate iptables
server for that purpose.
My iptables squid and dansguardian are running on same machine.

