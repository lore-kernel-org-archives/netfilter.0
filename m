From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Preventing port scanning using iptables ?
Date: Wed, 9 Aug 2006 21:28:36 -0400 (EDT)
Message-ID: <Pine.LNX.4.64.0608092126540.3385@darkstar.sysinfo.com>
References: <20060805062309.43523.qmail@web56213.mail.re3.yahoo.com>
	<44D4456C.5050203@mymail.ch>
	<02BB8A4AC86C564C89C7F14CF98CE0C40127F4@knowledge.wizdom.nu>
	<6c6b5e1c0daf49cbc42b7ecc329cc3e7@former03.de>
	<20060809084718.GA31901@torres.l21.ma.zugschlus.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060809084718.GA31901@torres.l21.ma.zugschlus.de>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Marc Haber <mh+netfilter@zugschlus.de>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Wed, 9 Aug 2006, Marc Haber wrote:

> On Sun, Aug 06, 2006 at 11:26:33AM +0200, former03 | Baltasar Cevc wrote:
>> If you want the scanner
>> to think the ports are closed, you could issue send back a port
>> unreachable packet (-j REJECT --reject-with icmp-port-unreachable)
>
> The scanner will think as well that there is a filter since a port
> with no listening service will generate a TCP RST packet. You can do
> so with iptables, but, alas, that's the same behavior you get without
> packet filter and no service on the port.


use DROP.

>
> I'd say, if you don't want a service to be visible, don't run it. No
> packet filter needed here.
>

There are various reasons to have a service available to just the inside 
or to selct places from the outside.  Your thinking is far too narrow 
here.

> Port scan protection might have a place should you decide to drop
> packets from a certain IP if you have seen a suspicious pattern from
> that IP, but that can be trivially be abused as a DoS device, and I
> generally think it is not worth the trouble.
>

Again too narrow the focus and ignores DROP.


Thanks,

Ron DuFresne
- -- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         admin & senior security consultant:  sysinfo.com
                         http://sysinfo.com
Key fingerprint = 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629

...We waste time looking for the perfect lover
instead of creating the perfect love.

                 -Tom Robbins <Still Life With Woodpecker>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQFE2ovHst+vzJSwZikRAt8iAJ4iR+dgNMzygO6+luArATrNrthY6gCgkNxk
U8eIxxil71/d27j6KxTCeS8=
=Mpdk
-----END PGP SIGNATURE-----

