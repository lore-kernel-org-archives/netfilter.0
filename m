From: =?ISO-8859-1?Q?Antonio_P=E9rez?= <aperlu@telefonica.net>
Subject: Re: layer7 problem
Date: Wed, 24 Aug 2005 11:30:06 +0200
Message-ID: <430C3E1E.6060703@telefonica.net>
References: <430BC558.8000406@telefonica.net> <430C3676.30904@mnemon.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <430C3676.30904@mnemon.de>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Cc: netfilter@lists.netfilter.org

J=F6rg Harmuth wrote:

>Antonio P=E9rez schrieb:
> =20
>
>>Hello,
>>I want to use layer7 in my linux box. I have the 2.6.12.5 kerner version
>>and the 1.3.3 iptables version. I patched the kernel and the iptables
>>with kernel-2.6.11-layer7-1.4.patch, linux-2.6.9-imq1.diff,
>>iptables-1.3.0-imq1.diff and iptables-layer7-1.4.patch.
>>When i run:
>>iptables -t mangle -A POSTROUTING -m layer7 --l7proto http -j MARK
>>--set-mark 3
>>no error show, but when i do:
>>iptables -t mangle -L -v
>>pkts bytes target     prot opt in     out     source             =20
>>destination
>>   0     0 MARK       all  --  any    any     anywhere           =20
>>anywhere            LAYER7 l7proto http MARK set 0x3
>>the packets marked always is 0.
>>   =20
>>
>
>There are several possibilities - in theory. Taken from http.pat:
>
># this intentionally catches the response from the server
># rather than the request so that other protocols which use
># http (like kazaa) can be caught based on specific http requests
># regardless of the ordering of filters...
># also matches posts
>
>So, if the pattern catches the *server* response, it will be in the 5th
>packet of the connection (3 packets handshake, request, response) and
>this packet will not pass POSTROUTING. It will pass PREROUTING, as it is
>an incoming packet. Thus the best bet is to move your rule accordingly
>or simply add it in PREROUTING.
>
>HTH and have a nice time,
>
>Joerg
>
> =20
>

Hi Joerg,

 Thanks for your reply, I also tried PREROUTING and also many different=20
protocols, not only http and the problem remains the same, everything=20
seems to work properly, no errors, but the number of marked packets=20
remains empty.
 Any idea will be apreciated, thanks.

Antonio.

