From: Rowan Reid <rreid@studio3arc.com>
Subject: RE: Internal ip exiting network on firewall external nic despight rule
Date: Fri, 20 Sep 2002 14:58:52 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c260f0$e8e7fb50$0801a8c0@s3ac>
References: <20020920213602.TMJS295.mta06-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <20020920213602.TMJS295.mta06-svc.ntlworld.com@there>
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
To: 'Antony Stone' <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org


> >
> > I should have mentioned the internal machine is 
> masquaraded. Therefore 
> > It should go to the input chain no ?
> 
> The INPUT chain is for packets addressed to the firewall itself.
> 
> The FORWARD chain is for packets going through the firewall 
> to some other 
> machine.
> 
> Destination NAT is performed in the PREROUTING chain, which 
> comes before 
> either INPUT or FORWARD, therefore it is the "real" destination which 
> determines whether a packet traverses the INPUT or the FORWARD chain.
> 

Just when I thought I understood. So returning masqaraded traffic hits
the input rule set no ? Then gets routed through POSTROUTING is it then
routed to the forward ruleset, or is it just sent out. What I'm
realizing is to stop internal machines from accessing the external
interface I need to put drop rule for all insternal traffic on the
FORWARD chain such as below ?

$IPTABLES -A INPUT -i $EXTIF -s $INTNET -d $UNIVERSE -j drop-and-log-it
$IPTABLES -A FORWARD -i $EXTIF -s $INTNET -d $UNIVERSE -j
drop-and-log-it

Then figure out why exactly my local net machines are accessing my
external IP to exit the net. This confuses me because all these machines
are setup with the gateway being the internal ip
(192.168.1.1/255.255.255.0) as the gateway so these machines shouldn't
even know my external ip/interface exists.


