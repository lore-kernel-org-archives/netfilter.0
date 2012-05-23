From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: 'swap table' feature
Date: Wed, 23 May 2012 17:25:58 -0400
Message-ID: <201205231725.58158.neal.p.murphy@alum.wpi.edu>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I knew I'd eventually remember why I subscribed to this list....

While working on enhancing my firewall, it occurred to me that it'd be real 
nice to have a 'swap chain' feature in iptables that is equivalent to the 
'swap set' feature in ipset.

Such a feature would minimize the amount of time that rules are unavailable 
when adding, changing or deleting them. At present, all the rules in the chain 
being modified are deleted, then the new rules are added. So there is a period 
of time, albeit brief, that rules are not available in that chain.

Were there a 'swap chain' command, one could build a new chain of the changed 
rules, swap the new and old chains, then flush and delete the new (now old) 
chain. This would all but guarantee that no packets 'slip by' (are 
overlooked).

Thanks,
N
