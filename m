From: "Alexis" <alexis@tpys.com.ar>
Subject: Re: route outgoing smtp via a specific interface
Date: Mon, 3 May 2004 01:07:41 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000b01c430c4$2e79e440$0200000a@heretic>
References: <16533.31553.47397.464571@jane.localdomain>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

yes it its.
you must use iproute2 and iptables with mark or just simple iproute2 (if
match conditions are enough) to achieve this
Just send a fast diagram of your network so we can help you with the rules.




----- Original Message ----- 
From: "Christer Ekholm" <chrekh@bredband.net>
To: <netfilter@lists.netfilter.org>
Sent: Sunday, May 02, 2004 7:50 PM
Subject: route outgoing smtp via a specific interface


> I have two IP-providers. And the faster one of them blocks smtp. I
> have been trying to route smtp to the slower while still routing
> everything else to the faster, without success. Is it possible at all?
>
>
> -- 
>  Christer
>
>


