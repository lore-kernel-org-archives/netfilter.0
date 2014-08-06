From: Cormac Long <cormac.long@openmindnetworks.com>
Subject: conntrack issue with SIP SDP
Date: Wed, 6 Aug 2014 15:30:38 +0100
Message-ID: <CA+A7gQY+ygtrre77VDpXVAzM_bw3699mbhmCOiUBBV_3mFsCQw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Folks,
   I'm trying to expose an RCS IMS Core from our internal LAN to
external users using NAT.

I'm getting an issue when we go to relay a 200 OK with SDP out to the
Internet client.

The iptables does change the details of the SDP in the 200 OK from our
internal IP but substitutes an invalid IP address.

So the INVITE came in and routed end to end through the Core and RCS
AS. The receiving phone gave back its 200 OK with its SDP and that
then trickled back to the SBC which issued the last 200 OK intended
for the inviting RCS client..

This is the SDP the SBC sends..
v=0
o=OpenmindAccess 1407332491 1407332491 IN IP4 192.168.116.50
s=-
c=IN IP4 192.168.116.50
t=0 0
m=message 20122 TCP/MSRP *
a=path:msrp://192.168.116.2:2855/03ed0082;tcp
a=accept-types:application/im-iscomposing+xml message/cpim
a=accept-wrapped-types:message/imdn+xml text/plain
application/vnd.gsma.rcspushlocation+xml
application/vnd.gsma.rcs-ft-http+xml
a=sendrecv
a=setup:passive

So the above SDP is informing the client to connect to 192.168.116.50
on port 20122. This is the internal LAN address for the SBC and its
own media steering NAT for the MSRP chat.

The SDP we then send to the client is

v=0
o=OpenmindAccess 1407332491 1407332491 IN IP4 245.43.0.0
s=-
c=IN IP4 245.43.0.0
t=0 0
m=message 20122 TCP/MSRP *
a=path:msrp://192.168.116.2:2855/03ed0082;tcp
a=accept-types:application/im-iscomposing+xml message/cpim
a=accept-wrapped-types:message/imdn+xml text/plain
application/vnd.gsma.rcspushlocation+xml
application/vnd.gsma.rcs-ft-http+xml
a=sendrecv
a=setup:passive

We see the o= and c= fields have their IP address changed to 245.43.0.0

These should have been changed to 83.71.xxx.xxx (can't disclose here)

That substitution of 245.43.0.0 is just totally wrong and I'm stumped
as to why it is happening.

Has anyone ever noticed this kind of behavior?

I've installed contrack-tools and have used the contrack -E and -L
options to list activity and existing tracking but nowhere can I see
it indicate using this dodgy IP address. I can see the SIP
registrations fine for the external clients but nothing else.

Hopefully someone will have an idea.

Regards,
    Cormac

Cormac Long
Lead Engineer, Innovative Business Unit
Openmind Networks
www.openmindnetworks.com

-- 
 <http://www.golgi.io/>
<https://www.linkedin.com/company/openmind-networks?trk=fc_badge>   
<https://twitter.com/Openmind_Ntwks>   <http://openmindnetworks.com>
