From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Netfilter and Squid
Date: Tue, 27 Jan 2004 14:17:15 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075231035.1889.95.camel@jasiiitosh.nexusmgmt.com>
References: <5.2.1.1.0.20040127093418.029803f0@mail.cybercorpinc.com>
	 <5.2.1.1.0.20040127093418.029803f0@mail.cybercorpinc.com>
	 <5.2.1.1.0.20040127105001.00b60650@mail.cybercorpinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.2.1.1.0.20040127105001.00b60650@mail.cybercorpinc.com>
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
To: Glen Spidal <glens@cybercorpinc.com>
Cc: netfilter@lists.netfilter.org

My apologies that I don't have the time to go into detail as I'm up to
my eyeballs working on the ISCS project which will eventually do all of
this for you (http://iscs.sourceforge.net).  In a nutshell you would:

Set the firewall/proxy as the default gateway for whatever it protects,
i.e., if the students are directly connected to it, it is their default
gateway.  If the students are behind any number of routers, their router
is the default gateway and the firewall is the default gateway of the
router.

The firewall/proxy uses the ISP's router as the default gateway.

The FORWARD, INPUT and OUTPUT chains of the filter table all use a DENY
Policy so that they drop any traffic that is not explicitly allowed.

The PREROUTING chain of the nat table has a rule that matches all http
traffic coming in off the protected interfaces and jumps it to the
REDIRECT target and the squid port, e.g., 
iptables -t nat -I PREROUTING 1 -i eth1 -p 6 --dport 80 -j REDIRECT
--to-ports 3128
I believe you will also need to allow this traffic to pass on the lo
interface so that the netfilter and squid can talk to each other.  You
will also need to allow the squid process on the firewall to send and
receive http and dns on the INPUT and OUTPUT chains

The POSTROUTING chain of the nat table does NAPT (Port Address
Translation) for any internal addresses sending traffic out the public
firewall interface so that they can access Internet resources with a
usable public address.

The FORWARD chain of the filter table accepts all -m state --state
RELATED,ESTABLISHED traffic
The FORWARD chain of the filter table allows all outbound traffic that
you want to allow, e.g., 
iptables -A FORWARD -i eth1 -o eth0 -p 6 --dport 25 -m state --state NEW
-j ACCEPT

You may want to consider using a GUI configurator to make this easier. 
ISCS is extremely powerful and is targeted towards large, frequently
changing environments but has not yet been released.  In the meantime,
products like fwbuilder (www.fwbuilder.org) or ipcop (www.ipcop.org)
will probably do just fine.  You may also want to take a tour through
Oskar Andreasson's excellent tutorial.  You can find a link to it on the
netfilter site  Good luck - John



On Tue, 2004-01-27 at 13:52, Glen Spidal wrote:
> I found these two how-to's for Dan's Guardian and Squid, But since I'm new 
> to IPTables, I still don't understand how to allow the mail ports 
> through.  I do know that I don't have a default route set up.
> 
> http://www.nyetwork.org/wiki/DansGuardian
> http://dansguardian.org/downloads/DGandTransparent.txt
> 
> 
> At 12:54 PM 1/27/2004 -0500, you wrote:
> >On Tue, 2004-01-27 at 12:41, Glen Spidal wrote:
> > > Hello all,
> > >
> > > I have the following setup:
> > >
> > > Internet->PublicIP_Router->Cross-over-cable->Squid_Server->LAN
> > >
> > > Squid works fine as does Dans' Guardian web filter.  MY question is 
> > what do
> > > I need to do to route web traffic through squid and allow email traffic to
> > > flow around Squid?  Currently, client-based email (Outlook and Entourage)
> > > does not work because there is no route.  I must make sure that all LAN
> > > clients go through squid since it is a school.
> > >
> > > I've looked through the how-to's but have not found specific examples and
> > > syntax.
> ><snip>
> >I usually set Squid up as a transparent proxy, i.e., I use the REDIRECT
> >iptables target to redirect any Internet bound traffic on port 80 to
> >port 3128 on the same server (and thus to Squid) whereas all other
> >traffic just obeys the normal iptables rules - John
> >--
> >John A. Sullivan III
> >Chief Technology Officer
> >Nexus Management
> >+1 207-985-7880
> >john.sullivan@nexusmgmt.com
> >---
> >If you are interested in helping to develop a GPL enterprise class
> >VPN/Firewall/Security device management console, please visit
> >http://iscs.sourceforge.net
> 
> Glen Spidal
> Cybercorp Computers
> Hillsboro, OR 97123
> PH: 503-681-9786  -- FX: 503-615-2936
> glens@cybercorpinc.com  -- www.cybercorpinc.com
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com


