From: Michael Gale <mgale@utilitran.com>
Subject: Re: Performance Monitor
Date: Tue, 6 Jan 2004 10:20:34 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040106102034.51faba33.mgale@utilitran.com>
References: <20040106154902.23053.60680.Mailman@netfilter-sponsored-by.noris.net>
	<1073407226.927.12.camel@pauloric.intranet>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1073407226.927.12.camel@pauloric.intranet>
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

Hello,

	Adv = advantages and Dis = disadvantages

I found ntop to be stable ... it all depends on what command line switches you specify.

But like all performance monitors they are not designed to be run forever. You should be downloading the data from ntop and saving it in a DB of some sort and then restart the process.

Michael.

On Tue, 06 Jan 2004 14:40:26 -0200
Paulo Ricardo <pauloric@contato.com.br> wrote:

> > Date: Mon, 5 Jan 2004 23:01:15 -0700
> > From: Michael Gale <michael@bluesuperman.com>
> > To: netfilter@lists.netfilter.org
> > Subject: Re: Performance MonitoringPerformance Monitoring
> > Organization: Bluesuperman.com
> > 
> > Hello,
> > 
> > 	Yesterday I was a reply on Performance Monitoring on the netfilter mail
> > list, it suggested the user use IPAC-NG. The admin then have to create a
> > chain for each IP they want to monitor.
> > 
> > I did not think this is a good idea ... so for those of you who want to
> > do bandwidth monitoring I suggest you check out the following. Here is a
> > list of ones I have tried.
> > 
> > ntop -- provides a web GUI for real time monitoring. Using it now on a
> > firewall box to monitoring traffic on each interface. 
> 
> 
> unfortunatly it,s not stable....
> > 
> > Adv .. provides great states , very detailed
> > Dis .. seems to be some over header ... uses a DDR db :(
> > 
> 
> could you give us a link to them ?( Adv and Dis )
> 
> > You can use curl to pull the stats nightly and save them to a text file.
> > Then create a little PHP scritp to provide you with the numbers. Now you
> > will have stats for as long as you want.
> > 
> > iptraf -- not bad ... detail is low.
> > 
> > Adv ... NO over head and works great on a work station or 1 interface
> > machine. It takes a bit to setup because you have to create all the
> > filters your self.
> > 
> > Dis ... out is simple ... a php script to produce a nice web GUI is
> > needed.
> > 
> > Nagios -- http://www.nagios.org/
> > 	Could be over kill depending on what you want ... this is more of a
> > network monitoring tool. Really not designed to be run with one machine
> > in mind.
> > 
> > IPFM -- not bad .. very simple:
> > 
> > example:
> > HOST                          IN         OUT       TOTAL
> > host1.domain.com           12345     6666684     6679029
> > 
> > MRTG for total traffic accounts only
> > 
> > Bandwidthd -- not bad ... currently testing it. Seems to provide web png
> > files much like MRTG but does provide host info. I do not believe you
> > are able to save the data though :(
> > 
> > 
> > Michael.
> 
> 
> 
> 


-- 
Michael Gale
Network Administrator
Utilitran Corporation

