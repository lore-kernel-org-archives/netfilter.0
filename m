From: Oliver Freyermuth <freyermuth@physik.uni-bonn.de>
Subject: Re: Running an active/active firewall/router (xt_cluster?)
Date: Mon, 10 May 2021 23:55:17 +0200
Message-ID: <4113e9ec-225e-75d5-b221-996c00f9b060@physik.uni-bonn.de>
References: <3a995078-6bdf-f1c6-0a88-bc56fca55714@physik.uni-bonn.de>
 <CAPJdpdAyqmKtRnnKDqyEOSnpVVJMNMdYjyuT7dNL+6CNDLwB6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256; boundary="------------ms050505070603040305030006"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=physik.uni-bonn.de; s=mail;
        bh=wN3u6Mbt4Ej9J/KeirHTOCQcp1S1JL+Mqy0LaSRxMuE=;
        h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To
        :Subject; b=dFcEuCmM7rsMm5mdMxf9gkYOPJQv8np9+JTy7L7TUogOfvaiNzSL9GwZwNdc3B/bg
        giVdYAzx1pxp2zBDAn4ocBfHxZNNMBIxmDOnDRrCM+8SfobdlM+vxdtJfko0B2fdnY7Sd1DYblEQj
        /EiWt//WDPt+12MEJYDToYs81G/Cg=
In-Reply-To: <CAPJdpdAyqmKtRnnKDqyEOSnpVVJMNMdYjyuT7dNL+6CNDLwB6Q@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
To: Paul Robert Marino <prmarino1@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

This is a cryptographically signed message in MIME format.

--------------ms050505070603040305030006
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Hey Paul,

many thanks for the detailed reply!
Some comments inline.

Am 10.05.21 um 18:57 schrieb Paul Robert Marino:
> hey Oliver,
> I've done similar things over the years, a lot of fun lab experiments
> and found it really it comes down to a couple of things.
> I did some POC testing with contrackd and some experimental code
> around trunking across multiple firewalls with a sprinkling of
> virtualization.
> There were a few scenarios I tried, some involving OpenVSwitch
> (because I was experimenting with SPBM) and some not, with contrackd
> similarly configured.
> All the scenarios were interesting but they all had relatively rare on
> slow (<1Gbs) network issues that grew exponentially in frequency on
> higher speed networks (>1Gbs) with latency in contrackd syncing.

Indeed, we'd strive for ~20 Gb/s in our case, so this experience surely i=
s important to hear about.

> What i found is the best scenario was to use Quagga for dynamic
> routing to load balance the traffic between the firewall IP's,
> keepalived to load handle IP failover, and contrackd (in a similar
> configuration to the one you described) to keep the states in sync
> there are a few pitfalls in going down this route caused by bad and or
> outdated documentation for both Quagga and keepalived. I'm also going
> to give you some recommendations about some hardware topology stuff
> you may not think about initially.

I'm still a bit unsure if we are on the same page, but that may just be c=
aused by my limited knowledge of Quagga.
To my understanding, Quagga uses e.g. OSPF and hence can, if the routes h=
ave the same path, load-balance.

However, in our case, we'd want to go for active/active firewalls (which =
of course are also routers).
But that means we have internal machines on one side, which use a single =
default gateway (per VLAN),
then our active/active firewall, and then the outside world (actually a P=
tP connection to an upstream router).

Can Quagga help me to actively use both firewalls in a load-balancing and=
 redundant way?
