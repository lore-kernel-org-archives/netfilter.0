From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: AW: IP Traffic Accounting / Own Chains
Date: Sat, 22 Jun 2002 16:18:07 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020622151809.UBP2755.mta05-svc.ntlworld.com@there>
References: <NFBBLDBMIDIOFPBNLEAJOEJBCHAA.yomega@wahooo.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <NFBBLDBMIDIOFPBNLEAJOEJBCHAA.yomega@wahooo.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Saturday 22 June 2002 4:18 pm, yomega wrote:

> OK so i do:
> iptables -N [CHAIN NAME]
> and then add rules for example this one:
> iptables -A [CHAIN NAME] -p tcp --dport 80 -j ACCEPT
> so now i've made some traffic on my webbie and typed in that:
>
> iptables -L -n -v -x
>
> now the list is printed :) INPUT and the other Chains are correct but this
> chain (my own one) didn count anything.

Did you put a rule anywhere which says

iptables -A FORWARD ....... -j [CHAIN NAME]

so that packets get fed into your new chain ?

 

Antony.

