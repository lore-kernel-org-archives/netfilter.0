From: Philip Craig <philipc@snapgear.com>
Subject: Re: cvs iptables question...
Date: Mon, 05 Apr 2004 12:29:54 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4070C4A2.2030900@snapgear.com>
References: <406EEDEE.9040301@technoplaza.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <406EEDEE.9040301@technoplaza.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dominic <cvs@technoplaza.net>
Cc: netfilter@lists.netfilter.org

Dominic wrote:
>   $IPTABLES -A allow-cvs-traffic-out

That should be -N, not -A.

-- 
Philip Craig - SnapGear, A CyberGuard Company - http://www.SnapGear.com


