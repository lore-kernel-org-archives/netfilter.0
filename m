From: Payal Rathod <payal-iptables@staticky.com>
Subject: is this ip spoofing?
Date: Sun, 17 Aug 2003 07:58:57 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030817022857.GA1426@linux.local>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,
I don't know much about SNAT. But is this equivalent to i-spoofing in
such case? Is this how SNAT works?

Assume I have a internal ip 192.168.0.10. All traffic coming from it
should be seem as coming from 202.1.1.1. So I use SNAT and POSTROUTING
and now connection seems to take place from 202.1.1.1. But isn't it
similar to ip-spoofing?

Thanks a lot and bye.
With warm regards,
-Payal


-- 
"Visit GNU/Linux Success Stories"
http://payal.staticky.com
Guest-Book Section Updated.

