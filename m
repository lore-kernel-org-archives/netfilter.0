From: Nuitari <nuitari@balthasar.nuitari.net>
Subject: Re: Problem with counting
Date: Tue, 8 Oct 2002 00:44:44 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210070023330.17224-100000@balthasar.nuitari.net>
References: <200210061640.g96GeUL13213@vulcan.rissington.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210061640.g96GeUL13213@vulcan.rissington.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Sun, 6 Oct 2002, Antony Stone wrote:

> On Sunday 06 October 2002 11:21 pm, Nuitari wrote:
> 
> > On Sat, 5 Oct 2002, Antony Stone wrote:
> 
> > > Show us the rest of your rules.
> 
> > extip="`/sbin/ifconfig eth0 | grep 'inet addr' | awk '{print $2}' | sed -e
> > 's/.*://'`"
> > iptables -F FORWARD
> > iptables -F INPUT
> > iptables -F OUTPUT
> >
> > iptables -P FORWARD ACCEPT
> 
> Ugh :-(   Horrible.
> 
> > iptables -t nat -F POSTROUTING
> > iptables -t nat -F PREROUTING
> >
> > EXTERNAL_INTERFACE="eth0"
> > IPTABLES="/usr/sbin/iptables"
> > INTERNAL_HOSTS="10.0.0.2 10.0.0.3 10.0.0.4 10.0.0.5 10.0.0.6 10.0.0.7
> > 10.0.0.8 10.0.0.9 10.0.0.10 10.0.1.2"
> 
> Okay, so you have a bunch of ten machines on private addresses inside your 
> LAN.
> 
> > for HOST in $INTERNAL_HOSTS; do
> >
> >         $IPTABLES -A FORWARD -o $EXTERNAL_INTERFACE -d $HOST -j ACCEPT
> >         $IPTABLES -A OUTPUT -o $EXTERNAL_INTERFACE -d $HOST -j ACCEPT
> 
> Why would a packet ever leave your external interface, with a destination 
> address of one of your internal machines ?
> 
> >         $IPTABLES -A FORWARD -i $EXTERNAL_INTERFACE -s $HOST -j ACCEPT
> >         $IPTABLES -A INPUT -i $EXTERNAL_INTERFACE -s $HOST -j ACCEPT
> 
> Why would a packet ever come in through your external interface with a source 
> address of one of your internal machines ?
> 
> What are these rules supposed to do ?

They are some rules I wrote after the exemple provided with bw_acct (see 
below) didn't work well.

> > done;
> >
> > iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> > iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
> 
> What ???   One of these I can understand - hide all your internal machines 
> behind the external IP of the Firewall, but why are you also hiding the 
> entire Internet from your internal machines, behind the internal IP of your 
> Firewall ?
> 
> And anyway, if eth0 is your external interface (defined above), what's ppp0 ?

eth0 is the external interface.
tr0 is my internal network
ppp0 is a backup interface (the rule is there to make it easier when the 
cable modem goes kaput from time to time).
 
> > after that there is a bunch of rules following this pattern
> >
> > iptables -A FORWARD -i eth0 -o tr0 -p tcp --dport 873 -m state --state
> > NEW,ESTABLISHED,RELATED -j ACCEPT
> 
> What is tr0 ?

The internal network.

> > iptables -A PREROUTING -t nat -p tcp -d $extip --dport 873 -j DNAT --to
> > 10.0.0.2:873
> >
> > I also tried having the following rules in the above for loop:
> > $IPTABLES -N $HOST
> > $IPTABLES -A FORWARD -o $EXTERNAL_INTERFACE -d $HOST -j $HOST
> > $IPTABLES -A $HOST -o $EXTERNAL_INTERFACE -d $HOST
> > $IPTABLES -A $HOST -i $EXTERNAL_INTERFACE -s $HOST
> 
> I think you are confused about the interfaces which packets are expected to 
> arrive or leave on, and what source / destination addresses they should have.
> 
> Either that, or I've very much misunderstood what you're trying to do, and 
> I'm confused....
> 
> Perhaps if you can answer the questions I've raised above we might both learn 
> a bit more about what's going on :-)


They are from the bw_Acct package.
I'm trying to get usage statistics from every machine that are 
masqueraded.


