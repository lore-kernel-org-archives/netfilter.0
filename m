From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Transparent proxy question
Date: Mon, 15 Mar 2004 10:36:00 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403151036.00538.Antony@Soft-Solutions.co.uk>
References: <40556EE6.6040809@stupar.homelinux.net> <200403150907.28211.Antony@Soft-Solutions.co.uk> <40557989.2080306@stupar.homelinux.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40557989.2080306@stupar.homelinux.net>
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
To: Netfilter-List <netfilter@lists.netfilter.org>

On Monday 15 March 2004 9:38 am, Sasa Stupar wrote:

> Antony Stone pravi:
> >
> > If you actually mean source IP address based ACL, then you need to check
> > your SNAT rule in the POSTROUTING chain of netfilter - make sure it is
> > only applied to your external interface, not the interface where your
> > proxy server is connected.
>
> Yes, I ahve ment source IP bassed, sorry my mistake. Anyway here is my
> config for trasparent proxy:
> -------------------
> $IPT -t nat -A PREROUTING -i $INIF -s ! 192.168.10.10 -p tcp --dport 80
> -j DNAT --to 192.168.10.10:3128
> $IPT -t nat -A POSTROUTING -o $INIF -s $INNET -d 192.168.10.10 -j SNAT
> --to 192.168.10.111
> $IPT -A FORWARD -s $INNET -d 192.168.10.10 -i $INIF -o $INIF -p tcp
> --dport 3128 -j ACCEPT
> -------------------
> Description:
> 192.168.10.10 is proxy server
> 192.168.10.111 is netfilter machine
> INIF=192.168.10.111
> INNET=192.168.10.0/24
>
> Is there something to add or change here?

Yes.   Remove the POSTROUTING rule, because it is specifically changing the 
source address of all packets sent to the proxy server to be that of the 
firewall.

Regards,

Antony.

-- 
"Note: Windows 98, Windows 98SE and Windows 95 are not affected by [MS
Blaster].   However, these products are no longer supported.   Users of these
products are strongly encouraged to upgrade to later versions."

(which *are* affected by MS Blaster...)

http://www.microsoft.com/security/security_bulletins/ms03-026.asp

                                                     Please reply to the list;
                                                           please don't CC me.


