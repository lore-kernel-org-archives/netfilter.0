From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: REJECTing: How and When to use What type of reply.
Date: Thu, 11 Sep 2003 15:08:47 -0700
Sender: lartc-admin@mailman.ds9a.nl
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E2F@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <lartc-admin@mailman.ds9a.nl>
content-class: urn:content-classes:message
Errors-To: lartc-admin@mailman.ds9a.nl
List-Help: <mailto:lartc-request@mailman.ds9a.nl?subject=help>
List-Post: <mailto:lartc@mailman.ds9a.nl>
List-Subscribe: <http://mailman.ds9a.nl/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://mailman.ds9a.nl/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=unsubscribe>
List-Archive: <http://mailman.ds9a.nl/pipermail/lartc/>
Content-Type: text/plain; charset="us-ascii"
To: Mike Mestnik <cheako911@yahoo.com>, SomeServer Lartc <lartc@mailman.ds9a.nl>
Cc: netfilter@lists.netfilter.org

################# Original Message:

For this thread I'd like to FOCUS on rejecting bad traffic and not on
dropping.  The first case I'd like to discuss is where all but a handful
of public web sites are allowed for ought going connections.  A typical
NAT setup is used where all the users sit behind a firewall, some have
full access to the Internet but most have restricted access.  I'd also
like to bring in other minds into the discussion, and not have it be a
linux only problem.

Here is the big deal.  A web page like www.nasdaq.com is considered
valid, so traffic to it's IP 208.249.117.71 is ACCEPTed.  However this
site pulles content from an unknown group of other sites, unfortunately
not ACCEPTed.  In the mean time untill all the sites can be added it's
not proper to simply DROP these SYN packets.  This is where this
concerns EVERYONE, the client software needs to get the right REJECT
from the firewall.  Now How and When to use What type of reply becomes a
big deal.

I'd like to open this discussion up to every one who has 2 cents and/or
another good use of REJECT vs DROP.  For my setup I have winblows
computers running both IE and Netscape behind a generic firewall
*Blush*.  The two types of REJECTs I have tested are "TCP RST" and ICMP
(Port Unreachable), are there any others?

This thread may be moved to another list where appropriate.



################# My 2 Cents:

There are a few different ICMP rejections like admin,port,host,network,
or something along those lines.

As for blocking sites linked off a root site, I have brainstormed a few
possible ideas.


1. Web site driven

Have the hosing domain publish a list of linked against servers. This
requires the server in question to do all the leg work in making sure
all the valid links from their site is valid. Any missed by the site
wouldn't be reachable from restricted environments. It also makes access
to subsets of a larger site easier to accomplish since all content is
not added to the accept list by default.

Once the web site publishes their valid links off their site, someone
would need to write a firewall interface tool which scans these web site
lists and opens up access to those affiliated sites based on the admin's
policies.

Pros:
-Simple, hands off administration once the service is configured

Cons:
-Web site administrators have the onus of keeping these lists up to date
-Local administrator is granting the web site administrator powers over
their firewall that may not be desirable
-May be difficult to implement
-Requires web site admin's support

2. Web crawler driven

The second approach does not involve the target web site operators at
all, so it is more feasible to set up something like this if you aren't
in association with the sites you are allowing into yours.=20

The idea is to use a simple web crawler to grab all the links that are
found on the target web site, and present them in a logical way for the
local administrator to make a clear decision as to which affiliated
sites they do and which sites they do not want through their firewall.

Just like the previous solution, something has to load the gathered
sites into the firewall.

Pros:
-Gives expected results

Cons:
-Requires more work for the administrator to filter the returned list
-May not work on sites that don't play nice to web crawlers
-May be difficult to implement

3. Referred only

A simple approach only allows one level of association in that as long
as the originating site is in the referral entry of the http request,
the connection is granted. This requires an iptables module or maybe the
'string' patch which isn't 100% reliable, but may be good enough.

Pros:
-Trivial implementation
Cons:
-Does not allow for sub-navigating into other allowable web sites
-Process heavy string searching when many sites are included in the
allow list

Are there any opinions from those of you in the Netfilter ML?

_______________________________________________
LARTC mailing list / LARTC@mailman.ds9a.nl
http://mailman.ds9a.nl/mailman/listinfo/lartc HOWTO: http://lartc.org/
