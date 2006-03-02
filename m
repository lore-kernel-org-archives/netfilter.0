From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: how to connect to VPN server using IPTABLES nat
Date: Thu, 2 Mar 2006 12:45:08 +0100 (CET)
Message-ID: <63794.193.173.147.3.1141299908.squirrel@webmail.sterenborg.info>
References: <43a0cdcb0603020246n4da19616p@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43a0cdcb0603020246n4da19616p@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


On Thu, March 2, 2006 11:46, Buddy wu wrote:
>    I DON'T mean there is a VPN serving making from linux.
>    The fact is that:
>    I set up a VPN server using windows server(IP:192.168.1.1) and it
> is behind a Linux server which is using iptables for nat
>    iptables -A PREROUTING -d 218.0.0.0 -j DNAT --to 192.168.1.1
>
>    but I can't establish the VPN connection from out(etc IP address is
> 218.10.0.1, I have tested that I can connect to other service such as
> web(port 80). How can I establish the VPN connection ? Is there need
> some setting in IPTABLES?

If it's Windows then I suspect it's a PPTP server.
For this to work you have to forward both 1723/tcp and the gre (47) proto=
col.
Also, you need the pptp conntrack/nat modules for which you may have to
recompile the kernel and iptables.


Gr,
Rob



