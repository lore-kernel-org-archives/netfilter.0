From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Did MASQUERADE not work ?
Date: Wed, 10 Mar 2004 09:23:00 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403100923.00253.Antony@Soft-Solutions.co.uk>
References: <00c001c40644$19931970$6cfaa8c0@Defiant>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00c001c40644$19931970$6cfaa8c0@Defiant>
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

On Wednesday 10 March 2004 2:05 am, Kevork wrote:

> Hi !,
>
> This problem is making me crazy ...
>
> All of the sudden, PCs from inside network lost conextion to internet.
> After some tcpdump on the linux box, I saw the box was not NATing.
> Paquets from inside are going to outside on its original IP source.
> The most misterious thing is that this was working some hours ago, from the
> first time I set up the box.

Has your DHCP lease expired on the external interface?

> MASQ line is:
> iptables -t nat -A POSTROUTING -s 192.168.250.0/24 -d $internet -j
> MASQUERADE

What is $internet?

Regards,

Antony.

-- 
This is not a rehearsal.
This is Real Life.

                                                     Please reply to the list;
                                                           please don't CC me.


