From: David Cannings <lists@edeca.net>
Subject: Re: iptables abilities
Date: Thu, 22 Jan 2004 12:36:36 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401221236.36105.lists@edeca.net>
References: <400FC047.4010208@objeng.ch>
Reply-To: david@edeca.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <400FC047.4010208@objeng.ch>
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
To: Sven Burgener <sburgener@objeng.ch>, netfilter@lists.netfilter.org

On Thursday 22 January 2004 12:21 pm, Sven Burgener wrote:
> I'm looking for a way to connect two parties (computers) that both have
> a private IP address.
>
>           (Internet)       (Internet)
>       A <------------> X <------------> B
>
> A: 192.168.1.13
> B: 192.168.1.99
> X: public IP address
>
> In other words, can iptables act as a "relay" between two computers
> which both have a private IP address?

If you want to create a network between these two over the internet, you 
might want some form of VPN.   FreeS/WAN (www.freeswan.org) comes to 
mind.

David

