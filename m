From: Sorin Panca <sorin.panca@gmail.com>
Subject: Re: MAC/IP PAIR MATCH
Date: Mon, 30 Jan 2006 21:43:43 +0200
Message-ID: <43DE6C6F.4040200@gmail.com>
References: <164362107.20060127145214@gorontalo.net>	<43DA2B8C.5050007@prosyst.com>	<10310383401.20060128161251@gorontalo.net>
	<43DE4D3B.8080106@prosyst.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43DE4D3B.8080106@prosyst.com>
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
To: Boryan Yotov <yotov@prosyst.com>
Cc: netfilter@lists.netfilter.org

Hi!
This rule is not correctly witten:
# iptables -A FORWARD -s <IP _address> -m -mac --mac-source
<MACaddress>> -j ACCEPT

It should be:
iptables -A FORWARD -s $IP -m mac --mac-source $MAC -j ACCEPT

HTH
Sorin.

