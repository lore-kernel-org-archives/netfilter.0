From: "ArcosCom Linux User" <linux@arcoscom.com>
Subject: Re: Please help with my bridge/router
Date: Tue, 13 Mar 2007 12:41:55 +0100 (CET)
Message-ID: <46040.195.55.244.106.1173786115.squirrel@www.arcoscom.com>
References: <20070312221935.55027.qmail@web50411.mail.re2.yahoo.com>
	<45F656CA.7080104@zoomnet.ro>
Reply-To: linux@arcoscom.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45F656CA.7080104@zoomnet.ro>
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

Note: take care that it will be used into "mangle" table.

iptables -t mangle -A FORWARD -p tcp --tcp-flags SYN,RST SYN \
                   -j TCPMSS --clamp-mss-to-pmtu


El Mar, 13 de Marzo de 2007, 8:46, Alexandru Dragoi escribi=F3:
> Serge Matovic wrote:
>> Hi to all. I'm a bit hesitant to bug you with this
>> basic problem of mine, and I just hope that I'm not
>> wasting your time.
>> OK, here is the situation. I have a Linux machine with
>> 4 NICs. I have configured 3 of these NICs into a
>> bridge (br0), and the 4th NIC is connected to an ADSL
>> modem (ppp0), which, in turn, is connected to
>> Internet. This NIC is getting a DHCP address from my
>> ISP. I'm using the iptable script from dranch's
>> IP-MASQ-HOWTO. (and I tried many other ones, as well).
>>
>> Now here is the problem: When I try to go Internet
>> from my Client computer (connected to one of the 3
>> NICs of this bridge/router) some sites (like
>> Google.ca) connect and work perfectly, ***BUT*** some
>> sites (like globaltv.com) do not load at all. But I
>> know that they work fine when I connect to them
>> without going thru my bridge/router.
>>
>> Does anyone have a thought on why some sites work and
>> some don't?
>>
>> Many thanks, and best regards,
>> serge.
>>
>>
>>
>>
>> ________________________________________________________________________=
____________
>> Never miss an email again!
>> Yahoo! Toolbar alerts you the instant new Mail arrives.
>> http://tools.search.yahoo.com/toolbar/features/mail/
>>
>>
> Try:
>
> iptables -I FORWARD -j TCPMSS  -o ppp0 -p tcp --tcp-flags SYN,RST SYN
> --clamp-mss-to-pmtu
>
>
> In the man table of iptables you can see the explanation too.
>
>



