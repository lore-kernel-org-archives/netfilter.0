From: uniplex <uniplex@maximum-linux.net>
Subject: Re: NAT & Homepage Statistics
Date: Fri, 31 Jan 2003 20:11:07 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E3AD85B.8020908@maximum-linux.net>
References: <se391cd4.045@mail.bmb-bbm.org> <1043928504.590.4.camel@ranjeet-linux-1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ranjeet Shetye <ranjeet.shetye2@zultys.com>
Cc: netfilter <netfilter@lists.netfilter.org>

Ranjeet Shetye wrote:

> If your webserver is behind the firewall and people are connecting to it
> from the Internet, it means that you are running Destination NAT (DNAT).
> So, your source IP for incoming packets should not be affected since you
> are doing DNAT only. On the other hand, if you are also doing SNAT for
> traffic coming in then you might run into the problem you are running
> into. Check your rules. Maybe you need tighter rules. i.e. bind your
> DNAT / SNAT rules to specific interfaces ?
> 
> Can't help more without details.
> 
> HTH
> 

yeah, any snat rules would be suspect. and also a misconfigured 
postrouting rule.


