From: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
Subject: Re: Login load balancing
Date: Wed, 26 Apr 2006 23:37:57 +0200
Message-ID: <444FE835.2010007@gmx.net>
References: <444FAEFF.1040100@uvic.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <444FAEFF.1040100@uvic.ca>
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
To: Drew Leske <dleske@uvic.ca>
Cc: netfilter@lists.netfilter.org

Hi Drew,

what about using a DNS CNAME for bob to bob[368]? If you set the
TTL low enough and update your DNS server with the latest data
from your SNMP agents continuously, you will achieve exactly what
you want without any iptables trickery.
Such a solution is running here and it works fine.

Regards,
Carl-Daniel
-- 
http://www.hailfinger.org/

