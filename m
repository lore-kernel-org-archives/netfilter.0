From: "Hildebrand, Brian" <BrianHildebrand@universalcomputersys.com>
Subject: RE: Order in ruleset edition
Date: Wed, 26 Nov 2003 13:34:03 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D8FBABA1EF6F2E4DBCC88903F60691F3023F158E@houxchsvr.ucscorp.ucs.pvt>
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
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solutti.com.br>, "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

It is acceptable, but it creates a significant amount of downtime. =
Uptime is important on our network so this solution minimizes the amount =
of time the network is unavailable. I have had rulesets in the past that =
would take 5-10 minutes to upload and install because they were so =
large. That is a long time for any number of people to lose Internet =
access.

-----Original Message-----
From: Leonardo Rodrigues Magalh=E3es [mailto:leolistas@solutti.com.br]
Sent: Wednesday, November 26, 2003 14:27
To: Hildebrand, Brian; Netfilter (E-mail)
Subject: Re: Order in ruleset edition


    To prevent problems during a firewall reload/restart, I usually do:

    1) do 'echo 0 > /proc/sys/net/ipv4/ip_forward' on the very beggining =
of
the script
    2) define the default actions to drop on the very first rules ( -P
DROP )
    3) insert ALL the rules (can take some seconds)
    4) do 'echo 1 > /proc/sys/net/ipv4/ip_forward'
    5) firewall is READY

    What do you think on this ?

    Sincerily,
    Leonardo Rodrigues

----------------------------------------
The information transmitted in this message is intended only for the =
person or entity to whom it is addressed and may contain confidential =
and/or privileged material.  Any review, retransmission, dissemination =
or other use of, or taking of any action in reliance upon this =
information by persons or entities other than the intended recipient is =
prohibited.  If you received this in error, please contact the sender =
and destroy any copies of this document.

