From: aksingh@hss.hns.com
Subject: registering/unregistering hook functions
Date: Thu, 3 Jun 2004 19:01:22 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF87054433.768E32DF-ON65256EA8.00499678@hss.hns.com>
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





Hi,

  In my module I do not want my hook functions to start capturing packets
when it is inserted using insmod(i.e i do not want my hook registration
functions to be called in init_module(). I want to register them when
someone writes onto my char device, so then I cannot unregister my hook
functions in the cleanup_module() because I do not know if they are
registered or not in the first place.

   So my question is, is there a way to find out before calling the
   unregister functions in cleanup_module whether or not they are
   registered. Something like this in the cleanup module :
   cleanup_module()
      if (registered(nfho1)) unregister(nfho1) ;

??

thanks
Amit


