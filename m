From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Using External NATTED addresses Inside the Firewall
Date: Tue, 18 May 2004 21:39:51 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405182139.51346.Antony@Soft-Solutions.co.uk>
References: <6.0.0.22.2.20040518151903.03c3ee30@mail.naccrra.org> <200405182049.29795.Antony@Soft-Solutions.co.uk> <6.0.0.22.2.20040518161116.040f0c60@mail.naccrra.org>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6.0.0.22.2.20040518161116.040f0c60@mail.naccrra.org>
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

On Tuesday 18 May 2004 9:17 pm, David O'Brien wrote:

> At 03:49 PM 5/18/2004, Antony Stone wrote:
> >
> >http://www.netfilter.org/documentation/HOWTO/NAT-HOWTO-10.html
>
> Current setup from iptables-save
>
> Very much like the example at the link above however it doesn't work.
> Looks like its bouncing around.

What do you mean by "bouncing around"?

> Any logging option I could enable to actually see the above in action?

Well, "iptables -L -t nat -nvx; iptables -L -nvx" will show you packet & byte 
counters so you can see whether any packets have matched the rules.

Other than that, a packet sniffer (eg: tcpdump, ethereal) would be good.

Regards,

Antony.

-- 
Microsoft may sell more software than any other company, but McDonald's sell 
more burgers than any other company, and I think the other similarities are 
obvious...

                                                     Please reply to the list;
                                                           please don't CC me.


