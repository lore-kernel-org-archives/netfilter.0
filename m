From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: nat problem
Date: Wed, 14 Jul 2004 09:53:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407140953.50466.Antony@Soft-Solutions.co.uk>
References: <40F448B2.AF1E21@knoware.nl> <200407132353.57143.Antony@Soft-Solutions.co.uk> <40F48611.67902349@knoware.nl>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40F48611.67902349@knoware.nl>
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

On Wednesday 14 July 2004 2:02 am, Frans Luteijn wrote:

> Antony Stone schreef:
> >
> > No, I don't think so.   Broadcast packets are not supposed to cross
> > routers (they will enter the router as a machine on the local subnet, but
> > they will not be routed anywhere else, because they already come from the
> > subnet they are addressed to)
>
> I have been doing some testing:I have a machine, which broadcasts to
> 192.168.1.255 prot.: udp sport/dport: 138/138
> I typed in:
>
> iptables -t nat -A PREROUTING -i eth0 -d 192.168.1.255 -p udp --sport 138
> -j LOG iptables -t nat -A PREROUTING -i eth0 -d 192.168.1.255 -p udp
> --sport 138 -j DNAT 192.168.2.255
>
> Then I saw in my log:
> Jul 14 02:34:16 firewall kernel: IN=eth0 OUT=
> MAC=ff:ff:ff:ff:ff:ff:00:50:04:0e:d9:00:08:00 SRC=192.168.1.3
> DST=192.168.1.255 LEN=240 TOS=0x00 PREC=0x00 TTL=32 ID=60162 PROTO=UDP
> SPT=138 DPT=138 LEN=220
>
> and I saw trafic on my other network.
> When I type:
>
> cat /proc/net/ip_conntrack
>
> I see:
> udp      17 17 src=192.168.1.3 dst=192.168.1.255 sport=138 dport=138
> [UNREPLIED] src=192.168.2.255 dst=192.168.1.3 sport=138 dport=138 use=1
>
> This means to me, that those packets are forwarded. So why can't I forward
> the other packets (192.168.1.255, prot.: udp, sport/dport: 1025/2071)?

What happens if you try the same test as above, but with the port numbers you 
are interested in?   Do the connection tracking table and the log file 
suggest that packets are being forwarded?   If you can get it to "work" on 
port 138, I don't see why it shouldn't "work" on port 2071.

BTW: I put "work" in quotes there because although you see the packets going 
through the firewall, does the actual NetBios service allow you to browse 
Windows shares on machines on the other subnet?   My expectation is not, 
because there have been many questions on this list previously about share 
browsing across routers (Windows does network browsing using broadcast 
packets), the solution to which has always been a PDC on the source network, 
with knowledge of the second subnet.

Regards,

Antony.

-- 
I think, therefore I am.
I'm pink, therefore I'm Spam.
I drink, therefore I think I am.

                                                     Please reply to the list;
                                                           please don't CC me.


