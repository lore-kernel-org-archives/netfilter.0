From: dhottinger@harrisonburg.k12.va.us
Subject: Re: redirect
Date: Thu, 08 Mar 2007 06:34:21 -0500
Message-ID: <20070308063421.y4spggseocogsc48@mail.harrisonburg.k12.va.us>
References: <20070306094208.csonro2nwc8kogso@webmail.harrisonburg.k12.va.us>
	<45EEE4DD.9090508@gmail.com>
	<20070307115036.qfmk9u7lwkkkoskw@webmail.harrisonburg.k12.va.us>
	<45EFB4C4.9040707@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45EFB4C4.9040707@gmail.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: netfilter@lists.netfilter.org

Quoting Georgi Alexandrov <georgi.alexandrov@gmail.com>:

> dhottinger@harrisonburg.k12.va.us wrote:
>> Quoting Georgi Alexandrov <georgi.alexandrov@gmail.com>:
>>
>>> dhottinger@harrisonburg.k12.va.us wrote:
>>>> I currently redirect all traffic on port 80 to my proxy server with
>>>> $IPC -t nat -A PREROUTING -p tcp -i ! $IF --dport 80    -s !
>>>> 204.111.40.0/24 -d ! 204.111.40.0/24 -j DNAT --to-destination
>>>> $PROXY_IP:8080
>>>>
>>>> I would like to have any traffic destined for apple.com excluded from
>>>> this redirect.  I cant seem to get the syntax right.  Anyone got any
>>>> ideas?
>>> <snip*>
>>>
>>> iptables -t nat -A PREROUTING -p tcp -i $iface --dport 80 -d $apples_net
>>> -j RETURN
>>>
>>> iptables -t nat -A PREROUTING -p tcp -i $iface --dport 80 -d
>>> $another_not_to_proxy_network -j RETURN
>>>
>>> iptables -t nat -A PREROUTING -p tcp -i $iface --dport 80 -j DNAT --to
>>> $proxy:$port
> <snip*>
>>
>> Never mind.  Doesnt seem to be working.  Any other ideas?
>
> What's not working?
>
> --
> regards,
> Georgi Alexandrov
>
> key server - pgp.mit.edu :: key id - 0x37B4B3EE
> Key fingerprint =3D E429 BF93 FA67 44E9 B7D4  F89E F990 01C1 37B4 B3EE
>
>

$IPC -t nat -A PREROUTING -p tcp -i $IF --dport 80 -d 17.250.0.0
-j RETURN

Is not routing apple.com traffice away from my proxy.  Apple.com =20
traffic is still getting routed to proxy server.  I have the rule =20
placed above my dnat rule for the proxy.  Any other ideas?

thanks,
ddh
--=20
Dwayne Hottinger
Network Administrator
Harrisonburg City Public Schools


