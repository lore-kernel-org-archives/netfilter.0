From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: How to make a computer invisible
Date: Tue, 2 Dec 2003 20:48:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031202204852.6813c406.arnt@c2i.net>
References: <000501c3b88e$65e35550$6400a8c0@deamon>
	<20031202081427.58d57208.mgale@utilitran.com>
	<1070380086.2057.17.camel@grendel>
	<20031202162628.GW26447@zeus.tpfm.de>
	<1070389153.2057.34.camel@grendel>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1070389153.2057.34.camel@grendel>
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

On Tue, 02 Dec 2003 13:19:14 -0500, 
Chris Brenton <cbrenton@chrisbrenton.org> wrote in message 
<1070389153.2057.34.camel@grendel>:

> Greetings!
> 
> On Tue, 2003-12-02 at 11:26, Thomas Preissler wrote:
> > 
> > I mean, that it looks like that the computer with the ip x is not
> > reachable as the same as it is, when you address an ip that
> > addresses no computer, i.e. is an unused ip.
> 
> Then using a "drop" is not quite the same. Let's say you have no
> firewall and someone sends a packet to an unused IP:
> 
> packet is received by your edge router
> router realizes the target IP is local off of one interface
> router sends 3 ARP requests for the IP
> When no ARP reply is received, router gives up and returns a host
> unreachable to the source IP
> 
> Again, nmap expects the above which is why it reports "filtered" when
> it hits your drop rule. This is why you can mess up its results by
> returning host unreachables.

..so, to play dead, we really oughtta wait for the 3'rd "ping" 
before firing off the "Destination Host Unreachable"?

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



