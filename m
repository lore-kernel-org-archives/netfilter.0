From: Scott Huang <SHuang@Narus.com>
Subject: iptables matches
Date: Thu, 6 Mar 2003 21:09:12 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <580E532D9F7A9B4BAE8A130848E0DDA70283A21E@franklin.narus.com>
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>


Hi ,

Is it poosible to specify all elements in the 5-tuple, srcIP, srcPort,
protocol, dstIP, dstPort ,to iptables for filtering?

for example, 

iptable ... 192.168.1.1, 12345, 6, 64.58.79.230, 80 ...

Any of the elements may be a wild card or a subnet, i.e 
192.168.1.1/16 ,12345 - 12400,  6, 64.58.79.230, 80

thanks



