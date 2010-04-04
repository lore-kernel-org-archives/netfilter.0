From: Marek Kierdelewicz <marek@piasta.pl>
Subject: lxc, conntrack and routecache
Date: Sun, 4 Apr 2010 09:07:57 +0200
Message-ID: <20100404090757.6f1ac500@catlap>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: containers@lists.linux-foundation.org, netfilter@vger.kernel.org

Hi,

I'm evaluating lxc for use in virtualized routing/bridgeing
infrastructure. I'm particulary interested in conntrack and routecache
behaviour. I had run some tests and established that routecache and
conntrack is not shared between containers and base system. Are data
structures for routeche and conntrack in kernel shared (with each entry
marked with namespace id) or new data structure is created for each new
container?

Spare me RTFS. Thx

Regards,
Marek
