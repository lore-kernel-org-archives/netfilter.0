From: Joe Ruddy <jruddy@novapointe.com>
Subject: (unknown)
Date: Thu, 3 Jan 2008 13:57:48 -0800
Message-ID: <00b301c84e53$ae114a80$9604000a@jrdesktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Subject: 
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

We are moving to a Co-Location center and will need to forward all traffic
for all our IP to our new IP addresses.

As an example our block is 12.24.15.0/24

Our new block will be 54.64.18.0/24

If we have a webserver at 12.24.15.24 I would like all requests to
12.24.15.24 to be forwarded to 54.64.18.24 where the new machine will be
located.
If we have a mailserver at 12.24.15.19 I would like all requests to
12.24.15.19 to be forwarded to 54.64.18.19 where the new machine will be
located.

I add one rule ..."iptables -t nat -A PREROUTING -d 12.24.15.24 -j DNAT --to
54.64.18.24"

If I try to ssh or go to the website hosted there I get nothing.  I can see
that the requests arrive at 54.64.18.24 by looking at the logs.

Any ideas?

Thanks

Joe

Joe Ruddy
Director of Technology
Novapointe LLC
909-930-3062 x2738
jruddy@novapointe.com 
