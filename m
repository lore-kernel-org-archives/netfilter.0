From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: Issues with MASQUARDE and FreeBSD router.
Date: Thu, 27 Aug 2015 10:56:44 +0300
Message-ID: <55DEC2BC.8030800@ngtech.co.il>
References: <55DDEA51.8010902@ngtech.co.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <owner-freebsd-net@freebsd.org>
In-reply-to: <55DDEA51.8010902@ngtech.co.il>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.freebsd.org/mailman/options/freebsd-net>,
 <mailto:freebsd-net-request@freebsd.org?subject=unsubscribe>
List-Archive: <http://lists.freebsd.org/pipermail/freebsd-net/>
List-Post: <mailto:freebsd-net@freebsd.org>
List-Help: <mailto:freebsd-net-request@freebsd.org?subject=help>
List-Subscribe: <https://lists.freebsd.org/mailman/listinfo/freebsd-net>,
 <mailto:freebsd-net-request@freebsd.org?subject=subscribe>
Errors-To: owner-freebsd-net@freebsd.org
Sender: owner-freebsd-net@freebsd.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: freebsd-net@freebsd.org

I added a filter rule to iptables with a INVALID reject match and any 
packet that is being passed throw the FreeBSD router is being marked by 
itpables as INVALID.
An example for an INVALID packet:
http://ngtech.co.il/nat_issue/proxy2.pcap

Eliezer

On 26/08/2015 21:24, Eliezer Croitoru wrote:
> Hey lists,
>
> I had a similar issue in the past but now I have found the combination
> which results in the issue.
> My topology is between two KVM hosts.
> Server is on KVM1 ip address 192.168.10.1/24
> Another whole network on the KVM2.
> And the traffic is:
> client 192.168.11.2/24 --> R1 - 192.168.11.254/24
> R1 192.168.15.1/24 --> R2(NAT SERVER) 192.168.15.254/24
> R3 eth4 NATed(masquerade) 192.168.10.179/24 --> Server 192.168.10.1/24
>
> The Above is what is suppose to happen and the reality us that
> 192.168.10.1 receives a packet but from 192.168.11.2.
>
> I can reproduce the issue successfully replacing the R1 server from a
> linux box to a FreeBSD 10.1 box.(freebsd causes the issue)
> The routers I have used are:
> CentOS 7
> VYOS 1.6
>
> It is the same for both and I can reproduce the issue successfully.
>
> I have also tested the R1 replaced with:
> VYOS 1.7
> CENTOS 7
> DEBIAN 8
> vSRX
> FreeBSD 4.11 with e1000 card, works fine.
> FreeBSD 10.1(amd64) with e1000 card, works fine.
> *FreeBSD 10.1(amd64) with virtio card, have an issue.*
>
> Now I am trying to figure out if it's a netfilter issue or FreeBSD
> virtio driver issue and if so what might be the direction to make this
> issue fixed.
>
> Tcpdump captures on the NAT router of different packets and sessions are
> here:
> http://ngtech.co.il/nat_issue/
>
> If the issue is probably with the FreeBSD virtio drivers why would the
> MASQUERADE pass the packet to the destination server?
>
> Thanks,
> Eliezer
>
>
>

_______________________________________________
freebsd-net@freebsd.org mailing list
https://lists.freebsd.org/mailman/listinfo/freebsd-net
To unsubscribe, send any mail to "freebsd-net-unsubscribe@freebsd.org"
