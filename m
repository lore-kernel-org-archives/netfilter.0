From: Sanjay Arora <skpobox@hotpop.com>
Subject: Re: What is best protection for RDBMS backend of web-server in DMZ
Date: 23 Aug 2004 17:16:05 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1093261565.4341.60.camel@Sewak.Asr.Lan>
References: <1093189392.16081.24.camel@Sewak.Asr.Lan>
	 <1093228616.2025.41.camel@localhost>
Reply-To: skpobox@hotpop.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1093228616.2025.41.camel@localhost>
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
Cc: john.sullivan@nexusmgmt.com

On Mon, 2004-08-23 at 08:06, John A. Sullivan III wrote:

> I take it from your need to synchronize that the portion of the DB
> needed for public access is needed by the rest of the internal
> application.  Thus, complete separate is not possible.  If you put the
> bifurcated DB on the DMZ, you must allow the DB to penetrate the
> firewall to get to the Internal network and if you place the DB on the
> internal network, you must provide a firewall hole for the Web front end
> to talk to the DB.

That is correct.

>   I also take it from your point a shoestring budget
> that very secure environments such as placing the Web front end, public
> DB and internal DB all on separate networks is not an option.
No..I meant that I dont have resources to buy expensive closed source
licences. The public portion of the DB is small. Also, is restricted to
new registrations & edits, therefore will not require much resources
unless my site is very successful in what I mean to do. So I can put a
Pentium III type machine, on a separate segment with a cross cable or a
hub and an additional card in web-server maybe or maybe put an
additional machine as firewall between the two.

Tell me, does it make a difference if the DB server & the firewall
protecting it from the DMZ are on the same machine or a different one
with minimalist setup?

> Given that, I would suggest that you place the Web Server in a firewall
> protected DMZ which only allows the Internet access needed to run the
> web application (obviously admins from the internal network will have
> greater access) and place the DB for the web front end on the private
> network (preferably in its own firewalled network but that is an extra
> expense).
No as said above, I can afford to spare a small machine...I like that
;-)

> I would not put the public DB in the DMZ despite Antony's usually
> outstanding advice to do so.  My thinking is that the DMZ is still
> vulnerable and web servers in a DMZ particularly so.  If a user is able
> to compromise the web server on the DMZ, they may have free reign on the
> DMZ and can get to any service on the DB.  From there, they can do
> whatever they want to the DB.  One could argue that if they compromise
> the DB on the internal network, that they would likewise have free reign
> of the internal network, an even worse scenario, but, one way or the
> other, you must expose your internal network - either to the Web server
> or the the synchronizing DB.  In other words, if I have the web server
> and the public DB in the DMZ, there is a chance a compromised web server
> will give full access to the DB and the DB can be used to gain access to
> the internal DB.  If I have the web server in the DMZ and the public DB
> on the private network, if they crack the web server they do not have
> free reign of the public DB but they may still be able to get to the
> internal network through the DB.  Either way they may be able to get to
> the internal network but the former option seems a little safer. 
> Someone please correct me if I am wrong.
Hmmm...that essentially means that I redesign my application (still in
System Analysis stage) not to synchronise the databases using triggers
or something similar initiated by the DMZ and work out a design that
causes the DB to push out updates in xml files, which are then
transferred to the main db in the green network using sftp, scp, ssh or
email whose sessions are initiated by the green network, I should be
fairly secured.

This batch processing approach would also allow me to check the data for
SQL Injection risks, if they do crash the dmz db...maybe there is some
way to check if the dmz db is not crashed by sql injection attacks
before the batch is processed by the green db server. Antony, Thanks for
the tip. But I guess I have to learn a lot about SQL injection before I
do that ;-(

> There is a very effective poor man's technique you can use to add an
> extra layer of protection to the public DB.  Either on the DB server or
> on the firewall, alter the TTL to go no further than the DMZ.  This way,
> if someone does crack the web front end and uses the web front end to
> crack the public DB and tries to dump the public DB data to some
> Internet site, the packets will die when they leave the DMZ.  For
> example, if the DB is on the internal network and the web server is one
> hop away on the DMZ, set the TTL to 2.  It will decrement to 1 on the
> DMZ and if it tries to go across the Internet, the ISP's router will get
> the packet with a TTL of 1 and discard it as expired.  Of course, this
> means that one cannot cruise the Internet from the DB server.  That
> might not be a bad problem to have :-)
> 

Thats a very nice idea. I will definitely do that alongwith putting the
DB server in additional firewall layer.

> We like to do this on the firewall in the ISCS project
> (http://iscs.sourceforge.net) There, when one configures a server or a
> resource on that server, one has the option to set the public TTL.  This
> can be seen in the Resources screen shots on the ISCS web site.  One
> merely sets the value and ISCS automatically creates the mangle table
> rules to change the TTL for any packets headed out over the Internet.
> 

John, I checked out your isca project...seemed a nice effort, but I did not see any download links for alpha/pre-alpha downloads. What stage is it in?

I remember coming across such a software with similar policy oriented, lower layer neutral approach. But I think it was already released...though dont remember the name..Anyone?

Can anyone suggest some tools for managing multi-stage firewalling and snort like sensors for monitoring...something like firewalling each server for services it does not provide and the ip ranges it is supposed to provide it for...and monitoring the whole thing ;-)

I am glad that I use open source...otherwise thinking the cost of licences with such an approach would be bankruptive ;-))

With best regards.
Sanjay.



