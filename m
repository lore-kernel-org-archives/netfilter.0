From: aksingh@hss.hns.com
Subject: netfilter hook call back functions
Date: Wed, 9 Jun 2004 11:59:54 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OFEE8748A8.76067A1E-ON65256EAE.002370E3@hss.hns.com>
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
To: Sven Schuster <schuster.sven@gmx.de>, netfilter@lists.netfilter.org





Hi,

  In which context are the netfilter hook call back functions run, are they
run in interrupt context.
  Question : if there is a module with a char device's read/write functions
and some netfilter hook call back functions. Can these netfilter hooks
pre-empt the read/write calls for the char device or viceversa. ?

kernel 2.4.20-8, uni processor system.

thanks
Amit



