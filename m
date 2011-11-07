From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: libiptc or alternative
Date: Mon, 7 Nov 2011 02:03:09 +0100
Message-ID: <20111107010309.GB30000@1984>
References: <j91h2m$sp4$1@dough.gmane.org>
 <20111107010219.GA30000@1984>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20111107010219.GA30000@1984>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "U.Mutlu" <for-gmane@mutluit.com>
Cc: netfilter@vger.kernel.org

On Mon, Nov 07, 2011 at 02:02:19AM +0100, Pablo Neira Ayuso wrote:
> On Fri, Nov 04, 2011 at 09:14:13PM +0100, U.Mutlu wrote:
> > Hi,
> > in my userland-app I'm calling the iptables binary to add and
> > to remove iptables rules, but after moving to a Gigabit-Link
> > I need a faster method.
> > libiptc seems to fit the job but then it seems to be 'deprecated', is it really?
> > Is there a successor to it, or other alternatives?
> > Can I still use libiptc on a system where iptables v1.4.12 is installed?
> 
> Pipe commands to iptables-save.

Sorry, I meant to say iptables-restore, of course.
