From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Is outbound rule needed for http responses?
Date: Mon, 8 Mar 2004 08:40:07 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403080840.07652.Antony@Soft-Solutions.co.uk>
References: <001101c4048c$74e8c180$3702a8c0@ARAQI>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001101c4048c$74e8c180$3702a8c0@ARAQI>
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

On Sunday 07 March 2004 9:37 pm, Adesina Adebiyi wrote:

> Hello gentle expert,
>
> I am trying to adapt the iptables firewall for my hosting server.  That is,
> http, https will be running on it to serve ecommerce clients.  I have
> adapted rules to allow tcp inbound services for port 80 and 443.  To be
> able to respond to the requesting clients, do I need corresponding tcp
> outbound services on port 80 and 443?

That depends on what your ruleset says.

If you DROP all OUTPUT packets, then of course your INPUT rules will do 
nothing useful, because replies won't get out.

If you allow ESTABLISHED,RELATED packets in OUTPUT, then people will get 
replies to whatever services you enable in INPUT (but the box itself will not 
be able to generate any NEW outbound connections, eg: DNS, unless you allow 
an OUTPUT rule for these).

I suggest you tell us your ruleset (either the iptables commands which set up 
the rules, or the output of "iptables -L -nv; iptables -L -t nat -nv", 
please, not the format created by iptables-save), and tell us what you want 
the ruleset to do, and we can help a bit more specifically.

Regards,

Antony.

-- 
If you want to be happy for an hour, get drunk.
If you want to be happy for a year, get married.
If you want to be happy for a lifetime, get a garden.

                                                     Please reply to the list;
                                                           please don't CC me.


