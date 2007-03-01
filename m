From: "Andrew Kraslavsky" <andykras@hotmail.com>
Subject: Re: Blocking direct private IP address
Date: Wed, 28 Feb 2007 19:12:18 -0800
Message-ID: <BAY119-F26E778C8C143FF9F0EBA49D6800@phx.gbl>
References: <Pine.LNX.4.61.0703010033510.23355@yvahk01.tjqt.qr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0703010033510.23355@yvahk01.tjqt.qr>
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
Content-Type: text/plain; format=flowed; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: jengelh@linux01.gwdg.de
Cc: netfilter@lists.netfilter.org

>From: Jan Engelhardt <jengelh@linux01.gwdg.de>
>To: Andrew Kraslavsky <andykras@hotmail.com>
>CC: netfilter@lists.netfilter.org
>Subject: Re: Blocking direct private IP address
>Date: Thu, 1 Mar 2007 00:35:14 +0100 (MET)
>
>
>On Feb 28 2007 15:20, Andrew Kraslavsky wrote:
> >
> > If I set up a host on the external/public network with a static route=20
>that
> > causes it to send traffic addressed to 192.168.0.0/24 to the 10.0.0.1
> > external/public IP address of the firewall/router and then attempt to=20
>access
> > the Web server using 192.168.0.99 as the address, these directly=20
>addressed
> > packets get through the firewall.
>
>I did not find the question in your mail, but:
>
>Activate "rp_filter", and any hosts on 10.0.0.0/24 that uses a
>non-10.0.0.0/24 address as source will be ignored.
>
>
>Jan
>--

Thanks for the pointer but the question here is about the destination IP=20
address, not the source.

When I create the DNAT rule, the private IP address to which I want my=20
public address to map suddenly becomes directly accessible to hosts on the =

public network.

I.e. I want hosts on the public network to _have_to_ send traffic to the=20
public IP of 10.0.0.1 but, after adding that rule, they can actually send=20
traffic to that address _AND_ also directly to the private IP address of th=
e=20
Web server at 192.168.0.99.

_________________________________________________________________
Find a local pizza place, movie theater, and more=85.then map the best rout=
e!=20
http://maps.live.com/?icid=3Dhmtag1&FORM=3DMGAC01


