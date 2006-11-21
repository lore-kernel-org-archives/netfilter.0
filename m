From: "Tim Edwards" <t.edwards@tideway.com>
Subject: RE: (no subject)
Date: Tue, 21 Nov 2006 10:44:47 -0000
Message-ID: <B81183566FF73947875C3A207CD60AA6027C72AC@LONEX01.tideway.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org



-----Original Message-----
From: Bernd Petrovitsch [mailto:bernd@firmix.at]=20
Sent: 21 November 2006 10:13
To: Tim Edwards
Cc: netfilter@lists.netfilter.org
Subject: Re: (no subject)

> Yes. Just insert such a rule into the OUTPUT chain.

Ok I have the following rules but it still isn't cutting off existing
connections:

#!/bin/bash

# First clear all rules (and set the policy to DROP on the default
chains)
iptables -F
# Second delete all the extra (user-defined) chains
iptables -X
# Set polcy on the default chains
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
# allow anything over loopback
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
# Allow incoming ssh and http/s connections
iptables -A INPUT -p tcp -m tcp -m multiport --dports 22,80,443 -j
ACCEPT
iptables -A INPUT -j LOG --log-prefix=3D"INPUT REJECT" =
--log-level=3Dinfo
iptables -A INPUT -j REJECT
# Allow already established ssh and http/s connections back out through
the firewall
iptables -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -j LOG --log-prefix=3D"OUTPUT REJECT" =
--log-level=3Dinfo
iptables -A OUTPUT -j REJECT
iptables -A FORWARD -j LOG --log-prefix=3D"FORWARD REJECT"
--log-level=3Dinfo
iptables -A FORWARD -j REJECT


This email and any attachment may contain confidential, privileged =
information for the sole use of the intended recipient. If you are not =
the intended recipient, do not disclose, reproduce, disseminate or =
otherwise use this communication. If you received this communication in =
error, please immediately notify the sender via email and delete the =
communication from your system.

