From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Squid Accelerator configuration
Date: Tue, 20 Jul 2004 13:35:42 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90511CC@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Jim Matthews <jim.matthews@notes.duke.edu>, netfilter@lists.netfilter.org

-A OUTPUT -p tcp --syn -s 192.168.1.1 --sport 1024: -d 192.168.1.5 =
--dport 80 -j ACCEPT

-j

-----Original Message-----
From: Jim Matthews [mailto:jim.matthews@notes.duke.edu]
Sent: Thursday, July 15, 2004 10:46 AM
To: netfilter@lists.netfilter.org
Subject: Squid Accelerator configuration


Hi

We have a backend web server.  To off-load some of the load from the=20
backend server, we have a Squid server in front.=20

I am having an issue with my iptables configuration on my Squid box.=20
Everything works correctly when I disable the firewall (no good), so I'm =

having problems with my rules on the Squid server.  I want to configure=20
the systems so that:

-On Squid-
-allow all requests from Internet to port 80
-allow all requests from WWW box to/from port 80

-On WWW-
-allow all forwarded requests to/from Squid Box to port 80
-do not allow requests from Internet to port 80

Has anyone setup something similar?  Any suggestions or pointers on how =
to=20
configure this?

Here is the ruleset I'm using on my Squid box:

# Squid
# These rules are to allow testing from the internal network - the first =

two rules are for the Squid port
-A INPUT -s 192.168.1.0/24 -p tcp -m tcp --sport 1024: --dport squid -m=20
state --state NEW,ESTABLISHED -j ACCEPT
-A OUTPUT -s 192.168.1.0/24 -p tcp -m tcp --sport squid -m state --state =

ESTABLISHED -j ACCEPT

# These two rules are for the http port
-A INPUT -s 192.168.1.0/24 -p tcp -m tcp --sport 1024: --dport http -m=20
state --state NEW,ESTABLISHED -j ACCEPT
-A OUTPUT -s 192.168.1.0/24 -p tcp -m tcp --sport http -m state --state=20
ESTABLISHED -j ACCEPT

# These two rules should cover the forwarding of connections for the=20
backend WWW server
-A FORWARD -s 0/0 -d 192.168.1.5 -p TCP --sport 1024:65535 --dport 80 -j =

ACCEPT
-A FORWARD -d 0/0 -s 192.168.1.5 -p TCP -m state --state ESTABLISHED -j=20
ACCEPT

Any help you could give would be greatly appreciated.  Thanks.

Thanks.
---------------------
Jim Matthews=20
ISS Systems Administrator=20
Duke University - Perkins Library
Box 90196
Durham, NC 27708
Email: jim.matthews@duke.edu
Voice: 919-660-5963
Fax: 919-684-6990

