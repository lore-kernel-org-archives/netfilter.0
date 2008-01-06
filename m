From: "TJ Harris" <tjharris@weaselworkz.com>
Subject: Conntrack and ICMP
Date: Sat, 5 Jan 2008 21:15:32 -0500
Message-ID: <179880ee0801051815u74f7acdvbdd01354ab35887d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I am using conntrack to get network session & accounting data.  It
works well for TCP and UDP traffic.  But, I'm wondering if there is
some way to tune the ICMP behavior.

As it is working for me now, I get a NEW event for every ICMP echo
request packet.    Since many people leave 'ping' running
continuously, those session logs can pile up.

Many firewalls treat ICMP like UDP, where if another packet is seen
within the timeout period, it's considered part of the same session.
 Is there any way to tune conntrack to behave like that?  So, if
someone leaves ping going all night, it results in a single session
entry, rather than thousands?
