From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: I have to become a bandwidth Nazi , Netfilter useable.
Date: Sat, 1 Mar 2003 18:50:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030301185029.66e15b7a.arnt@c2i.net>
References: <000201c2dffa$8ad18480$0c05a8c0@Sherby>
	<200303011019.00158.netfilter@newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200303011019.00158.netfilter@newkirk.us>
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

On Sat, 1 Mar 2003 10:19:00 -0500, 
Joel Newkirk <netfilter@newkirk.us> wrote in message 
<200303011019.00158.netfilter@newkirk.us>:

> On Saturday 01 March 2003 08:57 am, George Peverill wrote:
> > I am running a small network (about 10-12 machines) with a linux
> > gateway machine providing http/ssh/vpn(pptp)/firewalling/NAT
> > Recently we've had someone that loves to hog bandwidth a tad (ie:
> > downloading movies at 150-200k/s) while we slave away
> > with the remaining 50k/s or so of bandwidth.  I was wondering and I
> > think its possible) if I could remedy this without resorting
> > to compilicated QoS / CBQ crap.  Basically is it possible to write a
> > rule that'd say drop 25% or maybe 50% of all packets going to his
> > machine from the gateway? (nasty yes agreed)
> >
> > -internal interface is eth0 (192.168.0.x)
> > -external interface is eth1
> >
> > Is it possible to do it based on his IP (which is known lets say
> > 192.168.0.55 for example sake) or his MAC address which is known.
> 
> Match in FORWARD chain (BEFORE any ACCEPT rules) with "-d
> 192.168.0.55", and also possibly with "-p tcp --dport <portnumber>"
> with the port that the traffic goes to, or "--sport" with the port the
> traffic comes from.  (this depends on the p2p app he's using)  You can
> use the limit match to specify a fixed number of packets in a
> specified period of time, but not a percentage.  You'd need to figure
> out how many packets per second to set as a maximum.
> 
> You may find that DROP doesn't help much, though, as it's likely his
> p2p client will just keep requesting data, and the source will just
> keep pumping it through as fast as it's able to.  You might be better
> served by Arnt Karlsen's favored approach - the TARPIT target from 
> patch-o-matic, or my favorite - whack him on the head with a keyboard.
> 
> It also might help to use the similar dport/sport+sourceIP+limit
> approach to restrict how many requests his p2p client can send out in
> a given timeframe, as well as upload traffic.  (many p2p clients
> force, or strongly encourage [IE by limiting download to 4x upload]
> allowing uploads from the client)
> 
> > Any help would be greatly appreciated.  I dunno how this can be done
> > but im sure someone might be able to figure it out , would have to
> > be done in the PREROUTING where SNAT is done wouldnt it ?
> 
> No, this is filtering and should be done in the filter table, in this 
> case the FORWARD chain.
> 
> j
> 
> 


..also, check out http://tldp.org/HOWTO/Adv-Routing-HOWTO/

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



