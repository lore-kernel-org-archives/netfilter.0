From: Philip Craig <philipc@snapgear.com>
Subject: Re: iptables: Invalid argument with PPTP conntrack enabled
Date: Tue, 09 Dec 2003 09:53:57 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FD50F15.2070608@snapgear.com>
References: <57370162285.20031208174406@internetplustravel.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <57370162285.20031208174406@internetplustravel.ru>
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
To: Oleg Savostyanov <savostyanov@internetplustravel.ru>
Cc: netfilter@lists.netfilter.org

Oleg Savostyanov wrote:
> iptables -t nat -A POSTROUTING -o eih0 -j SNAT --to-source $myIP
> failed to execute
> with the following:  iptables: Invalid argument

http://www.netfilter.org/documentation/FAQ/netfilter-faq-3.html#ss3.20


