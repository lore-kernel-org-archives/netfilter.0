From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Weird TCP flags?
Date: Fri, 12 Dec 2003 09:50:51 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071240651.1891.71.camel@jasiiitosh.nexusmgmt.com>
References: <003101c3c065$f61ad790$13fea8c0@melita.com>
	 <003c01c3c0b1$dd2b6960$b2c2a70a@melita.com>
	 <1071235889.1890.47.camel@jasiiitosh.nexusmgmt.com>
	 <200312121359.27728.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312121359.27728.Antony@Soft-Solutions.co.uk>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

On Fri, 2003-12-12 at 08:59, Antony Stone wrote:
> On Friday 12 December 2003 1:32 pm, John A. Sullivan III wrote:
> 
> > > > The SYN packet will be sent to your web server and the web server will
> > > > respond with a SYN, ACK packet but it will not be related to anything
> > > > in the conntrack table.  The connection may be being allowed by a more
> > > > general rule than one to the web services.
> > > >
> > > > So, I suppose we should ask what your ACCEPT rules look like - John
> > >
> > > I'm absolutely doing that -- here are the relevant ACCEPTs:
> > >
> > > iptables -A FORWARD -i ppp0 -o eth1 -p tcp --dport 80 -d 192.168.254.242
> > > -j ACCEPT
> > > iptables -t nat -A PREROUTING -i ppp0 -d <my.public.ip.here> -p tcp
> > > --dport 80 -j DNAT --to-destination 192.168.254.242
> > >
> > > If I want to forward port 80 to that box, isn't that the way to do it? 
> > > How would a connection escape conntrack?
> 
> > You never told it to make an entry in conntrack.  Try this:
> > iptables -A FORWARD -i ppp0 -o eth1 -p tcp --dport 80 -d 192.168.254.242
> > -m state --state NEW -j ACCEPT
> 
> I disagree with this.
> 
> Making the rule more explicit by matching state NEW is not a bad idea, but it 
> has nothing to do with whether a conntrack table entry gets created or not.   
> If you have compiled in connection tracking, or loaded the module, then all 
> connections which are ACCEPTed will result in a conntrack table entry.   
> There's no way to stop that happening on a connection-by-connection basis.
> 
> Antony.
I'm sure you know better than I.  I always assumed that NEW was
necessary before ESTABLISHED and RELATED were meaningful but I have
never cracked open the netfilter code to confirm that assumption.  Thank
you for the correction - John
PS - what, then, is the purpose of NEW? Is it just for identifying new
connections for some other purpose than access control such as logging?
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


