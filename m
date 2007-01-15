From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: how to configure a router/firewall with no nat
Date: Sun, 14 Jan 2007 22:27:46 -0600
Message-ID: <45AB02C2.30107@riverviewtech.net>
References: <658212.16620.qm@web56206.mail.re3.yahoo.com>
	<45A95397.9040808@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45A95397.9040808@plouf.fr.eu.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 01/13/07 15:48, Pascal Hambourg wrote:
> I really do not understand why one would use NAT when they do not have 
> to. NAT is a necessary evil, and when it is not necessary, it is just 
> evil. NAT does not provide security, or only through obscurity.

I believe it is the obscurity that some people seek when using NAT.  The 
only other reason (at the moment) I can thing off for wanting to NAT 
inbound traffic is so that the advertised IP address can serve multiple 
resources, even if one machine can not.  I.e. direct HTTP to the web 
server(s), SMTP to the exchange servers or the sendmail server, or VPN 
traffic to an internal VPN concentrator, etc.  This allows a company to 
minimize the number of IPs that are directly accessible on the net.



Grant. . . .

