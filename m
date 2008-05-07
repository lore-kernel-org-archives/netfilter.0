From: lists+netfilter@roth.lu
Subject: viewing rules and traffic while inserting/removing rules
Date: Wed, 07 May 2008 19:26:45 +0200
Message-ID: <4821E655.4010504@roth.lu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi there,
I have quite a large list of blacklisted networks in my iptables 
firewall, approx. 20,000.
Now I have a script that updates this blacklist according to my needs 
every hour. My problem now is that during the update period (which 
consists of several iptables [-I|-D] $CHAIN -s ... -j ... commands) my 
traffic accounting is going haywire.
I have narrowed it down to the problem that displaying the rules (from 
which I extract the traffic information via iptables -xvnL $CHAIN) 
intermittently shows 0s (zeroes) as paket and byte counters while the 
insert/delete commands are being issued.
Is there a locking problem? Should I maybe report this to the devel list?
Regards,
Marc
