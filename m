From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IP Spoofing
Date: Fri, 7 Nov 2003 12:32:24 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311071232.hA7CWSj14670@agate.rockstone.co.uk>
References: <60197.200.180.160.84.1068060676.squirrel@www.alcidesmaya.com.br> <200311052039.hA5KdYr13351@agate.rockstone.co.uk> <1068208010.29753.10.camel@tarkus>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1068208010.29753.10.camel@tarkus>
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
To: Lista de Mail netfilter <netfilter@lists.netfilter.org>

On Friday 07 November 2003 12:26 pm, Ted Kaczmarek wrote:

> I would add an input established on that as well, makes it easier to do
> upgrades.
>
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

If you do that, you need to add some OUTPUT rules as well to specify what 
traffic you are happy to allow out from the firewall machine itself.

DNS is almost certain to be necessary, anything else depends on how you do 
your upgrades etc (ssh, cvs, rsync, http....)

Antony.

> On Wed, 2003-11-05 at 15:39, Antony Stone wrote:
> > On Wednesday 05 November 2003 8:19 pm, Leandro Takashi Hirano wrote:
> > > Thanks Antony...
> > >
> > > Do you have a script or something where I can find protection rules?
> >
> > You tell us what protection you want and we can suggest some rules to do
> > it.
> >
> > There's no single "magic ruleset" for netfilter / iptables which
> > "protects your network", otherwise every distribution would include it as
> > standard.
> >
> > It depends what you want to do.
> >
> > A good starting point is:
> >
> > iptables -P INPUT DROP
> > iptables -P OUTPUT DROP
> > iptables -P FORWARD DROP
> > iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> > iptables -A FORWARD -i $intIF -o $extIF -j ACCEPT
> >
> > That will allow nothing in or out of the firewall machine itself, and
> > will allow all access from your internal network to the Internet,
> > blocking everything except reply packets from the Internet to your
> > network.
> >
> > I do not recommend that you simply implement the above rules before you
> > understand what they are designed to do.
> >
> > Check Oskar Andreasson's excellent tutorial for more information about
> > this sort of configuration, or any of the other documentation at
> > http://www.netfilter.org
> >
> > Antony.

-- 

The truth is rarely pure, and never simple.

 - Oscar Wilde
                                                     Please reply to the list;
                                                           please don't CC me.

