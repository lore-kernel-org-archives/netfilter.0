From: Max Yin <max.yin@msa.hinet.net>
Subject: Re: Port range forwarding
Date: Tue, 13 Jan 2004 18:16:57 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <9E744076-45B1-11D8-BAD3-000A95DA9C9A@msa.hinet.net>
References: <200401130701.i0D71jHu017343@server5.bandwidthco.com>
Mime-Version: 1.0 (Apple Message framework v609)
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200401130701.i0D71jHu017343@server5.bandwidthco.com>
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

I'm sorry that maybe I didn't state my question more clearly.

REDIRECT target will redirect packets to firewall/router itself, but=20
what I want to do is forwarding packets from WAN to LAN, not=20
firewall/router itself. I want to implement so called virtual server=20
and want to map a port block on WAN to another port block in LAN.

If no straight forward method to do this, any suggestion where I can=20
modify to achieve this? or anybody already made a patch? :-)

Thanks in advance.
Max

=A9=F3 2004/1/13 =A4U=A4=C8 3:01 =AE=C9=A1AMark E. Donaldson =B4=A3=A8=EC=A1=
G

> I am not aware of any built-in method to take one source port block=20
> and have
> it translate straight over and in logical order to a different=20
> destination
> port block.  If I'm wrong here, I'm sure I'll be corrected.  Now, the
> "redirect" target closely resembles this functionality.  The tutorial
> describes it this way:
>
> "The --to-ports option specifies the destination port, or port range,=20=

> to
> use. Without the --to-ports option, the destination port is never=20
> altered.
> This is specified, as above, --to-ports 8080 in case we only want to=20=

> specify
> one port. If we would want to specify an port range, we would do it=20
> like
> --to-ports 8080-8090, which tells the REDIRECT target to redirect the
> packets to the ports 8080 through 8090. Note that this option is only
> available in rules specifying the TCP or UDP protocol with the=20
> --protocol
> matcher, since it wouldn't make any sense anywhere else."
>
> -----Original Message-----
> From: Max Yin [mailto:max.yin@msa.hinet.net]
> Sent: Monday, January 12, 2004 10:49 PM
> To: markee@bandwidthco.com
> Cc: netfilter@lists.netfilter.org
> Subject: Re: Port range forwarding
>
> Well, thanks for your reply.
> Since I'm doing this in uClinux, both memory and performance are=20
> limited.
> Your suggestion should work but... one setting might create hundreds =
of
> rules.
>
> So, netfilter cannot be configured to use two port ranges with the =
same
> range but different starting port number (3100-3500 to 2100-2500)?
>
>
>
> =A9=F3 2004/1/13 =A4U=A4=C8 2:26 =AE=C9=A1AMark E. Donaldson =B4=A3=A8=EC=
=A1G
>
>> I'm sure there are some better solutions available, but this should
>> work:
>>
>> i=3D3100
>> while [ "$i" -le 3500 ]
>> do
>> 	$IPT -t nat -A PREROUTING -i eth0 -j DNAT -p tcp --	dport $i
>> --to-destination 192.168.2.60:$i
>>
>> 	i=3D`expr $i + 1`
>> done
>>
>> -----Original Message-----
>> From: netfilter-admin@lists.netfilter.org
>> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Max Yin
>> Sent: Monday, January 12, 2004 4:43 AM
>> To: netfilter@lists.netfilter.org
>> Subject: Port range forwarding
>>
>> Hi,
>> I'm not sure if this question is already been asked before or not,
>> because I
>> can't find any discussion before.
>>
>> I want to setup a port forwarding rule that will translate a =
specified
>> port
>> range to another port range, for example:
>>
>> iptables -t nat -A PREROUTING -i eth0 -j DNAT -p tcp --dport =
3100:3500
>> --to-destination \ 192.168.2.60:2100-2500
>>
>> But I found that all connections from 3100 to 3500 will be mapped to
>> 2100
>> port only, not 3100 to 2100, 3101 to 2101, etc.
>>
>> So, how can I make it? or is it possible ?
>>
>> Thanks
>> Max
>>
>>
>>
>>
>
>
>


