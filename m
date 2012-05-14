From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: Problems with a forward rule
Date: Mon, 14 May 2012 03:26:09 -0400
Message-ID: <201205140326.09455.neal.p.murphy@alum.wpi.edu>
References: <CAEjQA5JVsMUizFWODGe+OT88owqbPU0=ZjtRugq6Eg8z1U3A=w@mail.gmail.com> <4FAECDBA.9030302@saasplaza.com> <CAEjQA5LAwmxTwAGWJH5A5Bs57h8=BSXWwiWegYmVKSM7ZtvtmA@mail.gmail.com>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAEjQA5LAwmxTwAGWJH5A5Bs57h8=BSXWwiWegYmVKSM7ZtvtmA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Monday 14 May 2012 01:45:21 you wrote:

> Ok, here they are. I want to allow connections from host 172.24.50.3
> to one specific network only.

As written, your rules
  1. Allow all packets for established conns and the first packet for related
     conns to pass.
  2. Allow all packets for new conns from the host to pass
  3. Drop all other packets. This makes the first rule moot, because there
     will be no established conns from other hosts. NEW packets are dropped,
     thus there cannot be any established conns for a related connection to
     be created.
But I suspect you already know your rules don't work right. :)

I only looked at the rules in table 'filter'.

To restrict that host to a particular LAN and allow other hosts through, these 
rules in table 'filter':
-A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT 
-A FORWARD -s 172.24.50.3/32 -m state --state NEW -j ACCEPT 
-A FORWARD -j LOG --log-prefix "IPT FORWARD packet died: " 

should be:
-A FORWARD -s 172.24.50.3/32 -d a.b.c.d/netmask \
  -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -s a.b.c.d/netmask -d 172.24.50.3/32 \
  -m state --state RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -s 172.24.50.3/32 \
  -j LOG --log-prefix "FORWARD dropped packet from 172.24.50.3: "
-A FORWARD -s 172.24.50.3/32 -j DROP
-A FORWARD -d 172.24.50.3/32 \
  -j LOG --log-prefix "FORWARD dropped packet to 172.24.50.3: "
-A FORWARD -d 172.24.50.3/32 -j DROP
-A FORWARD -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT

Rule order is important. Thus,
  1. Packets from the host to that LAN that are for (1) a new or a
     new/related conn, and (2) all packets for established conns,
     are allowed.
  2. Packets to the host from that LAN for (1) a new/related conn
     or (2) for established conns are allowed.
  3. All other packets forwarded to or from that host are dropped.
  4. All other forwarded packets are allowed.
  5. The FORWARD chain's DROP policy is never executed. See #5 (above).
  6. The host is still allowed to access all other hosts on its LAN; the
     router has no control over that.
Since no protocols are specified, ICMP will also be allowed.

Remember that:
  - Without ICMP, your internetwork will not function.
  - A 'conn' is a relation between two socket endpoints, be it TCP, UDP
    or another protocol.
  - NEW refers to the *first* packet of a new conn.
  - RELATED refers to the *first* packet of a new, related conn.
  - ESTABLISHED refers to all other packets of established conns,
    whether they started as NEW or as RELATED.
  - the RELATED state is set by a conntrack helper (FTP, etc.) that
    snoops and detects when one end of an established conn is attempting
    to open a new conn (such as FTP's data channel).
  - You may want to allow DNS (UDP port 53) to pass (if needed), depending
    on where your DNS server or 'proxy' is.
  - You may want to add rules to INPUT and OUTPUT to prevent that host
    from accessing the router itself, if desired.
