From: Quentin Armitage <quentin@armitage.org.uk>
Subject: addrtype match of multiple address types inconsistent between IPv4
 and IPv6?
Date: Tue, 03 Jun 2014 10:56:13 +0100
Message-ID: <1401789373.16662.32.camel@samson1.armitage.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

It appears to me that for IPv4:
-m addrtype --dst-type UNICAST,MULTICAST
will match if the address type is either unicast or multicast

whereas for IPv6 it will match only if the address type is both unicast
and multicast, i.e. it will never match.

Is it intentional that the matches work in opposite ways (i.e. IPv4
matches on an OR of the address types, whereas IPv6 is an AND)? If it is
the intended way of working, would it be worth stating this in the help
and man pages?

Quentin Armitage

