From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: Re: ipsec and iptables
Date: Wed, 15 Feb 2006 18:37:24 +0100
Message-ID: <BAY103-F324544407918F3344EBC92B2FA0@phx.gbl>
References: <43F36406.9090906@dawin.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43F36406.9090906@dawin.de>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Andreas Stallmann wrote:

>Hi Marco,
>
>thanks for your help so far. Some additional questions:
>
>Marco Berizzi wrote:
>>--tunnel-dst 172.16.1.247 --tunnel-src 172.16.1.226 \
>>             ^^^^^^^^^^^               ^^^^^^^^^^^^
>>These are the ipsec endpoint addresses (usually public ip addresses)
>Can I leave those out?

I think yes. I think also you may specify 0.0.0.0 for all ip.

>My endpoints do both have dynamical addresses, cause one is a roadwarrior, 
>and the other a firewall, which is connected to the internet via ADSL and 
>receives a new address each 24h.

If you are using swan as IKE daemon you may insert dynamically
these rule with left(right)updown script.



