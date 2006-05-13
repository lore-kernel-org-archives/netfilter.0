From: Martijn Lievaart <m@rtij.nl>
Subject: Re: restoring iptables configuration at system startup
Date: Sun, 14 May 2006 01:29:50 +0200
Message-ID: <44666BEE.1010801@rtij.nl>
References: <003701c67670$a5102030$cf34000a@sven>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <003701c67670$a5102030$cf34000a@sven>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Angel Tsankov <fn42551@fmi.uni-sofia.bg>
Cc: netfilter <netfilter@lists.netfilter.org>

Angel Tsankov wrote:

> How do I restore iptables configuration at system startup before the 
> default rules get applied and enforced?
>

Which distro? For Redhat and derivatives:

# chkconfig iptables on

Other distros probably have something similar.

M4


