From: Philip Craig <philipc@snapgear.com>
Subject: Re: 2.4.18 -> 2.4.23 breaks IPMASQ.
Date: Thu, 11 Dec 2003 18:40:50 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FD82D92.1020009@snapgear.com>
References: <000701c3b962$af9c5e60$6049a8c0@tmp.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000701c3b962$af9c5e60$6049a8c0@tmp.dyndns.org>
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
To: Spam Me Not <stopspam@welho.com>
Cc: netfilter@lists.netfilter.org

Spam Me Not wrote:
> I'm using Debian Woody with ipchains compatibility enabled in kernel.
> Eth0 is connected to a cable modem; Eth1 is a small internal network.
> With 2.4.23 sending any packets from internal network to internet causes at
> least eth1 to die, not immediately but in a minute or so.
> I don't know if the entire machine freezes, or if it's eth1 only; the

This may be a known problem with 2.4.23, try the following patch
from patch-o-matic:

	submitted/90_fw_compat_local-nullbinding.patch

-- 
Philip Craig - SnapGear, A CyberGuard Company - http://www.SnapGear.com


