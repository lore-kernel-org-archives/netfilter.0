From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: Messages in log with SNAT target
Date: Mon, 24 Jul 2006 13:33:29 +0200
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C40127D9@knowledge.wizdom.nu>
References: <44C4903B.3080004@gmail.com> <44C49FC6.6030504@plouf.fr.eu.org>
	<44C4A904.4010403@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Anssi Hannula <anssi.hannula@gmail.com>, netfilter@lists.netfilter.org

The security risk is, and it is a MAJOR one, especially with WiFi =
networks is that any PC on the network could just be set up with a =
private IP on your private network, start sniffing for passwords etc.
=20
It's a very, very bad idea to put your public and private WiFi =
infratructure on the same physical network.
I would say, there's even no point in firewalling this. Firewalling is =
seperating, you are combining.
=20
-Sietse

________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of Anssi Hannula
Sent: Mon 24-Jul-06 13:03
To: netfilter@lists.netfilter.org
Subject: Re: Messages in log with SNAT target



Pascal Hambourg wrote:
> Hello,

Hi, and thank you very much for your thorough answer.

> Anssi Hannula a =E9crit :
>
>>
>> I've been using this kind of configuration on my Linux router for a =
few
>> years:
>>
>> eth0    80.223.77.223, public internet ip
>> eth0:0    10.0.0.1, private network ip
>
>
> You know that having both internet and a private LAN on the same
> interface is a *very* bad idea, don't you ? I suppose you have no =
other
> choice.

Oops, I didn't know :((

Is the bad part on it having both of them on the same physical network,
or only the fact that they are on the same interface?

Then again, this is a wireless network where some hosts have
public+private IPs and some hosts private IPs, so I guess it would be
pretty non-practical to have two interfaces on every system which I want
to have public IP too.

What is the security risk here, exactly?

>> IP forwarding enabled.
>>
>> And a rule for iptables:
>> -A POSTROUTING -s 10.0.0.0/255.255.255.0 -d ! 10.0.0.0/255.255.255.0 =
-j
>> SNAT --to-source 80.223.77.223
>>
>> Kernel IP routing table
>> Destination     Gateway         Genmask         Flags Metric Ref =20
>> Use Iface
>> 10.0.0.0        0.0.0.0         255.255.255.0   U     10     0     =20
>> 0 eth0
>> 80.223.64.0     0.0.0.0         255.255.240.0   U     10     0     =20
>> 0 eth0
>> 0.0.0.0         80.223.64.1     0.0.0.0         UG    10     0     =20
>> 0 eth0
>>
>> However, I get lots of this kind of messages in the dmesg while =
routing:
>> host 10.0.0.4/if2 ignores redirects for 70.35.xxx.xxx to 80.223.64.1.
>
> [and so on]
>
> Here's what happens. On your router box, all routes use the same
> interface eth0, so when it receives a packet for another destination
> than the box itself, it sends an "ICMP Redirect" message to the source
> IP address meaning "hey, there is a more direct route to destination
> 70.35.x.x using gateway 80.223.64.1 instead of me. Please update your
> routing table".
>
> Happily, the 1.0.0.4 host ignores the "ICMP Redirect" messages. One
> reason is I think that's a default behaviour of Windows NT. Another
> reason is that host has probably no direct route to the proposed =
gateway
> address. Anyway, if it didn't ignore the "ICMP Redirect", it would
> probably lose connectivity with internet hosts because of its private
> address.
>
> Note : destination NAT (DNAT) on the same network blocks the sending =
of
> "ICMP Redirect" messages by the routing decision, because destination
> NAT takes place before the routing decision. But source NAT (SNAT,
> MASQUERADE) doesn't, because it takes place after the routing =
decision,
> so it's too late (see Netfilter diagram in
> http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO.txt).
>
> You can enable or disable the sending of "ICMP Redirect" messages with
> the kernel parameter send_redirect.
>
> send_redirects - BOOLEAN
>      Send redirects, if router.
>      send_redirects for the interface will be enabled if at least one =
of
>      conf/{all,interface}/send_redirects is set to TRUE,
>      it will be disabled otherwise
>      Default: TRUE
>
> To disable sending "ICMP redirect" on eth0 :
>
> echo 0 > /proc/sys/net/ipv4/conf/all/send_redirects
> echo 0 > /proc/sys/net/ipv4/conf/eth0/send_redirects
>
> or :
>
> sysctl -w net/ipv4/conf/all/send_redirects=3D0
> sysctl -w net/ipv4/conf/eth0/send_redirects=3D0


--
Anssi Hannula





