From: <webman@manfbraun.de>
Subject: Looking for conntrack packet information
Date: Sun, 12 Feb 2017 12:00:54 +0100
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAOosgHnoPqdNlUO2DUrQ/DfCgAAAEAAAAODde6NmS+tNjTQOrkiHBUkBAAAAAA==@manfbraun.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: de
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello !

I try to use conntrack to create a small security solution
on my firewall, because it knows, whats passing cross-wall.

I am using this statetment to run:
"conntrack -E -e new -o id,timestamp,ktimestamp,extended"

and I get results. But this is not what I am looking for,
because the data doe NOT contain any packet information
(as they are visible, if one uses "Conntrack -L").

I need something which show from the first moment on,
if data will be transferred. Even including the "update"
event does not change this. Regard a UDP packet, which
just comes onece. You' have to wait until the destroy
event tells you, how many data were transferred - but
this is definitively too much too late.

Because - from my small insights - conntrack is the only
tool which knows these cross-wall connections, which option
do I have?

Thanks anyway,
Manfred



