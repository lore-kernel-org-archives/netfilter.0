From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: bad_packets problem?
Date: Thu, 20 Oct 2005 18:28:50 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510201827370.27782@filer.marasystems.com>
References: <4357AF18.2060109@aa.usno.navy.mil>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4357AF18.2060109@aa.usno.navy.mil>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Bill Tangren <bjt@aa.usno.navy.mil>
Cc: netfilter@lists.netfilter.org

On Thu, 20 Oct 2005, Bill Tangren wrote:

> From 209.132.177.100 - 24 packets
>  To 10.1.5.154 - 24 packets
>     Service: 33353 (tcp/33353) (Invalid packet:,eth0,none) - 4 packets
>     Service: 33935 (tcp/33935) (Invalid packet:,eth0,none) - 10 packets
>     Service: 33951 (tcp/33951) (Invalid packet:,eth0,none) - 10 packets

What does the actual log entries look like?

> The updates take place eventually, but almost never on the first go.
> I get LogWatch entries like this every time I run up2date. I am assuming that 
> there is some problem with the iptables rules I have set up, but I don't know 
> what they might be.

Not neccesarily. Could just be poor connectivity to the RHN up2date 
servers, or a bad choice of mirrors..

Regards
Henrik

