From: mailinglists@belfin.ch
Subject: RE: AW: default policy
Date: Sat, 2 Nov 2002 09:18:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <31347F3CE518D6118ACB00A0246AD0560B2405@mx.snizek.ch>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: Netfilter <netfilter@lists.netfilter.org>


> > > Ziegler's book states that it should be this (it was never
> > > put in these
> > > words but this is what I am gathering from my reading):
> > > iptables -t nat    -P PREROUTING  DROP
> > > iptables -t nat    -P OUTPUT      DROP
> > > iptables -t nat    -P POSTROUTING DROP
> > > iptables -t mangle -P PREROUTING  DROP
> > > iptables -t mangle -P OUTPUT      DROP
> > > iptables -t filter -P INPUT       DROP
> > > iptables -t filter -P OUTPUT      DROP
> > > iptables -t filter -P FORWARD     DROP
> 
> I regard these policies as a very bad idea.   Definitely not 
> something to be 
> recommended in a book about building good firewalls.   I have 
> heard that 
> Ziegler's book contains some errors, but if it contains the above 
> recommendations for default policies I consider to be a very 
> poor text indeed.

Who's Ziegler?
 
> > Of course you can do that. But this is multiple pleonasm. 
> I.e. if you drop
> > PREROUTING you don't have to drop INPUT anymore. If your 
> DROP Policy covers
> > every built-in chain you must write a rule for every DROPed 
> chain to allow
> > a certain action. Your filter becomes unclear and thus, 
> hard to read and
> > hard to manage.
> 
> Actually, it is worse than that.
> 
> If you are using netfilter's stateful inspection capabilities 
> (and you should 
> be) then setting the above policies on the nat and mangle 
> tables will simply 
> stop things from working.

The point is, you must learn how packets traverse the filter. Once you
understand this you will know which policies you have to set DROP.
 
> You should never set any default policy other than ACCEPT on 
> a nat or mangle 
> table.
> 
> I sometimes think it was a bad idea even to make it possible.

No, I don't think so. It's hard for beginners, yes. But once you understand
what iptables is capable of (compared to other commercial products) you
actually are glad that there is a product giving you control over
everything.
Defining the policies for every chain is such a freedom.

Philipp 

