From: =?UTF-8?Q?J=c3=bcrgen_Schmidt?= <abcdmail@freenet.de>
Subject: Strange behavior of conntrack helper sip: rules do not always match
 as expected
Date: Wed, 18 May 2016 20:21:03 +0200
Message-ID: <573CB28F.8060004@freenet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello!

Given is an Asterisk server running on a Linux 3.10.101 machine with a
global IP address (-> no NAT).

The following rules are given:


INPUT
=3D=3D=3D=3D=3D

# SIP
iptables \
-A INPUT -i ppp0 -p udp -s 217.0.18.0/23 \
-d 217.232.238.65 --sport 5060 --dport 5060 -m conntrack \
--ctstate RELATED,ESTABLISHED -j ACCEPT

# RTP
iptables \
-A INPUT -i ppp0 -p udp -s 217.0.0.0/13 -d 217.232.238.65 \
--dport 11500:12000 -m conntrack --ctstate RELATED,ESTABLISHED \
-m helper --helper sip -j ACCEPT



OUTPUT
=3D=3D=3D=3D=3D=3D

# SIP
iptables -A OUTPUT -p udp -o ppp0 -s 217.232.238.65 -d 217.0.18.0/23 \
--dport 5060 --sport 5060 -j ACCEPT

# RTP
iptables -A OUTPUT -p udp -o ppp0 -s 217.232.238.65 -d 217.0.0.0/13
--sport 11500:12000 -m conntrack --ctstate RELATED,ESTABLISHED \
-m helper --helper sip -j ACCEPT



This configuration works pretty fine as long as there is no ringgroup
defined in Asterisk / FreePBX, which contains an *outbound* phone
number. If the ringgroup contains an outbound phone number, the
following problem happens, if the incoming call is accepted *locally*:

- Asterisk stops the signaling to the outbound phone through the trunk.
- Asterisk gives the call to the local phone.


Now the problem:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All RTP packages between provider and Asterisk trunk are now blocked in
both directions by netfilter.

To get it working again, these two additional rules are necessary for
RTP handling *without* sip helper (but otherwise mostly the same as the
RTP rules above besides slightly different states):

iptables -I INPUT -i ppp0 -p udp -s 217.0.0.0/13 -d 217.232.238.65
--dport 11500:12000 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT

iptables -A OUTPUT -p udp -o ppp0 -s 217.232.238.65 -d 217.0.0.0/13 \
--sport 11500:12000 -m conntrack --ctstate ESTABLISHED -j ACCEPT


Analyzing w/ conntrack -E didn't show any abnormality - the relevant an=
d
correct rules have been generated - but obviously aren't matched by the
standard rules w/ helper sip any more although the rules would have bee=
n
completely suited. I too tested the sip helper rules using all states
NEW,RELATED,ESTABLISHED - this doesn't match, too.


Do you have any idea about what's going on there?


Thanks for any hint,
kind regards,
J=C3=BCrgen
