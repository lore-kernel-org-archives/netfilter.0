From: David Cannings <lists@edeca.net>
Subject: Re: OUTPUT chain in nat table.
Date: Tue, 27 Apr 2004 13:15:21 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404271315.21173.lists@edeca.net>
References: <GHEILNONPACCGBGKBEKKOEHFCFAA.mani@manikandan.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <GHEILNONPACCGBGKBEKKOEHFCFAA.mani@manikandan.org>
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

On Tuesday 27 April 2004 13:07, Manikandan wrote:
> 	There is no issue with PREROUTING and POSTROUTING chains in nat
> table now. But my OUTPUT DNAT is not working and it keeps giving me an
> error " Invalid argument ".
> iptables -t nat -A OUTPUT -d 10.35.47.120 -j DNAT -to 10.35.47.3

According to the manual page "--to-destination" is what you require 
instead of "-to".

David

