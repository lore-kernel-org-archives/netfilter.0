From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Bad argument `53'
Date: Thu, 10 Oct 2002 07:34:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021010063434.WSKG7631.mta03-svc.ntlworld.com@there>
References: <002a01c27003$2c9d14e0$0201a8c0@com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002a01c27003$2c9d14e0$0201a8c0@com>
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

On Thursday 10 October 2002 3:17 am, David F. Strauch wrote:

> I?ve just started writing the script to allow DNS Loopkups as a client with
> the following:
>
> iptables -A OUTPUT -o $INTERNET -p udp \
>          -s $IPADDR --sport $UNPRIVPORTS \
>          -d $NAMESERVER --dport 53 -j ACCEPT

Why are you specifying Source Address and Port on an OUTPUT rule ?

> iptables -A INPUT  -i $INTERNET -p udp \
>          -s $NAMESERVER --sport 53 \
>          -d $IPADDR --dport $UNPRIVPORTS -j ACCEPT

Is it really necessary to specify Destination Address and Port on an INPUT 
rule ?   How many addresses do you have on your interface, and why would you 
only want some of them to receive DNS replies ?

> When I execute the script with sh /etc/rc.d/rc.firewalls I receive Bad
> argument `53' for every instance of either  --dport 53 or --sport 53.  I?ve
> also tried --destination-port and --source-port with out any success.

Check what the earlier variables in the command contain.   I think you'll 
probably find one (or more) of them is empty.

Antony.

-- 

Abandon hope, all ye who enter here.
You'll feel much better about things once you do.

