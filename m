From: "Greg Scott" <GregScott@Infrasupport.com>
Subject: RE: Bizarre NAT behavior
Date: Thu, 23 Jun 2011 10:17:07 -0500
Message-ID: <925A849792280C4E80C5461017A4B8A2A0404D@mail733.InfraSupportEtc.com>
References: <925A849792280C4E80C5461017A4B8A2A03FEB@mail733.InfraSupportEtc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Wow, more than a week later and silence from everyone - am I on my own
with this problem?  Why would NATing in both PREROUTING and POSTROUTING
work  **only**  when I watch it with tcpdump and not work otherwise?
Surely I can't be the only one seeing this problem?

- Greg Scott



-----Original Message-----
From: netfilter-owner@vger.kernel.org
[mailto:netfilter-owner@vger.kernel.org] On Behalf Of Greg Scott
Sent: Tuesday, June 14, 2011 9:04 PM
To: netfilter@vger.kernel.org
Cc: Lynn Hanson; Joe Whalen
Subject: Bizarre NAT behavior

I ran into a bizarre NAT problem recently.  I have a firewall with eth0
and eth1 bridged using device br0.  This site hosts a few publicly
visible web and ftp sites.  These are all accessible across the Internet
as they should be. 

For internal users accessing these sites using public IP Addresses, I
MASQUERADE the request and also DNAT it. This has worked for several
years - but broke recently when I put in a firewall upgrade using kernel
2.6.35.6-48.fc14.i686.PAE.  Identical ruleset from the old and new, just
a newer kernel with Fedora 14.  

Here's the really weird part - it all works when I watch it with
tcpdump.  The website has a public IP Address (obfuscated here) of
1.2.115.121.  This NATs to private IP Address 192.168.10.8.  When a user
in the 192.168.10.nnn subnet tries to access the website at its public
IP Address, nothing happens.  But when I do this:

[root@ehac-fw2011 ~]# /usr/sbin/tcpdump -i br0 host 1.2.115.151 -nn

Now that user can see the website.  This works for a few minutes after I
terminate tcpdump until the TCP connection goes away.  I can reproduce
the problem at will - am I looking a kernel bug?  How weird is that when
the problem stops when I watch the packets.  Some kind of timing glitch?

Thanks

- Greg Scott


--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
