From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: conf scenario.
Date: Mon, 3 May 2004 21:56:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405032156.34614.Antony@Soft-Solutions.co.uk>
References: <4096AE99.5070705@o2.pl>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4096AE99.5070705@o2.pl>
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

On Monday 03 May 2004 9:42 pm, Krystian wrote:

> hello
>
> i need some help on how to configure this scenario in iptables:
>
> [adsl modem/router]-----[eth1-linux box-eth0]-----[network]
>
> the problem is that the box has to work as a forward/masqurade for most
> users, but it must also bridge traffic from couple hosts inside the
> network which have public IP addresses.
>
> question: how to configure "linux box's" iptables to forward and
> masquarade traffic from most users and bridge traffic for couple
> "public" users.

Add a third interface card eth2, bridge eth1 and eth2 as br0, and then route 
between br0 and eth0.

If you have hosts on your network which need public IPs then they have to be 
on a separate subnet from your normal clients anyway.

Regards,

Antony.

-- 
In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac

                                                     Please reply to the list;
                                                           please don't CC me.


