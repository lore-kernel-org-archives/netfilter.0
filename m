From: srg <srgqwerty@telefonica.net>
Subject: Re: MAC addresses
Date: Mon, 13 Sep 2004 20:03:58 +0000
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4145FD2E.8060603@telefonica.net>
References: <200409111150.50506.bulliver@badcomputer.no-ip.com>	<20040911220159.4cee40bb@oldskool.actisystem.nix>
	<1095079543.6971.1.camel@nostromo.bgsecm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1095079543.6971.1.camel@nostromo.bgsecm.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Also, note that if a router exits between your ssh clientS and your ssh=20
server then ALL ssh incoming connections from different clients will be=20
seen with the same source mac addr of the router (of course, each of the=20
connections will have different src ip (if NO nat is done in the router)).

Jose Maria Lopez wrote:

>El s=C3=A1b, 11 de 09 de 2004 a las 22:01, active escribi=C3=B3:
> =20
>
>>On "Sat 11 of September 2004" Darren Kirby wrote:
>>
>>   =20
>>
>>>Are MAC addresses unique for all ethernet cards? What I would like to
>>>know is could I use this rule to allow ssh connections ONLY from my
>>>notebook no matter what its current IP address happens to be, and drop
>>>all other connection requests?
>>>     =20
>>>
>>Yes. MAC addresses are set in the card by the manufacturer. This is a
>>good method to control input traffic.
>>
>>For more info: http://www.webopedia.com/TERM/M/MAC_address.html
>>   =20
>>
>
>But have in mind that some operating systems let you change the
>MAC address of the card. By example, Linux let you do that, and
>that can fool some kinds of traffic control.
>
>
> =20
>


