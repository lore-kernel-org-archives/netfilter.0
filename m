From: "Hildebrand, Brian" <BrianHildebrand@universalcomputersys.com>
Subject: RE: Order in ruleset edition
Date: Wed, 26 Nov 2003 12:53:38 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D8FBABA1EF6F2E4DBCC88903F60691F3023F157E@houxchsvr.ucscorp.ucs.pvt>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: "Netfilter lista (iptables)" <netfilter@lists.netfilter.org>

It does not matter if you put rules for different chains amongst each =
other. You do not have to enter all of the forward rules first and then =
all of the input rules, etc. The order of the rules within the chain =
does matter. Obviously it makes it easier to read if you group the rules =
by which chain they are going into, so it isn't a bad idea.=20

-----Original Message-----
From: Alejandro Cabrera Obed [mailto:sisdis@tournet.com.ar]
Sent: Wednesday, November 26, 2003 12:41
To: Netfilter lista (iptables)
Subject: Order in ruleset edition

Hi !!!
I'm trying to construct my own ruleset of iptables; I'm editing a file
script.

My question is the following:

Is there any order about CHAINS and TABLES that I have to follow in =
order to
construct my iptables ruleset ??? For example, is it the same if firstly =
I
write in my script my the FORWARD rules and then the OUTPUT and INPUT =
rules
or viceversa ???

Thanks a lot and regards !!!

Alejandro.


----------------------------------------
The information transmitted in this message is intended only for the =
person or entity to whom it is addressed and may contain confidential =
and/or privileged material.  Any review, retransmission, dissemination =
or other use of, or taking of any action in reliance upon this =
information by persons or entities other than the intended recipient is =
prohibited.  If you received this in error, please contact the sender =
and destroy any copies of this document.

