From: Vijay Viswanathan <vijay.vishy@gmail.com>
Subject: Re: eth - NAT - Bridge - veth
Date: Fri, 27 Jun 2014 08:54:56 -0700
Message-ID: <CALPbv1-ur2xyv9MUe4UWR1ZeGZwaqgA40-J-8+H_vC58ie20bw@mail.gmail.com>
References: <CALPbv1_LnTW-F+xagDb6MU4pOgarNH6BousUbXkuzKNixXZHbA@mail.gmail.com>
	<53AD4B1F.1000705@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=EmR4XH41O2jF91A4N6EL9D+xr69XCDTPrRuaaB3rBtg=;
        b=Y4swMqlBpzD0rJtIxCwDvwl0nFm2XGFOjPUavfgQbOCRG+t4D1+t3C2kLuLO2H4iwS
         WpKKnndhpdZdKLgbfbxYdesL1Vhul1P1Zd80czKfhWkEvLnnL2A55qX37TLm3LVlRGgm
         n+OUsD3/wApu1Mz+dM20ZSlt8yuZlW5Qhp8nNuyUdZk31gW+8G5vuH/fbXFej5aY8QC9
         X0nY6e0mVos3EsCaWrV78oguIIAoG4JoI37v7RDMz3tU9MJC06hvrr8T37wHEJ4bE5cb
         UiZIqiuLJbZJgL9JzVeBhUrcjprO3FfeiI93ckPohzzDzncj2TkTAmkwx8rew5jkZ/AJ
         AG+g==
In-Reply-To: <53AD4B1F.1000705@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

I cannot use the host network for container/veth IPs, so it looks like
I need a NAT.
some comments inline

On Fri, Jun 27, 2014 at 3:44 AM, Pascal Hambourg <pascal@plouf.fr.eu.or=
g> wrote:
> Hello,
>
> Vijay Viswanathan a =C3=A9crit :
>> I have a setup where
>> lxc ( container/light weight sandbox ) brings up veth and setsup IP =
as
>> 192.168.10.2. and runs telnet server ( on port 2300 )
>>
>> I created a bridge with IP 192.168.10.2 attaching the veth.
>
> Why ?
[VV]I specify that in the container conf. It will come up with a veth
and it will attach it to the given bridge. There is very little I can
do here.
[VV]I cannot have the container come up with the host network IP ( It
has to be some private network IP)
> Note : the address on br0 is different in the output of ifconfig.
> Is 192.168.10.2 the address of the container or the host ?
container ( with vethxx )
>
>> After the route setup, the host ( with eth1: 10.4.38.222 )
>
> Note : the address on eth1 is different in the output of ifconfig.
[VV] am sorry c
>
>> is able to ping the veth ( 192.168.10.2 ) and vice versa.
>
> Vice versa ? What do you mean exactly ? What commands do you run ?
>
[VV]just ping from container to host ping 10.4.38.222

>> Now how do I connect to the telnet server on 192.168.10.2: 2300 from
>> 10.4.3x.xxx network ?
>
> Assuming the routing is properly set up on the network (i.e. hosts on
> the network or the default router have a route to 192.168.10.0/24 wit=
h
> gateway 10.4.38.182) and forwarding is enable on the host
> (net.ipv4.ip_forward=3D1), just run :
>
> $ telnet <container_address> 2300
>
[VV] This is not an option in my design. Outside world knows only the
host IP and it should route the 2300 traffic to the server in
192.168.10.2: 2300

>> I guess I need some kind of NAT rules
>
> Only as a last resort if you cannot setup proper routing on the netwo=
rk.
>
>> also tried adding :
>>
>> # brctl addif br0 eth1
>
> If you add eth1 to the bridge, then you must :
> - move the IP address from eth1 to br0,
> - use an IP address in the external network subnet for the container.
[VV] That is not an option but I tried it anyways and it worked
earlier. Now I need to move forward with the container on a non host
network :(

Thanks.
