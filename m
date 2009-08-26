From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: SIP conntrack defeating Asterisk canreinvite
Date: Tue, 25 Aug 2009 21:04:28 -0400
Message-ID: <1251248668.6450.59.camel@jaspav.missionsit.net.missionsit.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello, all.  Since implementing an iptables firewall between the
Asterisk PBX and several SIP phones, the Asterisk PBX ability to
"reinvite", i.e., to redirect the media stream from passing through the
PBX to be directly between the phones has been broken even when the
phones are on the same network (i.e., no firewall between the phones).
We've been beating our heads against the wall thinking it was the
complex rule set but it appears the issue is ip_conntrack_sip.

Before I drop another day into verifying this, may I ask if anyone else
has had a similar problem and found a solution?

The reinvite works by the Asterisk server sending a SIP invite after the
call has been set up. The new invite contains the address of the phone
in the SDP portion of the packet rather than the address of the PBX.
This should redirect the media stream to flow directly between the
phones.  However, it appears conntrack is rewriting the SDP so that the
address is reverted to the PBX address.

Here are the relevant SDP portion of a reinvite captured on the PBX
using tcpdump and displayed in Wireshark.  The PBX is at 172.x.x.8 and
the phone is at 10.x.x.193:

Owner/Creator, Session Id (o): root 1417450700 1417450701 IN IP4
10.68.6.183
Owner Address: 10.68.6.183
Connection Information (c): IN IP4 10.68.6.183
Connection Address: 10.68.6.183

Here is a similar sequence but captured from the phone itself:
Owner/Creator, Session Id (o): root 595629021 595629022 IN IP4
172.30.14.8
Owner Address: 172.30.14.8
Connection Information (c): IN IP4 172.30.14.8
Connection Address: 172.30.14.8

It would appear conntrack is incorrectly "fixed" the packet.

I noticed newer kernels have sip_direct_media and sip_direct_signalling
options.  I don't know if those apply but they do not seem to be present
in our CentOS 5.3 kernel.

I'll probably spend most of tomorrow confirming this hypothesis and
investigating solutions so I'd be deeply appreciative for any
time-saving advice.  Thanks - John

-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

http://www.spiritualoutreach.com
Making Christianity intelligible to secular society

