From: karl@klxsystems.net
Subject: Mangling TOS, or Precedence/SecurityOpts/Compartment?
Date: Fri, 28 Oct 2005 15:58:45 -0700 (PDT)
Message-ID: <4882.67.100.94.26.1130540347.squirrel@www.klxsystems.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

Hi there,

We are running a set of three systems for semiconductor technology, and
would like to finalize our work in getting them to interoperate properly,
but have run into some issues that touch on the very fabric of TCP/IP
expertise, but iptables has already been used to solve "part of this",
read on:

The three systems consist of:
System #1:
Chip fabrication =93tool=94 running std. TCP Server, using port 5000

System #2:
Controller machine,  running standard TCP Client, using port 5000

System #3:
=93Invisible=94 Analysis machine running Fedora Core 4, and analysis softwa=
re

To see the drawing:
http://www.klxsystems.net/pics/Analysis.html

The Tool Server=94 and the =93Controller Machine=94 typically only communic=
ate
with one another over a standard tcp connection, in single mode.

For the purposes of analysis, a third =93Invisible=94 Analysis machine is
placed between Systems #1 and 2, and is cabled as shown in Figure 1, it
has two Ethernet ports, and in general acts like a =93bridge=94 in that it
possesses a =93Bypass Card=94, which allows the Tool Server and the Control=
ler
Machine to pass traffic through it=92s two Ethernet ports.

One of the features of the Bypass card it contains, is that it physically
shunts the copper Ethernet connections together when, say, power is cut.

It runs in an =93unshunted=94 format when conducting =93Analysis=94, and sh=
unts
the copper back together when it =93hangs up=94  It=92s purpose is to sit
BETWEEN the Tool and Controller machines, and intercept data they are
exchanging, for analysis used to effect better performance, and then =93hang
up=94 by shunting the connection, and thus allowing the two main machines
(Tool/Controller) to keep =93talking=94 as they were prior to the =93analys=
is=94
machine intervening.

Our problem:

We need to seamlessly start and stop the second TCP Client connection the
Analysis machine =93invisibly=94 creates/ terminates.

The issue has been one of TCP/IP sequence numbers, =93how to get them to
stay the same=94, and not =93drop=94 the connection per RFC 798.  Using dsn=
iff
or other sequence number guessing isn=92t an option.  What we did do however
was use:

iptables =96A POSTROUTING =96t nat =96d <dest_ip> -s <source_ip> -p tcp =96=
j SNAT
=96to-source <source_ip>

This allowed a change of the source ip address of the packets going from
the analysis machine towards the tool server.

We tried to change the =93precedence=94 field by using the:

iptables =96A POSTROUTING =96t mangle =96d <dest_ip> -s <source_ip> -p tcp
=96set-tos 32

-but this did not take in the command line, =93TOS value not valid=94.

So our question is, how do we get the Analysis machine to invisibly
connect, and disconnect, without violating RFC 798?

There are several RFC=92s that point to Differentiated Service field
manipulations, using tools like iproute2, but those never went into ways
to actually MODIFY the =93Precedence, Security Option, and/or Compartment=94
fields in an IP header from what we could tell.

The RFC that led us to this information stated:

With the advent of DiffServ, intermediate nodes may modify the
Differentiated Services Codepoint (DSCP) [RFC2474] of the IP header to
indicate the desired Per-hop Behavior (PHB) [RFC2475, RFC2597,
RFC2598]. The DSCP includes the three bits formerly known as the
precedence field.  Because any modification to those three bits will be
considered illegal by endpoints that are precedence-aware, they may cause
failures in establishing connections, or may cause
established connections to be reset.

Any suggestions if iproute, iptables, or other technologies would
facilitate this complex type of transaction?

We understand that modifying the TOS can be done at the application level,
as stated by RFC 2873, but these other fields, it=92s still vague as to what
we can utilize.

-karlski




