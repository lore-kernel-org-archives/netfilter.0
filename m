From: tengaman@wolke7.net
Subject: NAT not for filtering - problem
Date: Tue, 17 Feb 2009 16:28:40 +0100
Message-ID: <20090217152840.GA3683@localhost>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

recently my Debian system promted this message:
>The "nat" table is not intended for filtering, hence the use of DROP is
>deprecated and will permanently be disabled in the next iptables
>release. Please adjust your scripts.

What im doing in the nat-table is redirecting the traffic to the
tor-programm (www.torproject.org) listening on local port 9040 to form a transparent proxy.
Now, the DROP target makes sure that non-redirected and thus "non-anonymized" packages are
impossible.

To distinguish anonymized traffic from normal traffic I do have a
special user: 'tor-user' (-m -uid-owner tor-user).
The tor programm itself is run by the user 'debian-tor'.

The Problem:
--uid-owner debian-tor does not match the redirected traffic.
Meaning although the traffic is processed by a process owned by a
different user --uid-owner still maches the orignal user of the data.
My sytem seems to lack the --cmd-owner match, was this cut out?

I hope you have any idea.

Sebastian R.
