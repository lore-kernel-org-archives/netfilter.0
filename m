From: Geert van der Ploeg <netfilter@geert.triple-it.nl>
Subject: Re: Problems With MASQ/ Kernel 2.4.29
Date: Sat, 12 Mar 2005 01:23:17 +0100
Message-ID: <42323675.8090007@geert.triple-it.nl>
References: <20050311180127.rcp5r70mjo0c4c4c@mail.col.gob.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050311180127.rcp5r70mjo0c4c4c@mail.col.gob.mx>
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
To: "Ing. Rogelio Sevilla Fernandez" <sevilla@col.gob.mx>
Cc: netfilter@lists.netfilter.org

Ing. Rogelio Sevilla Fernandez wrote:
> I recently compiled kernel 2.4.29 with all netfilter options as modules.
> 
> All start ok, but when i set the MASQUERADE jump target on POSTROUTING
> i got:
> iptables -t nat -I PREROUTING -o eth0 -j MASQUERADE
> iptables: target problems.

when using PREROUTING rules, you should specify the incoming interface,
not the outgoing.
Or, said the other way around: when using an outgoing interface, you
should specify POSTROUTING rules.

So, because you try to masquerade, what you really want is:
iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE

See section 5 in the NAT-howto for iptables.


Hope this helps.


Regards,

Geert van der Ploeg


