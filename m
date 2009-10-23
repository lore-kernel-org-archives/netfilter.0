From: Gary Smith <gary.smith@holdstead.com>
Subject: Disabling conntrack for local net
Date: Thu, 22 Oct 2009 20:00:51 -0700
Message-ID: <034DEBCAE934A74991E6E76B8DA72D14185DD509DA@HSSBS.holdstead.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

We have several IP's NAT'd in from public interface.  Even with that we noticed that 80% or so of the connection entries appear to be local to local traffic.

We have the following subnets

10.40.16.0/24 (NAT'd public)
10.40.17.0/24 (internal data)
10.40.18.0/24 (internal data)
10.40.19.0/24 (internal data)
10.40.20.0/24 (NAT'd public)

Public internface NAT's mostly to 10.40.16.0/24 IP's, and a couple on the 10.40.20.0/24 IP's.  We have data/internal services on the 10.40.17.0/24 and 10.40.18.0/24.  We see lots of connections from the 10.40.16.0/24 to the data/internal getting entered into the conntrack (as you would normally expect).  

So, is there any benefit of not conntracking these?  Is so, how do I do that without breaking the NAT.

I know I did this years ago, I just can't remember how.
