From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Squid Accelerator configuration
Date: Tue, 20 Jul 2004 16:40:30 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90511D1@asimail2.alphanumeric.com>
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
To: Jim Matthews <jim.matthews@notes.duke.edu>
Cc: netfilter@lists.netfilter.org

i think i have it straight in my head now.  let's start over, 'cause i =
think this has gotten unneccessarily complicated.  my understanding is =
that you want to:

(a) allow internal clients (192.168.1.0/24) to access a squid proxy on =
192.168.1.1 (port 3128?)
(b) allow the squid proxy on 192.168.1.1 to fetch content from a web =
server on 192.168.1.5 and serve cached content to those clients on =
192.168.1.0/24
(c) allow clients from elsewhere (the internet) to access the web server =
directly

*IF* that's the case--here are the _relevant_ rules to accomplish the =
above (i've now switched them to the "j" style of writing rules):

# first things first--allow all established replies
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# allow 192.168.1.0/24 to squid proxy
-A INPUT -p tcp --syn -s 192.168.1.0/24 --sport 1024:65535 \
  -d 192.168.1.1 --dport 3128 -m state --state NEW -j ACCEPT

#allow squid proxy to go fetch content from backend web server
-A OUTPUT -p tcp --syn -s 192.168.1.1 --sport 1024:65535 \
  -d 192.168.1.5 --dport 80 -m state --state NEW -j ACCEPT

# allow forwarding of requests (from anywhere) to fetch content from the =
web server
-A FORWARD -p tcp --syn --sport 1024:65535 \
  -d 192.168.1.5 --dport 80 -m state --state NEW -j ACCEPT

if i've lost my mind somewhere along the way--please nudge me back to =
reality.

-j

-----Original Message-----
From: Jim Matthews [mailto:jim.matthews@notes.duke.edu]
Sent: Tuesday, July 20, 2004 3:50 PM
To: Jason Opperisano
Cc: netfilter@lists.netfilter.org
Subject: RE: Squid Accelerator configuration


Jason

No problem, thanks for helping.=20

My rules are all whacked out now, I'm sure.  Here's what I have:

# Squid
# These rules are to allow testing from the internal network - the first =

two rules are for the Squid ports
-A INPUT -s 192.168.1.0/24 -p tcp -m tcp --sport 1024: --dport squid -m=20
state --state NEW,ESTABLISHED,RELATED -j ACCEPT
-A OUTPUT -s 192.168.1.0/24 -p tcp -m tcp --sport squid -m state --state =

ESTABLISHED,RELATED -j ACCEPT
# accept 113 connections
-A INPUT -p tcp -m tcp --sport 113 -m state --state ESTABLISHED,RELATED =
-j=20
ACCEPT
-A OUTPUT -p tcp -m tcp --dport 113 -m state --state=20
NEW,ESTABLISHED,RELATED -j ACCEPT

# These two rules are for the http port
-A INPUT -s 192.168.1.0/24 -p tcp -m tcp --sport 1024: --dport http -m=20
state --state NEW,ESTABLISHED,RELATED -j ACCEPT
-A OUTPUT -s 192.168.1.0/24 -p tcp -m tcp --sport http -m state --state=20
ESTABLISHED,RELATED -j ACCEPT
-A OUTPUT -p tcp --syn -s 192.168.1.1 --sport 1024: -d 192.168.1.5 =
--dport=20
80 -j ACCEPT

# These two rules should cover teh forwarding of connections for the=20
backend WWW server
-A FORWARD -s 0/0 -d 192.168.1.5 -p TCP --sport 1024:65535 --dport 80 -j =

ACCEPT
-A FORWARD -d 0/0 -s 192.168.1.5 -p TCP -m state --state=20
NEW,ESTABLISHED,RELATED -j ACCEPT

It sortof works now.  I can access pages that have been cached on the=20
Squid box, but if I need a page that isn't cached, I never get it.=20

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



"Jason Opperisano" <Jopperisano@alphanumeric.com>=20
07/20/2004 02:03 PM

To
"Jim Matthews" <jim.matthews@notes.duke.edu>
cc
<netfilter@lists.netfilter.org>
Subject
RE: Squid Accelerator configuration






didn't mean to be terse...

what the logs are saying to me is this:  i am dropping a TCP packet with =

flags A,P,F in my OUTPUT chain from 192.168.1.1:80 to 192.168.1.15:3582

do you have something along the lines of:

                 "-A OUTPUT -m state --state ESTABLISHED,RELATED -j=20
ACCEPT"
                 "-A INPUT -m state --state ESTABLISHED,RELATED -j =
ACCEPT"

at the top of your INPUT and OUTPUT chains?

it appears to me that your rules are not properly allowing replies from=20
the Squid box back to the client machine.

-j

-----Original Message-----
From: Jim Matthews [mailto:jim.matthews@notes.duke.edu]
Sent: Tuesday, July 20, 2004 1:55 PM
To: Jason Opperisano
Subject: RE: Squid Accelerator configuration


Jason

Thanks for the response.  I'm not sure I understand what this line is=20
doing.  Should I be replacing any of my entries with this line or=20
appending this line?  I tried adding the line (I added it below my other =
2=20

http rules) and it's still not connecting.=20

192.168.1.1 - Squidbox
192.168.1.15 - Client


Jul 20 13:51:39 squidbox kernel: drop-n-log:IN=3D OUT=3Deth0 =
SRC=3D192.168.1.1=20
DST=3D192.168.1.15 LEN=3D1499 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D0 DF =
PROTO=3DTCP=20
SPT=3D80 DPT=3D3582 WINDOW=3D6432 RES=3D0x00 ACK PSH FIN URGP=3D0=20
Jul 20 13:51:39 squidbox kernel: drop-n-log:IN=3D OUT=3Deth0 =
SRC=3D192.168.1.1=20
DST=3D192.168.1.15 LEN=3D1499 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D0 DF =
PROTO=3DTCP=20
SPT=3D80 DPT=3D3583 WINDOW=3D6432 RES=3D0x00 ACK PSH FIN URGP=3D0=20
Jul 20 13:51:39 squidbox kernel: drop-n-log:IN=3D OUT=3Deth0 =
SRC=3D192.168.1.1=20
DST=3D192.168.1.15 LEN=3D1499 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D0 DF =
PROTO=3DTCP=20
SPT=3D80 DPT=3D3584 WINDOW=3D6432 RES=3D0x00 ACK PSH FIN URGP=3D0=20
Jul 20 13:51:46 squidbox kernel: drop-n-log:IN=3D OUT=3Deth0 =
SRC=3D192.168.1.1=20
DST=3D192.168.1.15 LEN=3D1499 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D38915 =
DF PROTO=3DTCP=20
SPT=3D80 DPT=3D3577 WINDOW=3D6432 RES=3D0x00 ACK PSH FIN URGP=3D0=20
Jul 20 13:51:48 squidbox kernel: drop-n-log:IN=3D OUT=3Deth0 =
SRC=3D192.168.1.1=20
DST=3D192.168.1.15 LEN=3D1152 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D38915 =
DF PROTO=3DTCP=20
SPT=3D80 DPT=3D3578 WINDOW=3D6432 RES=3D0x00 ACK PSH FIN URGP=3D0=20
Jul 20 13:51:49 squidbox kernel: drop-n-log:IN=3D OUT=3Deth0 =
SRC=3D192.168.1.1=20
DST=3D192.168.1.15 LEN=3D1499 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D0 DF =
PROTO=3DTCP=20
SPT=3D80 DPT=3D3579 WINDOW=3D6432 RES=3D0x00 ACK PSH FIN URGP=3D0=20
Jul 20 13:51:50 squidbox kernel: drop-n-log:IN=3D OUT=3Deth0 =
SRC=3D192.168.1.1=20
DST=3D192.168.1.15 LEN=3D1499 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D0 DF =
PROTO=3DTCP=20
SPT=3D80 DPT=3D3580 WINDOW=3D6432 RES=3D0x00 ACK PSH FIN URGP=3D0=20
Jul 20 13:51:50 squidbox kernel: drop-n-log:IN=3D OUT=3Deth0 =
SRC=3D192.168.1.1=20
DST=3D192.168.1.15 LEN=3D1499 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D19532 =
DF PROTO=3DTCP=20
SPT=3D80 DPT=3D3581 WINDOW=3D6432 RES=3D0x00 ACK PSH FIN URGP=3D0=20
Jul 20 13:51:51 squidbox kernel: drop-n-log:IN=3D OUT=3Deth0 =
SRC=3D192.168.1.1=20
DST=3D192.168.1.15 LEN=3D1499 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D0 DF =
PROTO=3DTCP=20
SPT=3D80 DPT=3D3582 WINDOW=3D6432 RES=3D0x00 ACK PSH FIN URGP=3D0=20
Jul 20 13:51:51 squidbox kernel: drop-n-log:IN=3D OUT=3Deth0 =
SRC=3D192.168.1.1=20
DST=3D192.168.1.15 LEN=3D1499 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D0 DF =
PROTO=3DTCP=20
SPT=3D80 DPT=3D3583 WINDOW=3D6432 RES=3D0x00 ACK PSH FIN URGP=3D0=20
Jul 20 13:51:51 squidbox kernel: drop-n-log:IN=3D OUT=3Deth0 =
SRC=3D192.168.1.1=20
DST=3D192.168.1.15 LEN=3D1499 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D0 DF =
PROTO=3DTCP=20
SPT=3D80 DPT=3D3584 WINDOW=3D6432 RES=3D0x00 ACK PSH FIN URGP=3D0=20
Jul 20 13:51:54 squidbox52 kernel: drop-n-log:IN=3D OUT=3Deth0 =
SRC=3D192.168.1.1=20

DST=3D192.168.1.15 LEN=3D1485 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D38915 =
DF PROTO=3DTCP=20
SPT=3D80 DPT=3D3576 WINDOW=3D10720 RES=3D0x00 ACK PSH FIN URGP=3D0=20

Thanks again for your help and any additional help you could provide.
---------------------
Jim Matthews=20
ISS Systems Administrator=20
Duke University - Perkins Library
Box 90196
Durham, NC 27708
Email: jim.matthews@duke.edu
Voice: 919-660-5963
Fax: 919-684-6990



"Jason Opperisano" <Jopperisano@alphanumeric.com>=20
07/20/2004 01:35 PM

To
"Jim Matthews" <jim.matthews@notes.duke.edu>,=20
<netfilter@lists.netfilter.org>
cc

Subject
RE: Squid Accelerator configuration






-A OUTPUT -p tcp --syn -s 192.168.1.1 --sport 1024: -d 192.168.1.5 =
--dport=20

80 -j ACCEPT

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





