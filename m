From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: how can i combine these 2 iprules
Date: Fri, 5 Mar 2004 18:33:16 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403051833.16893.Antony@Soft-Solutions.co.uk>
References: <3405.128.59.176.161.1078511273.squirrel@sojourn.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3405.128.59.176.161.1078511273.squirrel@sojourn.dyndns.org>
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

On Friday 05 March 2004 6:27 pm, Technical wrote:

> -A RH-Firewall-1-INPUT ! -s cnnp1.com  -j LOG --log-prefix "IPTABLES: "
> -A RH-Firewall-1-INPUT ! -s cnnp2.com  -j LOG --log-prefix "IPTABLES: "

iptables -N mychain
iptables -A mychain -s cnnp1.com  -j RETURN
iptables -A mychain -s cnnp2.com  -j RETURN
iptables -A mychain -j LOG --log-prefix "IPTABLES: "
iptables -A RH-Firewall-1-INPUT -j mychain

Note that it is not recommended to use hostnames in netfilter rules - better 
to identify the IP addresses and put them in yourself, to avoid possibly 
hidden problems.

Antony.

-- 
Behind the counter a boy with a shaven head stared vacantly into space,
a dozen spikes of microsoft protruding from the socket behind his ear.

 - William Gibson, Neuromancer (1984)

                                                     Please reply to the list;
                                                           please don't CC me.


