From: Jim Redman <jredman@ergotech.com>
Subject: Re: UDP Redirects
Date: Tue, 16 Sep 2003 11:20:41 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030916172041.GE1321@charizard>
References: <20030916000714.GC3213@charizard> <20030916010550.GC1272@charizard.ergotech-usa.com> <20030916142432.GD16559@cannon.eng.us.uu.net> <20030916154220.GC8490@charizard.ergotech-usa.com> <20030916155245.GF16559@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030916155245.GF16559@cannon.eng.us.uu.net>; from ramin@cannon.eng.us.uu.net on Tue, Sep 16, 2003 at 09:52:45 -0600
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: netfilter@lists.netfilter.org





On 2003.09.16 09:52, Ramin Dousti wrote:
> On Tue, Sep 16, 2003 at 09:42:20AM -0600, Jim Redman wrote:
> 
> > Ramin,
> >
> > On 2003.09.16 08:24, Ramin Dousti wrote:
> > >Do the packets belong to one UDP session? If not, this number of
> > >packets
> > >might overflow your connection-tracking table.
> >
> > The packets are all individual entities.  Any solution if this is
> the
> > problem?  Any way to test?  (There are no indications in the syslog
> > that I've noticed).
> 
> I'm sure there are better ways of doing this but a simple
> 
> cat /proc/net/ip_conntrack | wc

Seems I must have told you an untruth since this is all I have in the 
file relating to the particular connection.  192.168.2.189 is the 
device sending data to me and 192.168.2.97 is me.  I suspect the first 
line is a connection from my app back to the device, since it only 
appears when the app is running.

udp      17 179 src=192.168.2.97 dst=192.168.2.189 sport=32815 
dport=995 src=192.168.2.189 dst=192.168.2.97 sport=995 dport=32815 
[ASSURED] use=1
udp      17 179 src=192.168.2.189 dst=192.168.2.97 sport=995 dport=995 
src=192.168.2.97 dst=192.168.2.189 sport=1995 dport=995 [ASSURED] use=1

Today, however, everything is working (at least at the moment)!  It's 
very strange.  Nothing has changed.  I took the notebook home and 
brought it back.  Same software running here, same device still sending 
the values, etc. etc.   
I still don't know that it's a netfilter problem.  I see the packet 
with tcpdump and don't receive them in the application.  NMAP says the 
port is open and the code is just open connection & receive (in Java).

Ugh.  Well, better get on with the debugging while I'm receiving data.

Ji


-- 

Jim Redman
(505) 662 5156 x85
http://www.ergotech.com

