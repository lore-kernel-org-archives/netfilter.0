From: Nicholas Couchman <nick.couchman@yahoo.com>
Subject: Re: Windows/NetBIOS & SNAT
Date: Wed, 9 Sep 2009 07:35:34 -0700 (PDT)
Message-ID: <952994.89264.qm@web33405.mail.mud.yahoo.com>
References: <651562.95010.qm@web33406.mail.mud.yahoo.com> <4AA62E6A.4030501@chello.at> <185948.38077.qm@web33403.mail.mud.yahoo.com> <4AA7B8D0.8020202@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1252506934; bh=grgYIp9I7+jNINpSY90ef4FK0/D2BFBI1BJICgTWkK8=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:References:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type; b=ftqJhukdx7kfQwJAxRIwuOeylxX9IkEvUezqJ+K1YvrbEy0C7g3d09hAJVYee2ySCDWCbk2ovj11eGgRDMdBSmCC7zfqI1WmfPHqauIT/zy2jef+mBSKA6gXnud+UahANdTSrF/KRO6KOR/MTlbKtBmiQ6lLbJp9bxjx7tJNgBw=
In-Reply-To: <4AA7B8D0.8020202@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

> > 
> > Well, I think I've found part of the problem.  The
> > nf_conntrack_netbios_ns module only operates on port 137, not on port
> > 138.  I don't know exactly what the difference is, but it seems that all
> > my WINS queries are attempting to go across on port 138.
> 
> Port 137 is NetBios Name Service.
> Port 138 is NetBios Datagram Service.
> WINS is supposed to be Microsoft's implementation of Netbios Name
> Service, so I am a bit surprised that WINS queries are sent on port 138.

Sorry, I was confused earlier - it actually isn't WINS traffic going over port 138, it's logon request traffic.  The WINS traffic is actually functioning correctly on port 137 - the WINS requests are sent & NAT'd correctly, and the responses are received.  For the logon traffic, I found that the NetBIOS Datagrams have the source IP & port embedded in the payload instead of just using the IP header information, which, I believe is what's causing problems for NetBIOS logons over NAT.  I'm guessing that the NT server receives the logon request, unpacks the data, and grabs the source IP & port embedded in the payload and uses that as the return destination rather than using the IP header information for that.

> 
> [...]
> > As far as the nf_conntrack_nat_netbios_ns module goes, no, it doesn't
> > exist in the kernel,
> 
> If it were to exist it would be named ip_nat_netbios_ns, not
> nf_conntrack_nat_netbios_ns. But IIUC the nf_conntrack_netbios_ns helper
> module was specifically designed to handle replies to broadcast NBNS
> queries, as the generic UDP conntrack handles only unicast, not
> broadcast (the unicast source address in the reply does not match the
> broadcast destination address in the query). There would be no point in
> a NAT helper module.
> 
> > but I don't see any nf_conntrack_nat* modules their, either,
> > so I'm thinking that the standard nf_conntrack modules are supposed to
> > cover NAT
> 
> No, there are dedicated NAT helper modules. Search for nf_nat_* instead.
> 
> > in addition to standard routing.
> 
> s/standard routing/connection tracking/

I'll look and see what I can find for nat modules - I did not see anything with *nat* in it in the net/netfilter directory in the Linux source tree.

Thanks,
Nick

