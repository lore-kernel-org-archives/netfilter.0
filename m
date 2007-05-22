From: Marius-Iulian Corici <marius-iulian.corici@fokus.fraunhofer.de>
Subject: Re: NAT addresses - RFC or tradition?
Date: Tue, 22 May 2007 20:02:35 +0000
Message-ID: <46534C5B.7020303@fokus.fraunhofer.de>
References: <001c01c79ca7$0c1717e0$5a05a8c0@nisgaa.net>	<200705221646.25925.ramoni@databras.com.br>
	<20070522195618.M46626@tkevans.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070522195618.M46626@tkevans.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

rfc 1918
Tim Evans wrote:
> On Tue, 22 May 2007 16:46:25 -0300, Andre Guimar=E3es wrote
>  =20
>> It's quite simple.
>> You're using public IPs in your internal networks.
>> Some of these IPs may exist and have an owner an maybe even a web site.
>> You'll be in trouble in the day you wish to acess one of these IPs=20
>> on the internet because you won't reach them because you have them=20
>> on your network and so won't route the packets to the internet.
>>    =20
>
> In other words, the RFC addresses are specifically for use in internal
> networks, since they are guaranteed not to be used on the public intern=
et, and
> not routed to by any public internet router.
> --
> Tim Evans, TKEvans.com, Inc.    |    5 Chestnut Court
> tkevans@tkevans.com             |    Owings Mills, MD 21117
> http://www.tkevans.com/         |    443-394-3864
> http://www.come-here.com/News/  |
>
>
>  =20