The idea here is that the upstream router has high bandwidth, so using mo=
re than one firewall allows to achieve better throughput,
and with active/active we'd also strive for redundancy (i.e. reduced thro=
ughput if one firewall fails).
To my understanding, OSPF / Quagga could do this if the firewalls are pla=
ced between routers also joining via OSPF.
But is there also a way to have the clients directly talk to our firewall=
s, and the firewalls to a single upstream router (which we don't control)=
?

A simple drawing may help:

              ____  FW A ____
             /               \
Client(s) --                 --PtP-- upstream router
             \____  FW B ____/

This is why I thought about using xt_cluster and giving both FW A and FW =
B the very same IP (the default gateway of the clients)
and the very same MAC at the same time, so the switch duplicates the pack=
ets, and then FW A accepts some packets and FW B the remaining ones
via filtering with xt_cluster.

Can Quagga do something in this picture, or simplify this picture?
The upstream router also sends all incoming packets to a single IP in the=
 PtP network, i.e. the firewall nodes need to show up as "one converged s=
ystem"
to both the clients on one side and the upstream router on the other side=
=2E

> I will start with Quagga because the bad documentation part is easy to =
cover.
> in the Quagga documentation they recommend that you put a routable IP
> on a loopback interface and attach Quagga the daemon for the dynamic
> routing service of your choice to it, That works fine on BSD and old
> versions of Linux from 20 years ago but any thing running a Linux
> kernel version of 2.4 or higher will not allow it unless you change
> setting in /etc/sysctrl.conf and the Quagga documentation tells you to
> make those changes. DO NOT DO WHAT THEY SAY, its wrong and dangerous.
> Instead create a "dummy" interface with a routable IP for this
> purpose. a dummy interface is a special kind of interface meant for
> exactly the scenario described and works well without compromising the
> security of your firewall.

Thanks for this helpful advice!
Even though I am not sure yet Quagga will help me out in this picture,
I am now already convinced we will have a situation in which Quagga will =
help us out.
So this is noted down for future use :-).

> Keepalived
> the main error in keepalived's documentation is is most of the
> documentation and howto's you will find about it on the web are based
> on a 15 year old howto which had a fundamental mistake in how VRRP
> works, and what the "state"  flag actually does because its not
> explained well in the man file. "state" in a "vrrp_instance" should
> always be set to "MASTER" on all nodes and the priority should be used
> to determine which node should be the preferred master. the only time
> you should ever set state to "BACKUP" is if you have a 3rd machine
> that you never want to become the master which you are just using for
> quorum and in that case its priority should also be set to "0"
> (failed) . setting the state to "BACKUP" will seem to work fine until
> you have a failover event when the interface will continually go ip
> and done on the backup node. on the mac address issue keepalived will
> apr ping the subnets its attached to so that's generally not an issue
> but I would recommend using vmac's (virtual mac addresses) assuming
> the kernel for your distro and your network cards support it because
> that way it just looks to the switch like it changed a port due to
> some physical topology change and switches usually handle that very
> gracefully, but don't always handle the mac address change for IP
> addresses as quickly.
> I also recommend reading the RFC's on VRRP particularly the parts that
> explain how the elections and priorities work, they are a quick and
> easy read and will really give you a good idea of how to configure
> keepalived properly to achieve the failover and recovery behavior you
> want.

See above on the virtual MACs =E2=80=94 if the clients should use both fi=
rewalls at the same time,
I think I'd need a single MAC for both, so the clients only see a single =
default gateway.
In a more classic setup, we've used pcs (pacemaker and corosync) to succe=
ssfully migrate virtual IPs and MAC addresses.
It has worked quite reliable (using Kronosnet for communication).
But we've also used Keepalived some years ago successfully :-).

> On the hardware topology
> I recommend using dedicated interfaces for contrackd, really you don't
> need anything faster than 100Mbps even if the data interfaces are
> 100Gbps but i usually use 1 Gbps interfaces for this. they can be on
> their own dedicated switches or crossover interfaces. the main concern
> here is securely handling a large number of tiny packets so having
> dedicated network card buffers to handle microburst  is useful and if
> you can avoid latency from a switch that's trying to be too smart for
> its own good that's for the best.

Indeed, we have 1 Gb/s crossover link, and use a 1 Gb/s connection throug=
h a switch in case this would ever fail for some reason =E2=80=94
we use these links both for conntrackd and for Kronosnet communication by=
 corosync.

> For keepalived use dedicated VLAN's on each physical interface to
> handle the heartbeats and group the VRRP interfaces. to insure the
> failovers of the IP's on both sides are handled correctly.
> If you only have 2 firewalls I recommend using a an additional device
> on each side for quorum in a backup/failed mode as described above.
> Assuming a 1 second or greater interval the device could be something
> as simple as a Raspberry PI it really doesn't need to be anything
> powerful because its just adding a heartbeat to the cluster, but for
> sub second intervals you may need something more powerful because sub
> second intervals can eat a surprising amount of CPU.

