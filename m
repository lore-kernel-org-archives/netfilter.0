From: Ross Vandegrift <ross@willow.seitz.com>
Subject: Re: Clear Iptables chains?
Date: Mon, 8 Jul 2002 12:43:36 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020708164335.GA25334@willow.seitz.com>
References: <839BF5387528D311AD5D00902751CFC301B0419A@HAVASSMX> <20020708144658.GR32764@tik.ee.ethz.ch> <200207081456.g68EuF807141@vulcan.rissington.net> <200207081522.g68FMr807248@vulcan.rissington.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <200207081522.g68FMr807248@vulcan.rissington.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.samba.org

On Mon, Jul 08, 2002 at 04:22:47PM +0100, Antony Stone wrote:
> On Monday 08 July 2002 3:56 pm, Antony Stone wrote:
> 
> > On Monday 08 July 2002 3:46 pm, Lukas Ruf wrote:
> > > iptables -P INPUT ACCEPT
> > > iptables -P OUTPUT ACCEPT
> > > iptables -P FORWARD ACCEPT
> 
> I'd prefer to see:
> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
> iptables -P FORWARD DROP
> 
> Then you add in the rules for the stuff your definitely know you want to 
> allow.

Be careful with doing this though, if you're managing a remote box.
It's *very* easy to cut yourself off the box when setting policy like
this.

I keep a script around that flushes all rules and sets default policy to
ACCEPT, and then make -P DROP the first three commands in the script to
configure iptables.  This prevents me from neutering my access when I'm
hacking around with the firewall rules.

Ross Vandegrift
ross@willow.seitz.com

