From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: How to invert more than one destination network?
Date: Mon, 1 Mar 2004 16:18:37 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403011618.37636.Antony@Soft-Solutions.co.uk>
References: <009901c3ffa6$0cdd0050$c800a8c0@cyclelogic.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <009901c3ffa6$0cdd0050$c800a8c0@cyclelogic.com>
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

On Monday 01 March 2004 3:58 pm, Gonzalo Parra wrote:

> Hi
>
> I have MASQUERADE in a box as a gateway using IPTABLES and I am using that
> box also for VPN... so for it to work I cant masquerade thaffic that goes
> to the other side of the VPN...
>
> This works for me:
>
> IPTABLES -t nat -A POSTROUTING -o $EXTIF -d \! 192.168.20.0/26 -j
> MASQUERADE
>
> but now I have another network at the other side of the VPN
> (192.168.40.0/26), so how can I invert two networks in the -d???

Depending on how your VPN is set up, are you sure that packets to the other 
end of it are going out through $EXTIF anyway?   I run VPNs using FreeS/WAN, 
and all the VPN traffic goes out through interface ipsec0, which I do not 
masquerade.

Anyway, assuming that you do need to do what you asked, try matching the 
packets you don't want to masquerade, first, then masquerading anything 
that's left:

iptables -A POSTROUTING -t nat -o $EXTIF -d 192.168.20.0/26 -j ACCEPT
iptables -A POSTROUTING -t nat -o $EXTIF -d 192.168.40.0/26 -j ACCEPT
iptables -A POSTROUTING -t nat -o $EXTIF -j MASQUERADE

Regards,

Antony.

-- 
You can spend the whole of your life trying to be popular,
but at the end of the day the size of the crowd at your funeral
will be largely dictated by the weather.

 - Frank Skinner

                                                     Please reply to the list;
                                                           please don't CC me.


