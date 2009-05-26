From: "George B." <georgeb@gmail.com>
Subject: Policy NAT, pools etc. Is netfilter for me?
Date: Mon, 25 May 2009 21:05:08 -0700
Message-ID: <b65cae940905252105r15910de6s99ec2538dc23066c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=Y9OZbZUdnN00yIeks+0FLF8V483QIz8bgeAfdk6L8mc=;
        b=tBlSiEsdRjRyOwj1J1V/3OcXA2zHXTasc/2/SjmEoBtOPi2XaCqNtGUyHuo6oNRVCV
         NMiVaXOGQxWSHXQV1/7L2U36JHpw8arCqBOm2O+sGunAxu2XSHq+rJsWVKnUhRMdkki0
         HCqJV6q3WOqMZrC8EbJYB3dDqfn0Hgy8BJL/0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

It has been a while since I have used Linux NAT (2.4 kernels) and
things have evolved considerably since then.
I am investigating the possibility of using Linux to provide NAT
functionality in a network and want to know if it
can meet my requirements.  Here is what I need to be able to do:

1. Several groups of internal machines must be NATed to different
outside IP addresses on the same physical interface.
These groups of  internal servers are of varying numbers so they don't
rest on even network boundaries.  For example:

172.16.1.1, 172.16.1.6, and 172.16.1.34 get NATed to 1.1.1.1
172.16.1.3, 172.16.2.4  and 172.16.2.73 get NATed to 1.1.1.2

All others get NATed to 1.1.1.3

2.  Some of these groups of internal machines will have more than 64K
outbound connections and will require more than
one external IP address.  To rewrite the example above:

172.16.1.1, 172.16.1.6, and 172.16.1.34 get NATed to 1.1.1.1 or 1.1.1.2
172.16.1.3, 172.16.2.4  and 172.16.2.73 get NATed to 1.1.1.3 or 1.1.1.4

All other traffic NATed to 1.1.1.5 or 1.1.1.6

There is only one "inside" and one "outside" interface.
There could be in excess of a Gig of traffic.

The application is that of a application service provider.  The
internal addresses map to machines running applications for various
clients.
These applications must map to outside addresses that associate to
that client.  That is a hard requirement placed on this
traffic from an outside organization where much of the traffic is
destined. So one pool of internal machines for client A must map
to an outside IP address pool associated with client A and used only
for traffic from the client A applications.

So my question before I risk a lot of frustration is if it is even
feasible to go down the Linux/Netfilter route.  If so, any hints for
boosting performance would be appreciated as well (e.g. it looks like
there might be a role here for ipset).  And if this can be done,
must the outside addresses be contiguous or can they be assigned as
needed as traffic grows?

Thanks in advance for your time and consideration,

George
