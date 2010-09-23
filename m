From: Steven Ayre <steveayre@gmail.com>
Subject: Userspace control of load balancing via DNAT/IPVS
Date: Thu, 23 Sep 2010 14:28:31 +0100
Message-ID: <AANLkTin6t_UFeftjTCg8g5f3-RMDJw8Udd+KVgB8=Rnw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=rhIPRLHqsPhRjxh1lBMnUlbHkt5g0vG3yuQV6YRA5nk=;
        b=ZoXJ3A98NMK6P/MgkklGvv+fGf42455rmuR7M0zhrbJcqJiIIzEOi+z1UOKDtEh/Fm
         9DrzoI1e4LaOaboz9Jw+bSvqnbq8e5li1QmhicJSv6PsWYYzzZkw5ov/88mqHqkcxwfB
         cnsTmIh0t3gCdmnk8MRsTThJtYQR60EkNYIYg=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi everyone,

Does anyone know a way to set the destination IP+port for either DNAT
or IPVS from a userspace daemon?

I want the decision to be implemented in userspace because the IPVS
algorithms don't quite do what I want...

I want to load balance both H323 and SIP between a cluster of
FreeSWITCH hosts. The daemon uses FS's ESL protocol to monitor the
load on each server so it always knows how many channels are in use on
each server. This updates the decision making process of which server
to send to (something like weighted least-connections).

I should be able to use IPVS for this, but SIP/UDP doesn't work for us
in this case - we have multiple incoming calls coming from the same
IP+port, and IPVS would always send those to the same host which isn't
what we want. It would be fine if it was grouped by Call-ID but the
current version of IPVS doesn't do this (looking at some recent
patches it's being worked on though?)

The solution I'm looking at is to use OpenSIPS for forwarding SIP and
DNAT/IPVS for H323. But then they are unaware of each other's load so
can't reliably work out which server is least loaded. So instead I
would like both OpenSIPS and Iptables(DNAT)/IPVS to ask the userspace
daemon which IP to send to. OpenSIPS is easy - I already have a
working module. But I'm not sure how to do it with iptables/ipvs.

Does anyone know a way to do this?

Currently my initial approach has been to use NFQUEUE from PREROUTING
to try mangling the incoming packets to create a form of DNAT. So far
I'm only testing with changing the port, but I'd eventually want to be
able to change the IP and forward it on too. I'm able to modify the
packets and recalculate the IP+TCP checksums fine. But although this
works for the SYN, iptables doesn't rewrite the source ip+port on the
SYN-ACK so connections never get opened. Obviously iptables doesn't
expect it to be DNAT so doesn't do any of the connection tracking
required. Perhaps it's possible to do that using
libnetfilter_conntrack?

Hopefully someone can point me in the right direction.

-Steve Ayre
