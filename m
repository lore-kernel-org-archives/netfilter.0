From: "former03 | Baltasar Cevc" <baltasar.cevc@former03.de>
Subject: Re: Howto access modem behind router
Date: Thu, 26 Oct 2006 17:53:01 +0200
Message-ID: <f4a92e196d29239919190685a041d19d@former03.de>
References: <453D34CD.904@kromo.org> <453E55FF.7000705@kromo.org>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <453E55FF.7000705@kromo.org>
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
Content-Type: text/plain; charset="macroman"; format="flowed"
To: netfilter@lists.netfilter.org

Victor,

On 24.10.2006, at 20:05, Victor Toni wrote:
> Victor Toni wrote:
>> Hello,
>>
>> I have one of these modems which is a router by itself. The modem is
>> configured to work in bridged mode.
>> Connected to the modem is a router which connects via pppoe via the
>> modem with my ISP.
>>
>>    |<---------- PPPOE link ------------->|
>>    |                                     |    |=3D=3D=3D=3D=3D=3D
>>   ISP =3D=3D=3D=3D=3D=3D=3D bridged =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D WRT =3D=3D=3D=3D=3D=3D=3D=3D=3D PCs
>>                modem |                 |   |  |=3D=3D=3D=3D=3D=3D
>>                      |                 |   |
>>                      |<- 169.254.1.x ->|   |<-- 192.168.1.x -->>
>>
>>
>>
>> The modem has a web interface and and telnet which I would like to
>> connect to from within the LAN but this doesn't seem to work.

>> I have currently some trouble with my connection and would like to=20
>> use a
>> tool to monitor the modem's error status but this fails due to the
>> configuration.
>> The modem has the static IP 169.254.1.1 and the router has the static
>> IPs 169.254.1.100 and 192.168.1.1.
>> I can ping "169.254.1.100" from any LAN machine on 192.168.1.0/24 but
>> that's it.

You should provide the relevant rulesets (iptables -L -v;
iptables -L -v -t nat). If you can ping the modem from a client
in the LAN, the routing seems to be working, as well as the
NAT (if needed).
You'll probably have to add some rule to the forwarding filter; but
that's impossible to tell without knowing your current setup.

While I don't think that's the problem, just a little warning: the
IPs on the modem segment are from the linklocal net, and are not
meant to be routed - see RFC 3927: "[...]valid for communication
with other devices connected to the same physical (or logical) link".

Baltasar


_____ former 03 gmbh
_____ infanteriestra=DFe 19 haus 6 eg
_____ 80797 muenchen

_____ baltasar.cevc@former03.de
_____ www.former03.de

_____ fon 0941.206.6952
_____ fax 089.322112.11
_____ mobil 0176.232.20.822