We currently went without an external third party and let corosync/pacema=
ker use a STONITH device to explicitly kill the other node
and establish a defined state if heartbeats get lost. We might think abou=
t a third machine at some point to get an actual quorum, indeed.

Cheers and thanks again,
	Oliver

>=20
>=20
> On Sun, May 9, 2021 at 3:16 PM Oliver Freyermuth
> <freyermuth@physik.uni-bonn.de> wrote:
>>
>> Dear netfilter experts,
>>
>> we are trying to setup an active/active firewall, making use of "xt_cl=
uster".
>> We can configure the switch to act like a hub, i.e. both machines can =
share the same MAC and IP and get the same packets without additional ARP=
tables tricks.
>>
>> So we set rules like:
>>
>>    iptables -I PREROUTING -t mangle -i external_interface -m cluster -=
-cluster-total-nodes 2 --cluster-local-node 1 --cluster-hash-seed 0xdeadb=
eef -j MARK --set-mark 0xffff
>>    iptables -A PREROUTING -t mangle -i external_interface -m mark ! --=
mark 0xffff -j DROP
>>
>> Ideally, it we'd love to have the possibility to scale this to more th=
an two nodes, but let's stay with two for now.
>>
>> Basic tests show that this works as expected, but the details get mess=
y.
>>
>> 1. Certainly, conntrackd is needed to synchronize connection states.
>>      But is it always "fast enough"?
>>      xt_cluster seems to match by the src_ip of the original direction=
 of the flow[0] (if I read the code correctly),
>>      but what happens if the reply to an outgoing packet arrives at bo=
th firewalls before state is synchronized?
>>      We are currently using conntrackd in FTFW mode with a direct link=
, set "DisableExternalCache", and additonally set "PollSecs 15" since wit=
hout that it seems
>>      only new and destroyed connections are synced, but lifetime updat=
es for existing connections do not propagate without polling.
>>      Maybe another way which e.g. may use XOR(src,dst) might work arou=
nd tight synchronization requirements, or is it possible to always uses t=
he "internal" source IP?
>>      Is anybody doing that with a custom BPF?
>>
>> 2. How to do failover in such cases?
>>      For failover we'd need to change these rules (if one node fails, =
the total-nodes will change).
>>      As an alternative, I found [1] which states multiple rules can be=
 used and enabled / disabled,
>>      but does somebody know of a cleaner (and easier to read) way, als=
o not costing extra performance?
>>
>> 3. We have several internal networks, which need to talk to each other=
 (partially with firewall rules and NATting),
>>      so we'd also need similar rules there, complicating things more. =
That's why a cleaner way would be very welcome :-).
>>
>> 4. Another point is how to actually perform the failover. Classical cl=
uster suites (corosync + pacemaker)
>>      are rather used to migrate services, but not to communicate node =
ids and number of total active nodes.
>>      They can probably be tricked into doing that somehow, but they ar=
e not designed this way.
>>      TIPC may be something to use here, but I found nothing "ready to =
use".
>>
>> You may also tell me there's a better way to do this than use xt_clust=
er (custom BPF?) =E2=80=94 we've up to now only done "classic" active/pas=
sive setups,
>> but maybe someone on this list has already done active/active without =
commercial hardware, and can share experience from this?
>>
>> Cheers and thanks in advance,
>>          Oliver
>>
>> PS: Please keep me in CC, I'm not subscribed to the list. Thanks!
>>
>> [0] https://github.com/torvalds/linux/blob/10a3efd0fee5e881b1866cf4595=
0808575cb0f24/net/netfilter/xt_cluster.c#L16-L19
>> [1] https://lore.kernel.org/netfilter-devel/499BEBBF.7080705@netfilter=
=2Eorg/
>>
>> --
>> Oliver Freyermuth
>> Universit=C3=A4t Bonn
>> Physikalisches Institut, Raum 1.047
>> Nu=C3=9Fallee 12
>> 53115 Bonn
>> --
>> Tel.: +49 228 73 2367
>> Fax:  +49 228 73 7869
>> --
>>


--=20
Oliver Freyermuth
Universit=C3=A4t Bonn
Physikalisches Institut, Raum 1.047
Nu=C3=9Fallee 12
53115 Bonn
--
Tel.: +49 228 73 2367
Fax:  +49 228 73 7869
--


