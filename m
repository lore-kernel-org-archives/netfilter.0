From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: How to make a computer invisible
Date: Tue, 02 Dec 2003 13:19:14 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1070389153.2057.34.camel@grendel>
References: <000501c3b88e$65e35550$6400a8c0@deamon>
	 <20031202081427.58d57208.mgale@utilitran.com>
	 <1070380086.2057.17.camel@grendel>  <20031202162628.GW26447@zeus.tpfm.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031202162628.GW26447@zeus.tpfm.de>
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

Greetings!

On Tue, 2003-12-02 at 11:26, Thomas Preissler wrote:
> 
> I mean, that it looks like that the computer with the ip x is not
> reachable as the same as it is, when you address an ip that
> addresses no computer, i.e. is an unused ip.

Then using a "drop" is not quite the same. Let's say you have no
firewall and someone sends a packet to an unused IP:

packet is received by your edge router
router realizes the target IP is local off of one interface
router sends 3 ARP requests for the IP
When no ARP reply is received, router gives up and returns a host
unreachable to the source IP

Again, nmap expects the above which is why it reports "filtered" when it
hits your drop rule. This is why you can mess up its results by
returning host unreachables.

> Background: I am just experimenting and this was an interesting
> issue for me. I want to setup a whole net with UML boxes and hide
> the physical computer.

UML does this quite nicely. I was part of the crew that started
Dartmouth's security institute, as well as one of the original members
of the honeynet. In both groups we used UML extensively in the setup you
mention above. check:

http://www.ists.dartmouth.edu

They probably still have some papers up there written by Bill Stearns
and myself on the subject.

HTH,
C



