From: Sertys <sertys@supportivo.org>
Subject: Re: mysterious dropped echo replies
Date: Wed, 1 Jun 2005 08:43:38 +0000 (UTC)
Message-ID: <opsrquba1976nf2y@xonix>
References: <1117528956.25434.65.camel@athene.bestsolution.at>
	<opsrozalyc76nf2y@xonix> <opsrozlyy176nf2y@xonix>
	<1117539228.25434.82.camel@athene.bestsolution.at>
	<opsro6aifo76nf2y@xonix> <20050601022233.GA6992@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Date: Thu, 02 Jun 2005 15:58:12 +0300
In-Reply-To: <20050601022233.GA6992@bender.817west.com>
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
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: Netfilter list <netfilter@lists.netfilter.org>

My bad.....

On Tue, 31 May 2005 22:22:33 -0400, Jason Opperisano <opie@817west.com> =20
wrote:

> On Wed, Jun 01, 2005 at 06:21:44PM +0300, Sertys wrote:
>> Well , this line :
>> iptables -t nat -A Cid3D99741E.0   -d 192.168.100.0/24 -j RETURN
>>
>> change it to -j DROP and it wont generate any replies. -j RETURN, =20
>> returns
>> the packet and sends and icmp message to the src!
>
> RETURN returns the packet to the calling chain, or enforces the
> root chain's POLICY if there is no calling chain to return to.
> your description matches what REJECT does, not RETURN.
>
> -j
>
> --
> "Stewie: Damn the toilet. It's made slaves of you all. It just
>  sits there consuming other people's feces while contributing nothing
>  of its own to society."
>         --Family Guy



--=20
www.supportivo.org

I can't stop myself checking for pigs in the outlets. Everybody thinks i'=
m =20
a punk, cause of the hairstyle(220V).
end

