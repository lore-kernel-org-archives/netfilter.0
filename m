From: Gioele Barabucci <dev@gioelebarabucci.com>
Subject: Re: Aren't these connections ESTABILISHED? (2nd take)
Date: Sun, 02 Oct 2005 19:45:13 +0200
Message-ID: <dhp6bm$499$1@sea.gmane.org>
References: <dhmn38$hsk$1@sea.gmane.org>
	<Pine.LNX.4.61.0510020401240.21519@filer.marasystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
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

Henrik Nordstrom wrote:
> Probably hits the UDP conntrack timeout. The default is only 30 seconds to
> receive a reply to the initial packet, and DNS can take longer..
Is there a way to set this timeout to an higher value?

Is ip_ct_udp_timeout, or ip_ct_udp_timeout_stream, the correct sysctl key to
set?
Is there a iptables option to set longer timeout for a specific kind for
connection?

-- 
Gioele <dev@gioelebarabucci.com>


