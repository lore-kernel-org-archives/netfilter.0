From: "Hildebrand, Brian" <BrianHildebrand@universalcomputersys.com>
Subject: RE: Order in ruleset edition
Date: Wed, 26 Nov 2003 13:16:26 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D8FBABA1EF6F2E4DBCC88903F60691F3023F1584@houxchsvr.ucscorp.ucs.pvt>
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
To: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

We do parallel updates to prevent attacks from sneaking through. =
Basically you have the real forward chain and you add a rule to it that =
jumps to a user defined rule FORWARD_0 where the filtering rules are =
actually located. You then load the new rules into FORWARD_1. Once those =
rules are loaded you change the jump from FORWARD_0 to FORWARD_1 and =
then remove FORWARD_0. You make sure the default forward policy is to =
deny so that those packets for the millisecond or two the firewall is =
not setup won't get through. It works very well, although I have heard =
this technique can take a little bit longer with huge rulesets (but =
nowhere near as long as a straight ruleset install after a flush).=20

-----Original Message-----
From: William Stearns [mailto:wstearns@pobox.com]
Sent: Wednesday, November 26, 2003 12:59
To: Alejandro Cabrera Obed
Cc: Netfilter lista (iptables); William Stearns
Subject: Re: Order in ruleset edition

Good afternoon, Alejandro,

On Wed, 26 Nov 2003, Alejandro Cabrera Obed wrote:

> I'm trying to construct my own ruleset of iptables; I'm editing a file
> script.
>
> My question is the following:
>
> Is there any order about CHAINS and TABLES that I have to follow in =
order to
> construct my iptables ruleset ??? For example, is it the same if =
firstly I
> write in my script my the FORWARD rules and then the OUTPUT and INPUT =
rules
> or viceversa ???

        There isn't a difference in the final outcome, no.

        However, unless you're blocking all traffic until the firewall =
is
completely constructed, the second and third chains you construct will =
be
left unprotected longer (on the order of 1-5 seconds or so).  It's a =
minor
consideration, but I've seen an attack that sneaked through a firewall =
as
it was being reloaded.
        Cheers,
        - Bill

-------------------------------------------------------------------------=
--
        "Don't say you don't have enough time.  You have exactly the
same number of hours per day that were given to Helen Keller, Pasteur,
Michaelangelo, Mother Teresa, Leonardo da Vinci, Thomas Jefferson, and
Albert Einstein."
        -- H. Jackson Brown
(Courtesy of <drow@visi.com>)
-------------------------------------------------------------------------=
-
William Stearns (wstearns@pobox.com).  Mason, Buildkernel, freedups, =
p0f,
rsync-backup, ssh-keyinstall, dns-check, more at:   =
http://www.stearns.org
Linux articles at:                         =
http://www.opensourcedigest.com
-------------------------------------------------------------------------=
-


----------------------------------------
The information transmitted in this message is intended only for the =
person or entity to whom it is addressed and may contain confidential =
and/or privileged material.  Any review, retransmission, dissemination =
or other use of, or taking of any action in reliance upon this =
information by persons or entities other than the intended recipient is =
prohibited.  If you received this in error, please contact the sender =
and destroy any copies of this document.

