From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: NAT question (forwarding with subdomains)
Date: Thu, 13 May 2004 16:06:02 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405131606.02858.Alistair@nerdnet.ca>
References: <20040513172702.17791.51996.Mailman@vishnu.netfilter.org> <55621.200.107.22.222.1084470741.squirrel@www.easyteck.com> <1084472223.28188.33.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1084472223.28188.33.camel@localhost>
Content-Disposition: inline
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

On May 13, 2004 02:17 pm, John A. Sullivan III wrote:
> On Thu, 2004-05-13 at 13:52, Paul F. Bernal B. - EasyTeck wrote:
> > Hi!,
> >
> > I got an internal 192.168.0.0/24 LAN with about 5 web servers including
> > the one which has iptables running and internet output ...
> >
> > in the firewall script:
> > * INTERNALIF="eth1"
> > * INTERNALNET="192.168.0.0/24"
> > * INTERNALBCAST="192.168.0.255"
> > * EXTERNALIF="eth0"
> > * MYADDR="200.107.XXX.XXX"
> >
> > got a rule that works fine that forwards the mail packets to the
> > 192.168.0.2 machine:
> > $IPTABLES -A PREROUTING -t nat -i $EXTERNALIF -p tcp -d $MYADDR --dport
> > 25 \ -j DNAT --to 192.168.0.2:25
> > $IPTABLES -A FORWARD -i $EXTERNALIF -p tcp -d 192.168.0.2 --dport 25 -j
> > ACCEPT
> >
> > I have a couple subdomains pointing to MYADDR sub1.mydomain.com,
> > sub2.mydomain.com, etc...
> >
> > What I need to do is:
> >
> > When someone in the Internet asks for http://sub1.mydomain.com/ respons
> > the 192.168.0.3 machine (wich has a web server running port 80)
> >
> > When someone in the Internet asks for http://sub2.mydomain.com/ responds
> > the 192.168.0.4 machine (wich has a web server running port 80)
> >
> > etc., etc., etc...
> >
> > I've tried something like this, but doesn't works !!!
> >
> > $IPTABLES -A PREROUTING -t nat -i $EXTERNALIF -p tcp -d sub1.mydomain.com
> > --dport 80 \
> >                       -j DNAT --to 192.168.0.3:80
> > $IPTABLES -A FORWARD -i $EXTERNALIF -p tcp -d 192.168.0.3 --dport 80 -j
> > ACCEPT
> >
> > Pliz give me a hand on this, thanks in advance ...
> >
> > ----------
> > don pool
>
> If I understand you correctly, sub1.mydomain.com and sub2.mydomain.com
> both point to the same public address even though you want them to map
> to different internal servers.  Publicly, they are only distinguished by
> url and not IP.  Is that correct?
>
> If so, iptables will resolve the names to IP addresses when it loads.
>
> >From then on, it will use the IP address to identify the destination and
>
> not the url.  If you want to NAT on the url, you will need some
> functionality to read the url from the data portion of the packet and
> not the IP portion.  I do not know if there is a iptables patch
> available to do that or how such a patch would be used.  Does anyone
> else know?


	Antony is right in this case, especially since there *might* already be a 
webserver running on the firewall ... apache can forward the url requests to 
the appropriate physical hardware ... not something that one wants to do with 
string match since packet fragments will cause *huge* problems (a la POST 
method) 

	This will require *some* sort of proxy -- apache can do this itself, or there 
are a couple of other products that can do this ... but I'd recommend apache 
cache/forward/acceleration methods ...

	Please note  -- I haven't done this recently, but last I tried it didn't 
require forward rules, it required rules in INPUT and OUTPUT since apache 
(local) is actually issuing the request to apache (internal) -- they aren't 
reallly being forwarded by iptables.

	Alistair.

