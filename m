From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Is there a good web-based netfilter admin tool anywhere?
Date: Mon, 02 Aug 2004 10:22:36 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1091456555.5209.42.camel@localhost>
References: <F96BD609-E2F8-11D8-8316-000A95C62BFA@hotmail.com>
	 <1091442066.5213.23.camel@localhost>
	 <200408020845.58687.JALaramie@Loudoun-Fairfax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200408020845.58687.JALaramie@Loudoun-Fairfax.com>
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
To: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Cc: netfilter@lists.netfilter.org

On Mon, 2004-08-02 at 08:45, Jeffrey Laramie wrote:
> On Monday 02 August 2004 06:21, John A. Sullivan III wrote:
> > On Sat, 2004-07-31 at 09:53, Todd Landfried wrote:
> > > Can anyone recommend a good web-based netfilter admin tool? I'm looking
> > > for something that can guide someone through the process of building
> > > rules.
> > >
> > > Thnx
> > >
> > > Todd
> >
> > There may be some web based tools out there.  I have never used on.
> > Perhaps Webmin has a module. 
> 
> There is a Webmin iptables module and it seems to work fine. The only issue I 
> have with it is that like all Webmin modules it's very slow to refresh over 
> most connections, especially when you need to scroll though many pages of 
> rules. I prefer editing my own scripts since It's faster and I can comment my 
> rules as needed, but the Webmin module is pretty nice and easy to use.
> 
> Note to John: I have a request for ISCS. I'm sure you already have this but it 
> would be great if the ISCS rule interface had a field for the name of the 
> service on that port and/or a brief description (i.e. "ftp", "Reject MyDoom", 
> etc.) instead of just the port numbers. That's really helpful if you ever 
> need to enable/disable certain services later.
> 
> Jeff
Ah, but that's exactly the point :-)  There is no rule configurator in
ISCS and that is the heart of ISCS's efficiency and the reason why the
unlearning curve for ISCS is probably steeper than the learning curve!
One never, ever makes a rule such as "give the subnet 192.168.223.0/24
from any port access to ftp on 10.1.1.5".

Instead, one says something like "give Executive access to Financial
Data".  Executive might be defined as a particular IP address range, the
combination of fields in an X.509 cert, a SecureID token or an Active
Directory ID any combination thereof (plus other forms of
authentication).  Financial Data might be defined as NetBIOS on
WinServer1 and ftp on Data1 and http on Web1 and http on Web2 and telnet
to Legacy1 and CustomAppSocket on LOBServer.  One single policy
automatically creates and distributes all the rules necessary for every
needed combination to make that security policy a reality on the
specific platforms in the environment.

If one then needs to add a new Samba server named Samba1 for Executive
use, one merely adds NetBIOS on Samba1 to the FinancialData group.  One
does not even make a new policy - just add the service to the group. 
The rules are now automatically made for every possible means of
identifying the Executive group members (and any other groups and their
descendants which might have access to FinancialData) and distributed to
the enforcement points in a rule set with the proper syntax for that
physical device.  That might be 70 rules giving 10,000 people access
through 1000 gateways but it only took one drag and drop operation.

The policies do have user editable comment fields.  Hope this helps
explain a little but of what is so extraordinary about ISCS.  Take care
- John
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


