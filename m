From: Marek Kierdelewicz <marek@piasta.pl>
Subject: netfilter performance dependent on arch
Date: Tue, 7 Feb 2012 18:34:53 +0100
Message-ID: <20120207183453.522fa74b@catus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

Can anyone point me to some performance comparison of netfilter on i686
and x86_64? I have a few linux routers doing a lot of firewalling and
QoS. Currently those routers use i686 arch on 64-bit hardware. Would I
notice any performance gain after moving to 64-bit kernel?

Next question. On some routers I don't need statefull firewall at all
and I have NOTRACT as a default rule in raw netfilter table. What is
the expected performance gain if I would fully disable conntrack
instead of using NOTRACK target? What would be the best approach to do
it on debian squeeze distribution kernel (nf_conntrack compiled as a
module)? Is blacklisting nf_conntrack module enough (to be safe in case
of accidental addition of statefull rule)?

best regards,
Marek Kierdelewicz
