From: Philip Prindeville <philipp_subx@redfish-solutions.com>
Subject: More nf_conntrack_sip questions (resending to netfilter)
Date: Thu, 04 Dec 2008 14:25:46 -0800
Message-ID: <493858EA.9050904@redfish-solutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I did a little investigation into my one-way voice issue, and noticed
that if I don't do voice-menus (i.e. where the Asterisk box itself
generates the first outbound INVITE, then passes-through the 2nd INVITE
once a handset picks up) then I get two-way voice (i.e. with sending the
call directly to the phone).  (In this topology, my Asterisk box is also
my firewall/NATting router...)

If I enable the voice menus in the inbound dialplan, however, it can
hear the voice menus, but not the called-party when they pick up their
phone (extension).

So someone (either the SIP conntrack module on the Asterisk border
firewall or else the SBC at the ILEC) is failing to look into the 2nd
INVITE (i.e. we're not rewriting it properly as it goes by, or the SBC
is failing to see it).

I've put traces up on ftp://ftp.redfish-solutions.com/ as:

trace-20081128-230313.br0
trace-20081128-230313.br1
trace-20081128-230415.br0
trace-20081128-230415.br1

The traces on interface "br1" are the "internal" network, with private
192.168.1.x addresses.  The "br0" traces are after outbound NATting (and
conntrack rewriting) has been applied.

This was done on a Linux 2.6.25.19 box with iptables v1.4.2.

Thanks,

-Philip


