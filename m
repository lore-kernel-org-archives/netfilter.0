From: Travis Johnson <tlj@ida.net>
Subject: DNAT and promiscuous mode
Date: Mon, 26 Apr 2004 11:03:24 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <408D40DC.2010201@ida.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

Is it possible to use DNAT on an interface that only runs in promiscuous 
mode to redirect web traffic to a different IP address?

Traffic does not pass thru the firewall, only a single ethernet 
interface in promiscuous mode.

Thanks,

Travis
Microserv

