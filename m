From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: question about the order of the rules of iptables
Date: Thu, 08 Sep 2005 14:07:38 -0400
Message-ID: <1126202858.3060.9.camel@localhost>
References: <20050908170918.59371.qmail@web60411.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050908170918.59371.qmail@web60411.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Will Kuhn <willkuhn76@yahoo.com>
Cc: netfilter@lists.netfilter.org

Rob's post was quite good advice.  This seems a bit unnecessary.
Wouldn't one perhaps redirect to your anti-spam process and then have
your anti-spam process forward the mail (as a new IP packet) to the mail
gateway? - John

On Thu, 2005-09-08 at 10:09 -0700, Will Kuhn wrote:
> Hi John, Thanks for your reply. Actually I need to
> clarify.
> 
> In my config, I have an anti-spam process running on
> the linux gateway and listening on port 1025. My
> intention is to have the linux gateway filter out all
> the junks.
> 
> I intend to have the linux box first modify the Dest
> ip and forwarded it the local anti-spam process for
> spam checking. After that, the anti-spam process will
> forward the clean mail to the mail server since the ip
> address has already been modified. 
> 
> Will that intention in mind, will my iptables rules
> still work ? If not, how should I design my iptables
> rules ?
> 
> Thanks, Will
> 
> Local Mail server ---- e0 linux gateway e1 ----
> internet
> 
> Local Mail server ip: 10.1.1.100
> the anti spam mail proxy running on the linux gateway.
> 
> 
> 
> --- "John A. Sullivan III"
> <jsullivan@opensourcedevel.com> wrote:
> 
> > On Thu, 2005-09-08 at 05:01 -0700, Will Kuhn wrote:
> > > Will the order of the following two rules make any
> > > difference in the outcome ? I personally feel that
> > it
> > > should not. Can anyone confirm ?
> > > 
> > > My intention is to have the incoming mails first
> > > checked by the local anti-spam process listening
> > at
> > > port 1025 before being forwarded to the local mail
> > > server. 10.1.1.100 is a private ip address of the
> > > local mail server.
> > > 
> > > Local Mail server ----- [eth0] LinuxBOX [eth1]
> > ----
> > > internet
> > > 
> > > iptables -t nat -A PREROUTING -i eth1 -p tcp
> > --dport
> > > 25 -j DNAT --to 10.1.1.100
> > > 
> > > iptables -t nat -A PREROUTING -i eth1 -p tcp
> > --dport
> > > 25 -j REDIRECT --to-port 1025
> > > 
> > <snip>
> > That may depend on what you want to do.  First, if I
> > recall properly
> > (and I may not), REDIRECT sends the packet to port
> > 1025 on interface lo,
> > i.e., to the local machine.  It is not used for
> > changing the port.  That
> > may be what you want.  If you really want to change
> > the port but not
> > redirect the packet to the local computer, use the
> > port parameter on
> > DNAT, e.g., --to-destination 10.1.1.100:1025.
> > 
> > Second, I believe packets stop traversing a chain
> > once they have been
> > matched with the DNAT target (I'm not sure about
> > REDIRECT).  Thus, a
> > packet matching rule #1 in your order would never
> > see rule #2.
> > 
> > I'm fetching this out of somewhat distant memory so,
> > if someone knows
> > better, please correct me - John
> > -- 
> > John A. Sullivan III
> > Open Source Development Corporation
> > +1 207-985-7880
> > jsullivan@opensourcedevel.com
> > 
> > If you would like to participate in the development
> > of an open source
> > enterprise class network security management system,
> > please visit
> > http://iscs.sourceforge.net
> > 
> > 
> 
> 
> 
> 	
> 		
> ______________________________________________________
> Click here to donate to the Hurricane Katrina relief effort.
> http://store.yahoo.com/redcross-donate3/
> 
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


