From: Fabien LE BLEVEC <fleblevec@nerim.net>
Subject: Re: public ip on LAN
Date: Fri, 02 Jan 2004 18:27:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FF5A9FB.7000302@nerim.net>
References: <6.0.0.22.0.20040102224831.044036c0@amitpasari.com>
Reply-To: fleblevec@nerim.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6.0.0.22.0.20040102224831.044036c0@amitpasari.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Cc: netfilter@lists.netfilter.org


In the PREROUTING chain, you said for example :

iptables -A PREROUTING -s 203.122.51.179 -j DNAT --to 172.16.1.2
iptables -A PREROUTING -s 203.122.51.180 -j DNAT --to 172.16.1.3
....
or more accurate :
iptables -A PREROUTING -s 203.122.51.181 -p tcp --dport 80 -j DNAT --to=20
172.16.1.4
...

I think it should  be correct for your configuration.

Don't forget to authorize the traffic in the FORWARD chain .


Fabien


Amit Pasari a =E9crit :

> Thanks John,
> Let me explain
> on My LAN i have ip address - 172.16.1.1
> subnet - 255.255.0.0
> on My WAN i have ipaddress - 203.122.51.178
> subnet - 255.255.255.240
>
> Now , my clients want to have public / Live ip instead of private ips=20
> which i am giving as  many of my clients uses webserver , and other=20
> applications which people from outside world needs to access .
> I can redirect  ports for one clients but how about 10 clients wanting=20
> the same .
> So i need to give them a public ip so that all the traffic can be=20
> redirected their ip .
>
>
> Regards
> Amit
>
> At 09:54 PM 1/2/04, you wrote:
>
>> On Fri, 2004-01-02 at 11:30, Amit Pasari wrote:
>> > Hello,
>> > I am using Redhat 8.0 with iptables to provide my client internet=20
>> services
>> > . Everything is going well .
>> > i have been giving private ips of 172.16.0.0 series to my clients .
>> > But now some of my clients need public ips . i do have many public=20
>> ips with
>> > me .so can somebody tell how can i give public ips to my clients .
>> >
>> > Thanks & Regards
>> > Amit
>> > Orangeinfoways.com
>>
>> Could you please clarify what you mean by giving ips to your clients?
>> Thanks - John
>> --=20
>> John A. Sullivan III
>> Chief Technology Officer
>> Nexus Management
>> +1 207-985-7880
>> john.sullivan@nexusmgmt.com
>> ---
>> If you are interested in helping to develop a GPL enterprise class
>> VPN/Firewall/Security device management console, please visit
>> http://iscs.sourceforge.net
>
>
>
>
>



