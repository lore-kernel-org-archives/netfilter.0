From: aksingh@hss.hns.com
Subject: nf_register_hook
Date: Thu, 8 Jul 2004 21:38:59 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF367BFF4A.E1D3E5FD-ON65256ECB.00588946@hss.hns.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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

  It seems nf_register_hook can return a -ve value too, I looked at the
function source that wlays returns 0,  but in some cases(i dont know what
they are) -ve value is also returned, when does this happen ?? At a lot of
places in the kernel the return value for nf_register_hook is checked to
see if it is less than zero ??

thanks
Amit


