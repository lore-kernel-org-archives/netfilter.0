From: Payal Rathod <payal-netfilter@scriptkitchen.com>
Subject: Re: firewall problem continued
Date: Tue, 10 Aug 2004 04:14:18 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040810081418.GA22730@tranquility.scriptkitchen.com>
References: <20040809081216.GA12643@tranquility.scriptkitchen.com> <200408091155.10375.Antony@Soft-Solutions.co.uk> <20040809111959.GA16482@tranquility.scriptkitchen.com> <200408091231.33128.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200408091231.33128.Antony@Soft-Solutions.co.uk>
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
To: Netfilter ML <netfilter@lists.netfilter.org>

On Mon, Aug 09, 2004 at 12:31:33PM +0100, Antony Stone wrote:
> Exactly the same as your extisting PREROUTING rule, but you put it in the 
> OUTPUT chain instead (still in the nat table):
> 
> iptables -A OUTPUT -t nat -d 1.2.3.4 -p tcp --dport 25 -j DNAT --to 10.10.10.2 

As I said earlier that now I can access the mail server at 10.10.10.2
from the firewall machine using its external IP. But now I need to access the 
mailserver from the same machine itself using the external IP.
How do I do it?

Thanks a lot for the help in advance.
With warm regards,
-Payal

