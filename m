From: "George Alexandru Dragoi" <waruiinu@gmail.com>
Subject: Re: How to use Real IP inside the LAN
Date: Sun, 5 Mar 2006 19:55:41 +0200
Message-ID: <3063e50603050955r5a8665d3rb8ae51dd8fa6ca7c@mail.gmail.com>
References: <BAY20-DAV63F1C2B14037920885A9497EA0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY20-DAV63F1C2B14037920885A9497EA0@phx.gbl>
Content-Disposition: inline
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
To: Sandeep Agarwal <sandeep_agarwal@hotmail.com>
Cc: netfilter <netfilter@lists.netfilter.org>

If the ISP routed an 8 ip subnet (let's say 1.1.1.128/29) to you
(consider having an ip on eth0 from a different pool), then  you can
configure the ip 1.1.1.129 on eth1, with subnet mask 255.255.255.248,
and the ips from 1.1.1.130 to 1.1.1.134 with same subnet mask above on
the PC, VOIP device and Web Server, also enable ip_forward on the
Linux Box with command

# echo 1 > /proc/sys/net/ipv4/ip_forward

 .. then it will just work.

On 3/3/06, Sandeep Agarwal <sandeep_agarwal@hotmail.com> wrote:
> Dear All,
>
> I have following setup.
>
> ISP---->|eth0|Linux Box|eth1|------>|Switch|--->PC (LAN IP)
>                                                            |--->VOIP Devi=
ce
> (Cisco) (Real IP)
>                                                            |--->WebServer
> (Real IP)
>
> ISP has provided 8 IP Pool.
> No DMZ configuration is there. Simple rc.firewall is working.
> Now I want to use Real IP inside the LAN.
> What is the right way to do this?
>
> Will it be worthwhile, If I make aliases like eth1:1 & assign a Real IP f=
rom
> pool?
> If this is ok, than which rules I have to add in iptables?
>
> Thanks
> Sandeep
>
>


--
Bla bla

