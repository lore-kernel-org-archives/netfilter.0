From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: What is best protection for RDBMS backend of web-server in DMZ
Date: Sun, 22 Aug 2004 22:36:57 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1093228616.2025.41.camel@localhost>
References: <1093189392.16081.24.camel@Sewak.Asr.Lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1093189392.16081.24.camel@Sewak.Asr.Lan>
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
To: skpobox@hotpop.com
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Sun, 2004-08-22 at 11:43, Sanjay Arora wrote:
> Hi all
> 
> What are the issues involved in securing a RDBMS that is serving a
> web-server in DMZ. RDBMS is postgreSQL, OS is Linux, Webserver is
> Apache.
> 
> Application is CRM, Customer Registration/Editing is the main part
> that interacts with the web, Rest of the CRM application works in the
> Green subnet protected by an iptables firewall, specicically IPcop v.
> 1.3 presently. 
> 
> Should I bifurcate the DB and put the registration part in DMZ or
> should I put a copy of the registration part in DMZ and sync it
> periodically with the main DB. Or should I keep full DB on the Green
> Network & create a pinhole to access the RDBMS from the Green subnet,
> maybe in some kind of ssh tunnel. Any other ideas unknown to me that
> may be workable?
> 
> Can some one point me to resources that discuss these issues. Also, I
> would like the experienced people to please comment on pros & cons of
> various methodologies and pointers to security literature/checklists
> for Web-server/RDBMS security issues, especially on a shoestring
> budget with netfilter, linux & other open source tools. Please touch
> on various subjects like monitoring, recovery etc., so as to give me
> broad idea of scope of my research and pointers to resources.
> 
> With best regards and thanks in advance.
> Sanjay.
I take it from your need to synchronize that the portion of the DB
needed for public access is needed by the rest of the internal
application.  Thus, complete separate is not possible.  If you put the
bifurcated DB on the DMZ, you must allow the DB to penetrate the
firewall to get to the Internal network and if you place the DB on the
internal network, you must provide a firewall hole for the Web front end
to talk to the DB.  I also take it from your point a shoestring budget
that very secure environments such as placing the Web front end, public
DB and internal DB all on separate networks is not an option.

Given that, I would suggest that you place the Web Server in a firewall
protected DMZ which only allows the Internet access needed to run the
web application (obviously admins from the internal network will have
greater access) and place the DB for the web front end on the private
network (preferably in its own firewalled network but that is an extra
expense).

I would not put the public DB in the DMZ despite Antony's usually
outstanding advice to do so.  My thinking is that the DMZ is still
vulnerable and web servers in a DMZ particularly so.  If a user is able
to compromise the web server on the DMZ, they may have free reign on the
DMZ and can get to any service on the DB.  From there, they can do
whatever they want to the DB.  One could argue that if they compromise
the DB on the internal network, that they would likewise have free reign
of the internal network, an even worse scenario, but, one way or the
other, you must expose your internal network - either to the Web server
or the the synchronizing DB.  In other words, if I have the web server
and the public DB in the DMZ, there is a chance a compromised web server
will give full access to the DB and the DB can be used to gain access to
the internal DB.  If I have the web server in the DMZ and the public DB
on the private network, if they crack the web server they do not have
free reign of the public DB but they may still be able to get to the
internal network through the DB.  Either way they may be able to get to
the internal network but the former option seems a little safer. 
Someone please correct me if I am wrong.

There is a very effective poor man's technique you can use to add an
extra layer of protection to the public DB.  Either on the DB server or
on the firewall, alter the TTL to go no further than the DMZ.  This way,
if someone does crack the web front end and uses the web front end to
crack the public DB and tries to dump the public DB data to some
Internet site, the packets will die when they leave the DMZ.  For
example, if the DB is on the internal network and the web server is one
hop away on the DMZ, set the TTL to 2.  It will decrement to 1 on the
DMZ and if it tries to go across the Internet, the ISP's router will get
the packet with a TTL of 1 and discard it as expired.  Of course, this
means that one cannot cruise the Internet from the DB server.  That
might not be a bad problem to have :-)

We like to do this on the firewall in the ISCS project
(http://iscs.sourceforge.net) There, when one configures a server or a
resource on that server, one has the option to set the public TTL.  This
can be seen in the Resources screen shots on the ISCS web site.  One
merely sets the value and ISCS automatically creates the mangle table
rules to change the TTL for any packets headed out over the Internet.

Hope this helps - John  
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com


