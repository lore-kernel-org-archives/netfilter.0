From: David Cannings <lists@edeca.net>
Subject: Re: MAC address and iptables
Date: Sun, 29 Feb 2004 16:14:35 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402291614.35304.lists@edeca.net>
References: <4041ED0A.9070001@stupar.homelinux.net> <200402291555.02977.Antony@Soft-Solutions.co.uk> <40420D1E.7090400@stupar.homelinux.net>
Reply-To: david@edeca.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40420D1E.7090400@stupar.homelinux.net>
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

On Sunday 29 February 2004 16:02, Sasa Stupar wrote:
> What I want is to accept connections only from those listed in the
> rules and drop others. But with the current config it accepts
> connectins also from others which are not in the rules.

Connections to what?  Your rules, such as the one below, allow connections 
from anywhere.  

> # FTP
> -A INPUT -p tcp -m tcp --dport 21 -j ACCEPT

David


