From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: one to one NAT
Date: Tue, 10 Sep 2002 08:29:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D7D9146.3080905@fugmann.dhs.org>
References: <200209100010.g8A0AAr9027286@ns2.is.bizsystems.com> <20020910002200.VICK295.mta06-svc.ntlworld.com@there>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org, michael@insulin-pumpers.org

Antony Stone wrote:
> On Tuesday 10 September 2002 2:10 am, Michael wrote:
>>I want to map 1.2.3.5 to a single address behind the linux box
>>1.2.3.5 is mapped to eth1:0
 >
> iptables -A PREROUTING -a nat -d 1.2.3.5 -j DNAT --to 192.168.1.19
> iptables -A FORWARD -d 192.168.1.19 -j ACCEPT
> 
This only takes care of the ingoring part. Outgoing would be solved
by using SNAT:
$ iptables -A POSTROUTING -t nat -s 1.2.3.5 -j SNAT \
	--to-source 192.168.1.19
$ iptables -A FORWARD -s 192.168.1.19 -j ACCEPT

(Antony made a small typo - it should have been '-t nat' and not '-a 
nat', unless Im mistaken)

I would suggest that you apply network interface names, where possible.

Regards
Anders Fugmann

-- 
Author of FIAIF
FIAIF Is An Intelligent/Iptables Firewall
http://fiaif.fugmann.dhs.org


