From: Simon Kitching <simon@ecnetwork.co.nz>
Subject: Re: ethernet headers and iptables counters
Date: Tue, 11 Nov 2003 12:34:11 +1300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1068507251.7980.15.camel@pcjohns.ecnnz.ecnetwork.co.nz>
References: <1068455679.10203.4.camel@hohum.marcsnet.com>
	 <200311100940.hAA9eij16696@agate.rockstone.co.uk>
	 <200311102321.hAANLsj17218@agate.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311102321.hAANLsj17218@agate.rockstone.co.uk>
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

On Tue, 2003-11-11 at 12:21, Antony Stone wrote:
> On Monday 10 November 2003 10:25 pm, Marc Lucke wrote:
> 
> > Antony - my thanks to you.  I rather suspected your answer would be
> > true.  My problem is that I am getting very large differences in the
> > usage I track using iptables and the usage that my ISP reports.
> > iptables reports much more traffic - up to 12% in fact.  I have checked
> > with the ISP who say they too only count layer 3 IP.
> 
> 12% is a lot, and the fact that you think you have 12% more traffic than your 
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


