From: "George Alexandru Dragoi" <waruiinu@gmail.com>
Subject: Re: How to use Real IP inside the LAN
Date: Mon, 6 Mar 2006 23:40:22 +0200
Message-ID: <3063e50603061340n74420423pd4aec42a57e1836@mail.gmail.com>
References: <648A21EA469E3848922D9860785CD5EF23D485@aspen-mail01.aspenview.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <648A21EA469E3848922D9860785CD5EF23D485@aspen-mail01.aspenview.org>
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
To: Jason Sigurdur <Jason.Sigurdur@aspenview.org>
Cc: netfilter@lists.netfilter.org

Sure, just DNAT without specifying tcp or udp ports.

On 3/6/06, Jason Sigurdur <Jason.Sigurdur@aspenview.org> wrote:
> Hi, I am in the same scenario. My eth0 will have a different address
> assigned by the isp, and a different internet valid pool assigned to us
> to use. The isp will route all traffic to our eth0 for the assigned
> pool.
>
> My question is that is it possible to DNAT the 'assigned' address pool
> into the Lan without having an interface with that address?
>
> Thx jason
>
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of George
> Alexandru Dragoi
> Sent: Sunday, March 05, 2006 10:56 AM
> To: Sandeep Agarwal
> Cc: netfilter
> Subject: Re: How to use Real IP inside the LAN
>
> If the ISP routed an 8 ip subnet (let's say 1.1.1.128/29) to you
> (consider having an ip on eth0 from a different pool), then  you can
> configure the ip 1.1.1.129 on eth1, with subnet mask 255.255.255.248,
> and the ips from 1.1.1.130 to 1.1.1.134 with same subnet mask above on
> the PC, VOIP device and Web Server, also enable ip_forward on the
> Linux Box with command
>
> # echo 1 > /proc/sys/net/ipv4/ip_forward
>
>  .. then it will just work.
>
> On 3/3/06, Sandeep Agarwal <sandeep_agarwal@hotmail.com> wrote:
> > Dear All,
> >
> > I have following setup.
> >
> > ISP---->|eth0|Linux Box|eth1|------>|Switch|--->PC (LAN IP)
> >                                                            |--->VOIP
> Device
> > (Cisco) (Real IP)
> >
> |--->WebServer
> > (Real IP)
> >
> > ISP has provided 8 IP Pool.
> > No DMZ configuration is there. Simple rc.firewall is working.
> > Now I want to use Real IP inside the LAN.
> > What is the right way to do this?
> >
> > Will it be worthwhile, If I make aliases like eth1:1 & assign a Real
> IP from
> > pool?
> > If this is ok, than which rules I have to add in iptables?
> >
> > Thanks
> > Sandeep
> >
> >
>
>
> --
> Bla bla
>
>


--
Bla bla

