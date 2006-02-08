From: iler_ml@fastmail.fm
Subject: conntrack protocol module needs event ot end of session
Date: Wed, 08 Feb 2006 05:09:18 -0800
Message-ID: <1139404158.24616.253865836@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

In my conntrack protocol module, I can track beginning of the
'expected' session via expecfn callback. So far, so good.

But I need to track also the end (timing out) of the 'expected'
session once it began. How can conntrack protocol module receive
from conntrack_core.c event or timing out (or disconnection) ot
the 'expected' session that have begun earlier ?

Yakov Lerner
-- 
  
  iler_ml@fastmail.fm

-- 
http://www.fastmail.fm - Or how I learned to stop worrying and
                          love email again


