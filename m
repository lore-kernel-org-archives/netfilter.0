From: "Greg Scott" <GregScott@Infrasupport.com>
Subject: RE: Bizarre NAT behavior
Date: Thu, 23 Jun 2011 11:28:02 -0500
Message-ID: <925A849792280C4E80C5461017A4B8A2A04055@mail733.InfraSupportEtc.com>
References: <925A849792280C4E80C5461017A4B8A2A03FEB@mail733.InfraSupportEtc.com> <925A849792280C4E80C5461017A4B8A2A0404D@mail733.InfraSupportEtc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> Why would NATing in both PREROUTING and POSTROUTING
> work  **only**  when I watch it with tcpdump and not work otherwise?

I should be more clear.  The problem is with internal users looking at
internally hosted web and ftp sites using the public IP Addresses.  The
way you do this is, DNAT the packet in PREROUTING and then MASQUERADE
the packet in POSTROUTING.  The technique is documented in a howto
someplace and I've been doing it for several years at several sites.  

At this particular site, all worked fine until I replaced the old
firewall with a new one.  Now it only works properly when I watch the
conversation the tcpdump.  I'm not making this up.

- Greg Scott
