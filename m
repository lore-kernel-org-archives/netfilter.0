From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: can't get connection to vpn Server (pptp) behind iptables FW
Date: Fri, 12 Mar 2004 09:53:15 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403120953.15896.Antony@Soft-Solutions.co.uk>
References: <DIIE.000000F800002A0F@sbgit.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <DIIE.000000F800002A0F@sbgit.com>
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

On Friday 12 March 2004 9:34 am, peter.gehle@sbgit.com wrote:

> Hi,
>
> since two weeks i try to create rules for my iptables fw who
> let pass an vpn tunnel to my internel ms vpn server (pptp).
> i have installed the kernel 2.4.25 and patched it with patch-o-matic (only
> the pptp/gre patch aplied).
>
> So whats wrong, becaus i can connect to the vpn server behind the firewall,
> but the connection hangs at the authentification. after some minutes i
> receive an message that the server does not respond.

I am not an expert on PPTP (I prefer IPsec), so I can't tell you exactly what 
you need to change, however I think you can find out what is missing by 
adding a couple of LOG rules which specify the remote system as source and 
destination address, and see what packets get LOGged just before being 
DROPped.   This will help you understand what communication the two machines 
are trying to do, which is not being allowed.

eg: iptables -A FORWARD -s rem.ote.vpn.client -j LOG
iptables -A FORWARD -d rem.ote.vpn.client -j LOG

Hope this helps,

Antony.

-- 
In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac

                                                     Please reply to the list;
                                                           please don't CC me.


