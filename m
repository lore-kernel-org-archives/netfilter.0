From: ianabel@mxtelecom.com
Subject: Conntrack table editing utility
Date: Thu, 28 Jul 2005 17:13:24 +0100
Message-ID: <1122567204.42e90424cba63@base.mxtelecom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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


Hi,

I've had a request to develop/find a utility that can selectively remove entries
from the conntrack table on linux 2.4. So if you changed where a tcp port dnats
to in iptables you could vape any existing conntrack entry relating to it and
any future packets will go to the new dnat target.

I'm mailing the list to find out if

a) Theres a blatant reason why this is a BAD THING to be thinking about doing.
b) See if a utility already exists

Thanks in advance for any help,
Yours,

Ian Abel




