From: Max Yin <max.yin@msa.hinet.net>
Subject: Re: Port range forwarding
Date: Tue, 13 Jan 2004 14:49:11 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <983D227A-4594-11D8-BAD3-000A95DA9C9A@msa.hinet.net>
References: <200401130626.i0D6QwHu016929@server5.bandwidthco.com>
Mime-Version: 1.0 (Apple Message framework v609)
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200401130626.i0D6QwHu016929@server5.bandwidthco.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="big5"; format="flowed"
To: markee@bandwidthco.com
Cc: netfilter@lists.netfilter.org

Well, thanks for your reply.
Since I'm doing this in uClinux, both memory and performance are=20
limited. Your suggestion should work but... one setting might create=20
hundreds of rules.

So, netfilter cannot be configured to use two port ranges with the same=20=

range but different starting port number (3100-3500 to 2100-2500)?



=A9=F3 2004/1/13 =A4U=A4=C8 2:26 =AE=C9=A1AMark E. Donaldson =B4=A3=A8=EC=A1=
G

> I'm sure there are some better solutions available, but this should=20
> work:
>
> i=3D3100
> while [ "$i" -le 3500 ]
> do
> 	$IPT -t nat -A PREROUTING -i eth0 -j DNAT -p tcp --	dport $i
> --to-destination 192.168.2.60:$i
>
> 	i=3D`expr $i + 1`
> done
>
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Max Yin
> Sent: Monday, January 12, 2004 4:43 AM
> To: netfilter@lists.netfilter.org
> Subject: Port range forwarding
>
> Hi,
> I'm not sure if this question is already been asked before or not,=20
> because I
> can't find any discussion before.
>
> I want to setup a port forwarding rule that will translate a specified=20=

> port
> range to another port range, for example:
>
> iptables -t nat -A PREROUTING -i eth0 -j DNAT -p tcp --dport 3100:3500
> --to-destination \ 192.168.2.60:2100-2500
>
> But I found that all connections from 3100 to 3500 will be mapped to=20=

> 2100
> port only, not 3100 to 2100, 3101 to 2101, etc.
>
> So, how can I make it? or is it possible ?
>
> Thanks
> Max
>
>
>
>


