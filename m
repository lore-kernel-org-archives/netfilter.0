From: Marc Lucke <marc@marcsnet.com>
Subject: Re: netfilter digest, Vol 1 #1292 - 10 msgs
Date: 11 Nov 2003 19:37:58 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1068539878.14304.10.camel@hohum.marcsnet.com>
References: <20031110120106.4132.41732.Mailman@netfilter-sponsored-by.noris.net>
	 <1068503133.26846.12.camel@hohum.blue.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1068503133.26846.12.camel@hohum.blue.net.au>
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

Thanks Simon, and again, Antony,

Simon - I have investigated the server's local traffic in full and yes,
the -i eth0 -o eth1 takes care of all of that.  Good thinking, though
:-)

It looks like you guys agree with me and my paradigm and that somehow my
ISP is actually wrong.  The fact that my ISP is apparently undercharging
me (go figure!) is a strangely unsettling thought and it is really
difficult for me to believe that iptables OR my ISP are wrong.

I might have a hunt around - maybe slashdot - for someone that could
shed some light on this situation.


good day to you all
Marc

On Tue, 2003-11-11 at 12:21, Antony Stone wrote:
> On Monday 10 November 2003 10:25 pm, Marc Lucke wrote:
> 
> > Antony - my thanks to you.  I rather suspected your answer would be
> > true.  My problem is that I am getting very large differences in the
> > usage I track using iptables and the usage that my ISP reports.
> > iptables reports much more traffic - up to 12% in fact.  I have
checked
> > with the ISP who say they too only count layer 3 IP.
> 
> 12% is a lot, and the fact that you think you have 12% more traffic
than your 
> ISP does is more strange than if it were the other way around.

What about traffic from your host back to itself?

For example, GNOME heavily uses the ORBIT corba server, which uses
TCP/IP to communicate between interacting applications.

Maybe you could add a separate rule for traffic from 127.0.0.1 and to
your local host address back to the local machine, to measure that?

NB: I'm no networking guru, so this may be a red herring...
And I didn't see the original posting for this, so don't know if the
server you are measuring traffic on is running anything else...


Regards,

Simon

