From: John Lister <john.lister@kickstone.co.uk>
Subject: Has marks with conntrack changed?
Date: Tue, 27 Mar 2012 22:28:42 +0100
Message-ID: <4F72310A.8000700@kickstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi, I've been using rules like this in a firewall for a while (it does 
complex routing based on the input and uses marks to identify which 
packets go out of which interface)

for example (simplified use case)

iptables -t mangle -A PREROUTING -j CONNMARK --restore-mark
iptables -t mangle -A PREROUTING -m mark --mark 0 -m state --state NEW 
-j MARK

iptables -t mangle -A MARK -j MARK --set-mark 1
iptables -t mangle -A MARK -j CONNMARK --save-mark

which worked fine until recently when I think the box was upgraded. By 
fine I mean when a new connection was started the mark was set at 0, 
which would match the rule and then set the mark  before saving it in 
conntrack. Now it seems the mark is saved across connections.  for 
example making 2 separate pings used to result in the mark being 0 
initially and then getting set, now the mark is set to 1 on the second 
ping after it gets restored.

Is this the correct behaviour or is conntrack now tracking similar 
connections for the restore-mark?

Any hints would be appreciated.

John

ps. currently running kernel  2.6.31-23

-- 
www.pricegoblin.co.uk

