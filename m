From: Marek Zachara <marek.zachara@conexe.pl>
Subject: Re: configuring linux machine as a router with two external
	interfaces
Date: Fri, 7 Oct 2005 17:26:19 +0200
Message-ID: <200510071726.20043.marek.zachara@conexe.pl>
References: <434669A8.4040709@e-consystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <434669A8.4040709@e-consystems.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

I don't think netfilter is the best tool for the job. 
There is a kernel feature that allows bonding of two interfaces for traffic 
sharing and traffic equalization afair (although i havn't used it 
personally).
You can of course share the traffic with netfilter by marking packets in 
pre-routing and then routing them according to netfilter mark - but you must 
define yourself how to distribute the traffic between interfaces - i don't 
recall any target that could serve as a classic load balancing.

Marek


On Friday 07 of October 2005 14:27, sureshmadhu wrote:
> hi,
>      I couldn't write the script for configuring my linux machine that
> has two external MAC interfaces as a router. The NAT should route the
> packet from internal network to one of the two external mac interfaces
> acoording to load balance in the each interface.
> can anybody help me to solve this problem?
>
>
> with regards..
>
> Suresh Madhu D
> Project Trainee
> e-consystems
> chennai.

