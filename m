From: aksingh@hss.hns.com
Subject: nf_register_hook / unhook
Date: Wed, 9 Jun 2004 11:46:44 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OFD4586D9D.4D8A8A86-ON65256EAE.00224E4D@hss.hns.com>
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
To: Sven Schuster <schuster.sven@gmx.de>
Cc: netfilter@lists.netfilter.org





HI,

    Is it possible to call these netfilter hook register and unregister
functions from any function in my module, or is it necessary(a constraint)
to call them only from the module init and cleanup functions ? ...

thanks
Amit


