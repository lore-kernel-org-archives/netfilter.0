From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables abilities
Date: Thu, 22 Jan 2004 12:33:18 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401221233.18553.Antony@Soft-Solutions.co.uk>
References: <400FC047.4010208@objeng.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <400FC047.4010208@objeng.ch>
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

On Thursday 22 January 2004 12:21 pm, Sven Burgener wrote:

> Hello
>
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

You need to be able to route packets between A and B in order for netfilter to 
be able to consider whether to allow them or not.   The Internet will not 
route packets with private (RFC 1918) destination addresses.

Therefore you cannot do what you are suggesting with one netfilter box - you 
would need one at each end, near enough to A and B that they are on private 
networks, not routed across the Internet, doing NAT so that all the packets 
which flow across any bit of the Internet have public, routable, source and 
destination IPs.

Antony.

-- 
G- GIT/E d- s+:--(-) a+ C++++$ UL++++$ P+(---)>++ L+++(++++)$ !E W(-) N(-) o? 
w-- O !M V+++(--) !PS !PE Y+ PGP+> t- tv@ b+++ DI++ D--- e++>+++ h++ r@? 5? 
!X- !R K--?

                                                     Please reply to the list;
                                                           please don't CC me.