--------------ms050505070603040305030006
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
EOswggUSMIID+qADAgECAgkA4wvV+K8l2YEwDQYJKoZIhvcNAQELBQAwgYIxCzAJBgNVBAYT
AkRFMSswKQYDVQQKDCJULVN5c3RlbXMgRW50ZXJwcmlzZSBTZXJ2aWNlcyBHbWJIMR8wHQYD
VQQLDBZULVN5c3RlbXMgVHJ1c3QgQ2VudGVyMSUwIwYDVQQDDBxULVRlbGVTZWMgR2xvYmFs
Um9vdCBDbGFzcyAyMB4XDTE2MDIyMjEzMzgyMloXDTMxMDIyMjIzNTk1OVowgZUxCzAJBgNV
BAYTAkRFMUUwQwYDVQQKEzxWZXJlaW4genVyIEZvZXJkZXJ1bmcgZWluZXMgRGV1dHNjaGVu
IEZvcnNjaHVuZ3NuZXR6ZXMgZS4gVi4xEDAOBgNVBAsTB0RGTi1QS0kxLTArBgNVBAMTJERG
Ti1WZXJlaW4gQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkgMjCCASIwDQYJKoZIhvcNAQEBBQAD
ggEPADCCAQoCggEBAMtg1/9moUHN0vqHl4pzq5lN6mc5WqFggEcVToyVsuXPztNXS43O+FZs
FVV2B+pG/cgDRWM+cNSrVICxI5y+NyipCf8FXRgPxJiZN7Mg9mZ4F4fCnQ7MSjLnFp2uDo0p
eQcAIFTcFV9Kltd4tjTTwXS1nem/wHdN6r1ZB+BaL2w8pQDcNb1lDY9/Mm3yWmpLYgHurDg0
WUU2SQXaeMpqbVvAgWsRzNI8qIv4cRrKO+KA3Ra0Z3qLNupOkSk9s1FcragMvp0049ENF4N1
xDkesJQLEvHVaY4l9Lg9K7/AjsMeO6W/VRCrKq4Xl14zzsjz9AkH4wKGMUZrAcUQDBHHWekC
AwEAAaOCAXQwggFwMA4GA1UdDwEB/wQEAwIBBjAdBgNVHQ4EFgQUk+PYMiba1fFKpZFK4OpL
4qIMz+EwHwYDVR0jBBgwFoAUv1kgNgB5oKAia4zV8mHSuCzLgkowEgYDVR0TAQH/BAgwBgEB
/wIBAjAzBgNVHSAELDAqMA8GDSsGAQQBga0hgiwBAQQwDQYLKwYBBAGBrSGCLB4wCAYGZ4EM
AQICMEwGA1UdHwRFMEMwQaA/oD2GO2h0dHA6Ly9wa2kwMzM2LnRlbGVzZWMuZGUvcmwvVGVs
ZVNlY19HbG9iYWxSb290X0NsYXNzXzIuY3JsMIGGBggrBgEFBQcBAQR6MHgwLAYIKwYBBQUH
MAGGIGh0dHA6Ly9vY3NwMDMzNi50ZWxlc2VjLmRlL29jc3ByMEgGCCsGAQUFBzAChjxodHRw
Oi8vcGtpMDMzNi50ZWxlc2VjLmRlL2NydC9UZWxlU2VjX0dsb2JhbFJvb3RfQ2xhc3NfMi5j
ZXIwDQYJKoZIhvcNAQELBQADggEBAIcL/z4Cm2XIVi3WO5qYi3FP2ropqiH5Ri71sqQPrhE4
eTizDnS6dl2e6BiClmLbTDPo3flq3zK9LExHYFV/53RrtCyD2HlrtrdNUAtmB7Xts5et6u5/
MOaZ/SLick0+hFvu+c+Z6n/XUjkurJgARH5pO7917tALOxrN5fcPImxHhPalR6D90Bo0fa3S
PXez7vTXTf/D6OWST1k+kEcQSrCFWMBvf/iu7QhCnh7U3xQuTY+8npTD5+32GPg8SecmqKc2
2CzeIs2LgtjZeOJVEqM7h0S2EQvVDFKvaYwPBt/QolOLV5h7z/0HJPT8vcP9SpIClxvyt7bP
ZYoaorVyGTkwggWsMIIElKADAgECAgcbY7rQHiw9MA0GCSqGSIb3DQEBCwUAMIGVMQswCQYD
VQQGEwJERTFFMEMGA1UEChM8VmVyZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRzY2hl
biBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLEwdERk4tUEtJMS0wKwYDVQQDEyRE
Rk4tVmVyZWluIENlcnRpZmljYXRpb24gQXV0aG9yaXR5IDIwHhcNMTYwNTI0MTEzODQwWhcN
MzEwMjIyMjM1OTU5WjCBjTELMAkGA1UEBhMCREUxRTBDBgNVBAoMPFZlcmVpbiB6dXIgRm9l
cmRlcnVuZyBlaW5lcyBEZXV0c2NoZW4gRm9yc2NodW5nc25ldHplcyBlLiBWLjEQMA4GA1UE
CwwHREZOLVBLSTElMCMGA1UEAwwcREZOLVZlcmVpbiBHbG9iYWwgSXNzdWluZyBDQTCCASIw
DQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJ07eRxH3h+Gy8Zp1xCeOdfZojDbchwFfylf
S2jxrRnWTOFrG7ELf6Gr4HuLi9gtzm6IOhDuV+UefwRRNuu6cG1joL6WLkDh0YNMZj0cZGnl
m6Stcq5oOVGHecwX064vXWNxSzl660Knl5BpBb+Q/6RAcL0D57+eGIgfn5mITQ5HjUhfZZkQ
0tkqSe3BuS0dnxLLFdM/fx5ULzquk1enfnjK1UriGuXtQX1TX8izKvWKMKztFwUkP7agCwf9
TRqaA1KgNpzeJIdl5Of6x5ZzJBTN0OgbaJ4YWa52fvfRCng8h0uwN89Tyjo4EPPLR22MZD08
WkVKusqAfLjz56dMTM0CAwEAAaOCAgUwggIBMBIGA1UdEwEB/wQIMAYBAf8CAQEwDgYDVR0P
AQH/BAQDAgEGMCkGA1UdIAQiMCAwDQYLKwYBBAGBrSGCLB4wDwYNKwYBBAGBrSGCLAEBBDAd
BgNVHQ4EFgQUazqYi/nyU4na4K2yMh4JH+iqO3QwHwYDVR0jBBgwFoAUk+PYMiba1fFKpZFK
4OpL4qIMz+EwgY8GA1UdHwSBhzCBhDBAoD6gPIY6aHR0cDovL2NkcDEucGNhLmRmbi5kZS9n
bG9iYWwtcm9vdC1nMi1jYS9wdWIvY3JsL2NhY3JsLmNybDBAoD6gPIY6aHR0cDovL2NkcDIu
cGNhLmRmbi5kZS9nbG9iYWwtcm9vdC1nMi1jYS9wdWIvY3JsL2NhY3JsLmNybDCB3QYIKwYB
BQUHAQEEgdAwgc0wMwYIKwYBBQUHMAGGJ2h0dHA6Ly9vY3NwLnBjYS5kZm4uZGUvT0NTUC1T
ZXJ2ZXIvT0NTUDBKBggrBgEFBQcwAoY+aHR0cDovL2NkcDEucGNhLmRmbi5kZS9nbG9iYWwt
cm9vdC1nMi1jYS9wdWIvY2FjZXJ0L2NhY2VydC5jcnQwSgYIKwYBBQUHMAKGPmh0dHA6Ly9j
ZHAyLnBjYS5kZm4uZGUvZ2xvYmFsLXJvb3QtZzItY2EvcHViL2NhY2VydC9jYWNlcnQuY3J0
MA0GCSqGSIb3DQEBCwUAA4IBAQCBeEWkTqR/DlXwCbFqPnjMaDWpHPOVnj/z+N9rOHeJLI21
rT7H8pTNoAauusyosa0zCLYkhmI2THhuUPDVbmCNT1IxQ5dGdfBi5G5mUcFCMWdQ5UnnOR7L
n8qGSN4IFP8VSytmm6A4nwDO/afr0X9XLchMX9wQEZc+lgQCXISoKTlslPwQkgZ7nu7YRrQb
tQMMONncsKk/cQYLsgMHM8KNSGMlJTx6e1du94oFOO+4oK4v9NsH1VuEGMGpuEvObJAaguS5
Pfp38dIfMwK/U+d2+dwmJUFvL6Yb+qQTkPp8ftkLYF3sv8pBoGH7EUkp2KgtdRXYShjqFu9V
NCIaE40GMIIGITCCBQmgAwIBAgIMIAznfcQsmKMHwKpYMA0GCSqGSIb3DQEBCwUAMIGNMQsw
CQYDVQQGEwJERTFFMEMGA1UECgw8VmVyZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRz
Y2hlbiBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLDAdERk4tUEtJMSUwIwYDVQQD
DBxERk4tVmVyZWluIEdsb2JhbCBJc3N1aW5nIENBMB4XDTE4MTExNTEyNDMyOFoXDTIxMTEx
NDEyNDMyOFowgbIxCzAJBgNVBAYTAkRFMRwwGgYDVQQIDBNOb3JkcmhlaW4tV2VzdGZhbGVu
MQ0wCwYDVQQHDARCb25uMTgwNgYDVQQKDC9SaGVpbmlzY2hlIEZyaWVkcmljaC1XaWxoZWxt
cy1Vbml2ZXJzaXRhZXQgQm9ubjEgMB4GA1UECwwXUGh5c2lrYWxpc2NoZXMgSW5zdGl0dXQx
GjAYBgNVBAMMEU9saXZlciBGcmV5ZXJtdXRoMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB
CgKCAQEAwKdVNE7QbQkmWwUVE7N+izRfbbEalPrylpwB9Mgm/YIjJCVfzpcdF7g63VY1TSFP
Uxh4yDSpw0lVruJZ6Gd6A1JCQEcw/yiG88Y806POHQEM0LTOYYmkKKG+iz8DEvTQbxC5+DyQ
shU2tYSi5druehKqylyReTun9NfJ1gTdLueKjpGqJnsG3CZOaVUx4eMFj7pMmHzPnZsfe/Nr
w3lTdmtaG0RoKHLDq3jK2LkDC3vgej/FyOVclUfwkEpxrm1l1GegqYMRZ5qAhwJ0d/FdD1Gt
HVdISFHrpHDDJAFZ2dVB+G4bhif1dvXsQK4qWOWT6M2+71xLhDdf9Qawci+isQIDAQABo4IC
WDCCAlQwQAYDVR0gBDkwNzAPBg0rBgEEAYGtIYIsAQEEMBEGDysGAQQBga0hgiwBAQQDCDAR
Bg8rBgEEAYGtIYIsAgEEAwgwCQYDVR0TBAIwADAOBgNVHQ8BAf8EBAMCBeAwHQYDVR0lBBYw
FAYIKwYBBQUHAwIGCCsGAQUFBwMEMB0GA1UdDgQWBBRVYUmFlJJi/QG+QVTQn2tfh4wnhTAf
BgNVHSMEGDAWgBRrOpiL+fJTidrgrbIyHgkf6Ko7dDAoBgNVHREEITAfgR1mcmV5ZXJtdXRo
QHBoeXNpay51bmktYm9ubi5kZTCBjQYDVR0fBIGFMIGCMD+gPaA7hjlodHRwOi8vY2RwMS5w
Y2EuZGZuLmRlL2Rmbi1jYS1nbG9iYWwtZzIvcHViL2NybC9jYWNybC5jcmwwP6A9oDuGOWh0
dHA6Ly9jZHAyLnBjYS5kZm4uZGUvZGZuLWNhLWdsb2JhbC1nMi9wdWIvY3JsL2NhY3JsLmNy
bDCB2wYIKwYBBQUHAQEEgc4wgcswMwYIKwYBBQUHMAGGJ2h0dHA6Ly9vY3NwLnBjYS5kZm4u
ZGUvT0NTUC1TZXJ2ZXIvT0NTUDBJBggrBgEFBQcwAoY9aHR0cDovL2NkcDEucGNhLmRmbi5k
ZS9kZm4tY2EtZ2xvYmFsLWcyL3B1Yi9jYWNlcnQvY2FjZXJ0LmNydDBJBggrBgEFBQcwAoY9
aHR0cDovL2NkcDIucGNhLmRmbi5kZS9kZm4tY2EtZ2xvYmFsLWcyL3B1Yi9jYWNlcnQvY2Fj
ZXJ0LmNydDANBgkqhkiG9w0BAQsFAAOCAQEARUAUNWOOOT8zUouetmweHEU3pYU3Wt5yEWao
KoayF1t5FTdeY9nvOrTss2kKzskO1lH5QodZP+nYGF4nA1YI37J115K8YJN+tjx7A8bVc34C
RAX6R2KXhTM6ToVTr6IsROkO7kj0HMLBcxbCgui635+Pu2PuPw86cd9rP+PxjHIXfQc0dIRi
z2eWG+nY7GwBZDBhpyQwqEBVBD09h8TN9Nz40WrO6fTu3unq7+JV5n7ccqef2ioc6fmI8Aqp
GBK1sl8MUuqD0e7gBdYqGwmZsB/faEgIRC1dKugq5UngD68gfn5rUzchoBAMWxoRcfQ+NEpb
8cw+P7/rk+/cwdD1vTGCBAswggQHAgEBMIGeMIGNMQswCQYDVQQGEwJERTFFMEMGA1UECgw8
VmVyZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRzY2hlbiBGb3JzY2h1bmdzbmV0emVz
IGUuIFYuMRAwDgYDVQQLDAdERk4tUEtJMSUwIwYDVQQDDBxERk4tVmVyZWluIEdsb2JhbCBJ
c3N1aW5nIENBAgwgDOd9xCyYowfAqlgwDQYJYIZIAWUDBAIBBQCgggI9MBgGCSqGSIb3DQEJ
AzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIxMDUxMDIxNTUxOFowLwYJKoZIhvcN
AQkEMSIEIPb3wGXyOwJTubvGIepxr/E8cUANuxWhHEboaQRWQg6xMGwGCSqGSIb3DQEJDzFf
MF0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgIC
AIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwga8GCSsGAQQBgjcQ
BDGBoTCBnjCBjTELMAkGA1UEBhMCREUxRTBDBgNVBAoMPFZlcmVpbiB6dXIgRm9lcmRlcnVu
ZyBlaW5lcyBEZXV0c2NoZW4gRm9yc2NodW5nc25ldHplcyBlLiBWLjEQMA4GA1UECwwHREZO
LVBLSTElMCMGA1UEAwwcREZOLVZlcmVpbiBHbG9iYWwgSXNzdWluZyBDQQIMIAznfcQsmKMH
wKpYMIGxBgsqhkiG9w0BCRACCzGBoaCBnjCBjTELMAkGA1UEBhMCREUxRTBDBgNVBAoMPFZl
cmVpbiB6dXIgRm9lcmRlcnVuZyBlaW5lcyBEZXV0c2NoZW4gRm9yc2NodW5nc25ldHplcyBl
LiBWLjEQMA4GA1UECwwHREZOLVBLSTElMCMGA1UEAwwcREZOLVZlcmVpbiBHbG9iYWwgSXNz
dWluZyBDQQIMIAznfcQsmKMHwKpYMA0GCSqGSIb3DQEBAQUABIIBAKnWJxza3IrLjY9+c9OA
gjepenrPA9LsuEq4cTRWTgr8hWTgcbznMWIzqGQcgkLt3BCo9C1dpRuID09k7jAof8X4BWmQ
c53fgJ1Hsu3664bWhnuZCJy2OI74Ev5YRXbnuUklZ06Zm6zpqnQmo9x99LKu0EZcSKN9pu0/
gMQdcO4VgMWJLfC6mkVbsslNJU4mNTxVpFga5l2Q1NP+xTYYDF5LzHiszz4lOBwaq9vzYQLD
hEC5bTy4j54KRvKlCufBnGLWNxHg/rUKAJpPOT5puntSPfS2rJaY0EKlKJVD/JiG3w++dv10
7Rh3mwNUOvLeJy+0clT1svJIKaJNHB1pbv4AAAAAAAA=
--------------ms050505070603040305030006--
