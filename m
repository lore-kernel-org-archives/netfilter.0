From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: one to one NAT
Date: Tue, 10 Sep 2002 08:50:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D7D9635.6020305@fugmann.dhs.org>
References: <200209100010.g8A0AAr9027286@ns2.is.bizsystems.com> <20020910002200.VICK295.mta06-svc.ntlworld.com@there> <3D7D9146.3080905@fugmann.dhs.org>
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
To: michael@insulin-pumpers.org
Cc: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

Anders Fugmann wrote:
> $ iptables -A POSTROUTING -t nat -s 1.2.3.5 -j SNAT \
>     --to-source 192.168.1.19
Sorry this is wrong. It should have been:

$ iptables -A POSTROUTING -t nat -s 192.168.1.19 -j SNAT \
      --to-source 1.2.3.4

Regards
Anders Fugmann
-- 
Author of FIAIF
FIAIF Is An Intelligent/Iptables Firewall
http://fiaif.fugmann.dhs.org



