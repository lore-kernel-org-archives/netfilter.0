From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: STATELESS
Date: Tue, 16 Sep 2003 12:56:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309161256.15286.gdh@acentral.co.uk>
References: <02ba01c37c46$bb7a5f60$798014ac@matthew>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <02ba01c37c46$bb7a5f60$798014ac@matthew>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Tuesday 16 September 2003 12:36, Matthew Mileham wrote:

> Does any know how to change Iptables from statefull to stateless ?

Don't load the ip_conntrack module, and / or don't use any iptables rules that 
use "-m state"  in the arguments :)

Cheers,
Gavin.

