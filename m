From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: map internal ip [2]
Date: Fri, 19 Mar 2004 19:21:18 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403191921.18885.Antony@Soft-Solutions.co.uk>
References: <1079722569.1980.52.camel@kaos.mpsnet.net.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1079722569.1980.52.camel@kaos.mpsnet.net.mx>
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

On Friday 19 March 2004 6:56 pm, Omar Armas wrote:

> I have the following config:
>
> (public ip)
> eth0
> Firewall
> eth1 (150.50.53.4)
>
> 148.145.133.1 (vpn router)
>
> 150.50.57.0/24
> (LAN, including a server with 150.50.57.2)
>
> *Class 150.50.57.0/24 is routed to 148.245.164.1

I forgot to ask - where does 148.245.164.1 fit into the above diagram?

Antony.

-- 
Christmas was just an opportunity to upgrade to kernel 2.6 while no-one was 
around to notice the downtime.

                                                     Please reply to the list;
                                                           please don't CC me.


