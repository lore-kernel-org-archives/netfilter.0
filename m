From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: RE: [Users] Samba and IPsec
Date: Tue, 10 Feb 2004 13:09:00 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1076436540.2018.44.camel@ca.gts.nexusmgmt.com>
References: <000e01c3efff$664f2e30$7600a8c0@Barry>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000e01c3efff$664f2e30$7600a8c0@Barry>
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
To: barry.brosnihan@sunmarkproduce.com
Cc: netfilter@lists.netfilter.org

Very good point! There are two ways around the dynamic addressing.  The
simple and less secure way is to assume that if someone is authorized to
establish a tunnel, they can access any resource on the network.  In
that case, you can merely identify valid packets as arriving on an ipsec
interface and dispense with identifying the user by ip address.

We take a very different approach on the ISCS project.  We want to allow
Joe user different access in the tunnel than Joe administrator.  Thus,
we want to distinguish between different users.  To that end, we have a
little bash script that is called out of the updown o/f swan script.  It
examines the DER_ASN.1_ID passed during IKE (thanks to Andreas Steffen
and his team for exposing this information in the X.509 patch), compares
it to a list of group memberships based upon possible values for the
fields in the ID, and dynamically creates the iptables rules for the
user's current address.  When the user ends their session, the rules are
deleted.  The scripts need to be revised to also check the CA's
identity.  They are available in the CVS of the ISCS project at
http://sourceforge.net/projects.iscs 

It all depends on how much security is reasonable for the environment. 
Good luck - John

On Tue, 2004-02-10 at 12:57, barry.brosnihan@sunmarkproduce.com wrote:
> Would I put 0.0.0.0 for a roadwarrior with a non-static ip?
> 
> 
> -----Original Message-----
> From: John A. Sullivan III [mailto:john.sullivan@nexusmgmt.com] 
> Sent: 10 February 2004 17:48
> To: barry.brosnihan@sunmarkproduce.com
> Subject: RE: [Users] Samba and IPsec
> 
> Perhaps I misunderstand your topology.  10.1.1.6 in the example would be
> the Samba server to which you are trying to connect.
> 
> The example I gave would be appropriate to a gateway between two
> networks.  If, on the other extreme, we are connecting a public road
> warrior to a standalone Samba server running O/F S/WAN, the rule might
> look something like:
> iptables -A INPUT -s 35.87.99.3 -i ipsec0 -d 133.65.8.33 -p 17 --dport
> 138 -m state --state NEW -j ACCEPT
> where 35.87.99.3 is the road warrior and 133.65.8.33 is the Samba
> server.
> 
> On Tue, 2004-02-10 at 12:14, barry.brosnihan@sunmarkproduce.com wrote:
> > Is 10.1.1.6 the client? I am connecting through a PPP connection. 
> >  
> > 
> > 
> > -----Original Message-----
> > From: John A. Sullivan III [mailto:john.sullivan@nexusmgmt.com] 
> > Sent: 10 February 2004 17:00
> > To: barry.brosnihan@sunmarkproduce.com
> > Cc: users@mj2.freeswan.org
> > Subject: Re: [Users] Samba and IPsec
> > 
> > On Tue, 2004-02-10 at 11:22, barry.brosnihan@sunmarkproduce.com wrote:
> > > I know how to open the ports normaly like, but I am not sure how to
> > open
> > > them just for the IPSEC side? 
> > >  
> > > 
> > > 
> > > 
> > >  -----Original Message-----
> > > From: users-owner@mj2.freeswan.org
> > [mailto:users-owner@mj2.freeswan.org]
> > > On Behalf Of Reinhold Plew
> > > Sent: 10 February 2004 15:46
> > > To: users@mj2.freeswan.org
> > > Subject: Re: [Users] Samba and IPsec
> > > 
> > > Hi,
> > > 
> > > barry.brosnihan@sunmarkproduce.com schrieb:
> > > 
> > > > I know this question has been asked many time's but I have never
> > ever
> > > > come aross an answer that has actually. I have a Freeswan server
> > being
> > > > connected to by a OpenSSh client. The client can connect fine but
> > they
> > > > are unable to connect to any of my Samba share's. I can ping the
> > box's
> > > > and telnet them and ssh into them. I have heard that I need to
> open
> > > > ports 137-139tcp/udp for the ipsec only. Is this right and how do
> I
> > do
> > > > it?
> > > 
> > > yes, thats right. afaik you need to open port 445 too
> > > 
> > <snip>
> > You can make your iptables rule apply to the ipsec interface only,
> e.g.,
> > iptables -A FORWARD -i ipsec0 -s 192.168.4.0/24 -d 10.1.1.6 -p 17
> > --dport 138 -m state --state NEW -j ACCEPT
> > 
> > I think the FWBuilder GUI (http://www.fwbuilder.org) now supports
> > opens/wan but I'm not sure.  That would make configuration easier.
> When
> > ISCS is finished, it will make configuring such communications much
> > easier.
> > 
> > There are some slideshows about using opens/wan and iptables together
> at
> > http://iscs.sourceforge.net Good luck - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com


