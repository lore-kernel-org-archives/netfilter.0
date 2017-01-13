From: <webman@manfbraun.de>
Subject: Thinking about conntrack
Date: Fri, 13 Jan 2017 10:17:38 +0100
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAOosgHnoPqdNlUO2DUrQ/DfCgAAAEAAAAOzg+S+ASZhItUeCm3HrQ+EBAAAAAA==@manfbraun.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: de
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello !

I am not sure, to ask on the right list at this
moment ;-)

I am just working with conntrack on my firewall
machine, because it can show connections from
extern to any LAN machine.

I usually do this using "conntrack -E".
If I go in parallel with tcpdump, I see more
connections, then these visible with the above
conntrack command.
After some thinking, I made a "conntrack -L"
and see these connections.

Why I am writing is, that the shown behavior
is a bit suboptimal, especially, if one scripts
this.

I just think, that a argument "-M" (say for
migrate) should initially show the table and then
switch over to track via events. Without this,
you may miss new connections until the event
processing starts.

Thanks anywway,
Manfred



