From: Ted Kaczmarek <tedkaz@optonline.net>
Subject: Re: IP Spoofing
Date: Sat, 08 Nov 2003 13:06:19 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1068314779.12569.30.camel@tarkus>
References: <60197.200.180.160.84.1068060676.squirrel@www.alcidesmaya.com.br>
 <200311051951.hA5Jpdr13332@agate.rockstone.co.uk>
 <60250.200.180.160.130.1068063541.squirrel@www.alcidesmaya.com.br>
 <200311052039.hA5KdYr13351@agate.rockstone.co.uk>
 <1068208010.29753.10.camel@tarkus> <1068212092.1438.8.camel@main.tqmcube.com>
Reply-To: tedkaz@optonline.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <1068212092.1438.8.camel@main.tqmcube.com>
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
To: IPTables Mailing List <netfilter@lists.netfilter.org>
Cc: "David C. Hart" <DCH@TQMcube.com>

It will allow sessions initiated from the host running iptables to allow
for connections to come back in that are in response to the packet the
host sends out.

If you don't allow the established related packets, you would have to
create a separate rule for each and every IP/Port pair you connect to,
that would allow those packets back in.

The tutorial's at http://iptables-tutorial.frozentux.net/ are some of
the best I have seen, you should add them to your list of reading along
with the other good links you have received.

Unfortunately explaining firewalls in simple terms is not possible.
If you really want to learn, some good materials would be Richard
Stephen TCP/IP Illustrated, you really need to know the protocol itself
before all the firewall technology will make sense.

Also keep in mind that a firewall running on a gateway device  is very
different than on a host.

As always, google is your friend.

Ted




On Fri, 2003-11-07 at 08:34, David C. Hart wrote:
> On Fri, 2003-11-07 at 07:26, Ted Kaczmarek wrote:
> > I would add an input established on that as well, makes it easier to do
> > upgrades.
> > 
> > iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> 
> Hi Ted:
> 
> If you have a moment, could you please explain (for the comparative IPT
> nitwits - including me) what that does?
> > 
> > I wish everyone did implicit DROP's, it would make the web a safer
> > place.
> 
> IBID
> 
> Thanks
> > 
> > :-)
> > 
> > 
> > 
> > Ted
> > 
> > 
> > On Wed, 2003-11-05 at 15:39, Antony Stone wrote:
> > > On Wednesday 05 November 2003 8:19 pm, Leandro Takashi Hirano wrote:
> > > 
> > > > Thanks Antony...
> > > >
> > > > Do you have a script or something where I can find protection rules?
> > > 
> > > You tell us what protection you want and we can suggest some rules to do it.
> > > 
> > > There's no single "magic ruleset" for netfilter / iptables which "protects 
> > > your network", otherwise every distribution would include it as standard.
> > > 
> > > It depends what you want to do.
> > > 
> > > A good starting point is:
> > > 
> > > iptables -P INPUT DROP
> > > iptables -P OUTPUT DROP
> > > iptables -P FORWARD DROP
> > > iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> > > iptables -A FORWARD -i $intIF -o $extIF -j ACCEPT
> > > 
> > > That will allow nothing in or out of the firewall machine itself, and will 
> > > allow all access from your internal network to the Internet, blocking 
> > > everything except reply packets from the Internet to your network.
> > > 
> > > I do not recommend that you simply implement the above rules before you 
> > > understand what they are designed to do.
> > > 
> > > Check Oskar Andreasson's excellent tutorial for more information about this 
> > > sort of configuration, or any of the other documentation at 
> > > http://www.netfilter.org
> > > 
> > > Antony.
> > 
> > 


