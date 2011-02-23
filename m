From: "Feasey, Nicholas" <nfeasey@utpress.utoronto.ca>
Subject: Re: DMZ issue - redirect works as expected but behaviour not desired
Date: Wed, 23 Feb 2011 01:31:19 +0000
Message-ID: <3A9636F5-D484-4867-8EA9-751541813E2F@utpress.utoronto.ca>
References: <41BA18AA-DB18-493A-9429-37A188A2442B@utpress.utoronto.ca>
 <4D604DCB.8030409@plouf.fr.eu.org>
 <FCF5BC26-F3C1-4533-AF80-DC33AAE3F772@utpress.utoronto.ca>
 <AANLkTi=rkXhB9UC=jG_wfF3P0MRjk4z-BVWjx4w=gb3m@mail.gmail.com>
 <DBDD48B6-7C43-48CC-8D9A-8BBD048C6E40@utpress.utoronto.ca>
 <AANLkTi=BFd1KYZ6pGEoH5BPb9BjdgY2uHj3i_LOXQ_=q@mail.gmail.com>
 <571669CE-5056-4264-89CB-4FFC7525CE15@utpress.utoronto.ca>
 <AANLkTi=9euarpUK9RM6Gj6oRfyY1BvM7P2kR5_huXykE@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Apple-Mail-4-142324757";
	protocol="application/pkcs7-signature"; micalg=sha1
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=9euarpUK9RM6Gj6oRfyY1BvM7P2kR5_huXykE@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pandu Poluan <pandu@poluan.info>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

--Apple-Mail-4-142324757
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252

My battle with iptables continues=85

It's probably staring me in the face however here is the run down...

In order to perform my testing I started with the inside network =
(10.0.10.0).
I have set up the server on it's own DMZ (10.1.10.0 subnet).

The firewall is on the internal network as 10.0.10.22 and the DMZ as =
10.1.10.1.  (It's ok that he firewall is on the same subnet - correct or =
do ALL ports on the fiewall have to be on different subnets?).

The webserver has one interface up and running, it's IP is set to =
10.1.10.7 and it's gateway set to 10.1.10.1. No DNS defined at all.=20

The particulars:

client ip: 10.0.10.85=20
firewall ip: 10.0.10.22 (eth0) 10.1.10.1 (eth1)
webserver ip: 10.1.10.7 (eth1)

Going to: http://10.0.10.22 (should see Welcome simple welcome page)

No luck - just sits there.

Below is the iptables for the firewall box:

Firewall iptables
:
# Firewall configuration written by system-config-firewall
# Manual customization of this file is not recommended.
*nat
:PREROUTING ACCEPT [0:0]
#:POSTROUTING ACCEPT [0:0]
-A PREROUTING -i eth0 -d 10.0.10.22 -p tcp --dport 80 -j DNAT --to =
10.1.10.7
COMMIT
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A INPUT -p icmp -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 443 -j ACCEPT
-A INPUT -j REJECT --reject-with icmp-host-prohibited
-A FORWARD -s 10.1.10.7 -p tcp --sport 80 -j ACCEPT
-A FORWARD -j REJECT --reject-with icmp-host-prohibited
COMMIT

iptables -L -t nat on firewall:

target     prot opt source               destination        =20
DNAT       tcp  --  anywhere             zeus-n.utpress.utoronto.ca tcp =
dpt:http to:10.1.10.7=20

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination        =20

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination        =20

iptables -L -t filter on firewall:

Chain INPUT (policy ACCEPT)
target     prot opt source               destination        =20
ACCEPT     all  --  anywhere             anywhere            state =
RELATED,ESTABLISHED=20
ACCEPT     icmp --  anywhere             anywhere           =20
ACCEPT     all  --  anywhere             anywhere           =20
ACCEPT     tcp  --  anywhere             anywhere            state NEW =
tcp dpt:ssh=20
ACCEPT     tcp  --  anywhere             anywhere            state NEW =
tcp dpt:http=20
ACCEPT     tcp  --  anywhere             anywhere            state NEW =
tcp dpt:https=20
REJECT     all  --  anywhere             anywhere            reject-with =
icmp-host-prohibited=20

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination        =20
ACCEPT     tcp  --  10.1.10.7            anywhere            tcp =
spt:http=20
REJECT     all  --  anywhere             anywhere            reject-with =
icmp-host-prohibited=20

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination        =20


Webserver iptables:

# Firewall configuration written by system-config-firewall
# Manual customization of this file is not recommended.
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A INPUT -p icmp -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 443 -j ACCEPT
-A INPUT -j REJECT --reject-with icmp-host-prohibited
-A FORWARD -j REJECT --reject-with icmp-host-prohibited
COMMIT

Webserver iptables -L -t filter

Chain INPUT (policy ACCEPT)
target     prot opt source               destination        =20
ACCEPT     all  --  anywhere             anywhere            state =
RELATED,ESTABLISHED=20
ACCEPT     icmp --  anywhere             anywhere           =20
ACCEPT     all  --  anywhere             anywhere           =20
ACCEPT     tcp  --  anywhere             anywhere            state NEW =
tcp dpt:ssh=20
ACCEPT     tcp  --  anywhere             anywhere            state NEW =
tcp dpt:http=20
ACCEPT     tcp  --  anywhere             anywhere            state NEW =
tcp dpt:https=20
REJECT     all  --  anywhere             anywhere            reject-with =
icmp-host-prohibited=20

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination        =20
REJECT     all  --  anywhere             anywhere            reject-with =
icmp-host-prohibited=20

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination        =20

I just don't see what is wrong here so I'm sure it's something silly.

Nicholas

On 2011-02-20, at 9:37 AM, Pandu Poluan wrote:

> Your welcome :)
>=20
> After the NAT is successful, don't forget to harden your iptables. And
> while doing that, don't forget to ACCEPT packets that need to be
> forwarded, e.g.:
>=20
> -t filter -A FORWARD -s $WEBSERVER -p tcp --sport 80 -j ACCEPT
>=20
> Good luck!
>=20
> Rgds,
>=20
>=20
> On 2011-02-20, Feasey, Nicholas <nfeasey@utpress.utoronto.ca> wrote:
>> As I suspected I was doing myself in thinking that I could touch such =
a
>> thing on just one interface.  I have two interfaces and will now do =
it the
>> correct way.
>>=20
>> Thank you very much for your making it very clear for me and for your
>> assistance!
>>=20
>> Nicholas
>> On 2011-02-20, at 12:24 AM, Pandu Poluan wrote:
>>=20
>>> That won't work if the firewall, the webserver, and the client are =
all
>>> in the same subnet.
>>>=20
>>> Let's assume:
>>> * Client is 192.168.40.22
>>> * Firewall is 192.168.40.10
>>> * Webserver is 192.168.40.15
>>>=20
>>> Now client tries to access the faux-webserver:
>>>=20
>>> From: 192.168.40.22
>>> To: 192.168.40.10
>>>=20
>>> The packet gets DNATed
>>>=20
>>> From: 192.168.40.22
>>> To: 192.168.40.15
>>>=20
>>> See what happened? Because the source is the same subnet, the
>>> webserver replies directly to the client.
>>>=20
>>> From: 192.168.40.15
>>> To: 192.168.40.22
>>>=20
>>> The Linux firewall never sees the returning packet. And the client
>>> sees a 'strange' packet, as the client's opened connection is with =
.10
>>> not .15. This results in the client dropping the 'strange' packet.
>>>=20
>>> Now, the usual scenario is like this:
>>>=20
>>> Firewall Box has 2 interfaces:
>>> * WAN: 202.72.112.5 (default gateway to ISP's router)
>>> * DMZ: 192.168.40.1
>>>=20
>>> Webserver: 192.168.40.8 (default gateway is 192.168.40.1)
>>>=20
>>> Assume client is: 65.12.212.47
>>>=20
>>> Client opens a connection to the firewall:
>>>=20
>>> [1] From: 65.12.212.47
>>> To: 202.72.112.5
>>>=20
>>> Firewall does a DNAT:
>>>=20
>>> From: 65.12.212.47
>>> To: 192.168.40.8
>>>=20
>>> Webserver handles the request, and replies:
>>>=20
>>> From: 192.168.40.8
>>> To: 65.12.212.47
>>>=20
>>> Since the destination is on a different subnet, the webserver hands
>>> the packet to the firewall, which performs an 'un-DNAT':
>>>=20
>>> From: 202.72.112.5
>>> To: 65.12.212.47
>>>=20
>>> The packet gets sent via the intertubes to the client, and the =
client
>>> sees that the packet *is* a reply to its connection (see [1]; the
>>> from: and to: addresses are properly swapped).
>>>=20
>>> So, if you want to test, you'll need to configure your network so =
that:
>>> * 2 interfaces on the Linux box
>>> * the client and the webserver are *not* on the same subnet
>>>=20
>>> Rgds,
>>>=20
>>>=20
>>> On 2011-02-20, Feasey, Nicholas <nfeasey@utpress.utoronto.ca> wrote:
>>>> On 2011-02-19, at 8:28 PM, Pandu Poluan wrote:
>>>>=20
>>>>> (sorry for top posting; Gmail mobile client can only top-post)
>>>>>=20
>>>>> I've been doing what (I think) you're planning to do, i.e., =
mapping an
>>>>> external IP:port into DMZ (which uses private addressing)
>>>>>=20
>>>>> IMO, to do this, you really don't need more than 2 rules:
>>>>> -t nat -A PREROUTING -i $WAN_IFACE -d $WAN_IP -p tcp --dport 80 -j
>>>>> DNAT --to $WEBSERVER
>>>>>=20
>>>>> -A FORWARD -d $WEBSERVER -j ACCEPT
>>>>>=20
>>>>> With the above pair of rules, only the destination of incoming =
packets
>>>>> get changed; the webserver would still see the original source
>>>>> address. As long as the Linux firewall sees *both* incoming and
>>>>> outgoing traffic from the webserver, netfilter will automatically
>>>>> perform the inverse NAT.
>>>>>=20
>>>>> Of course you would want some -t raw -A PREROUTING rules to =
prevent
>>>>> spoofing (esp. smurf attacks). But that's not strictly necessary =
for
>>>>> NAT-ing.
>>>>>=20
>>>>> CMIIW.
>>>>>=20
>>>>> Rgds,
>>>>>=20
>>>>>=20
>>>>> On 2011-02-20, Feasey, Nicholas <nfeasey@utpress.utoronto.ca> =
wrote:
>>>>>> Thank you for your response and explanation of the difference =
between
>>>>>> MASQUERADE and SNAT.
>>>>>>=20
>>>>>> I really do not want to use MASQUERADE for exactly the reason =
that you
>>>>>> state.
>>>>>>=20
>>>>>> My explanation is confusing because I was using the same ethernet =
port
>>>>>> just
>>>>>> for testing.
>>>>>>=20
>>>>>> In the real world I'm trying to achieve a box that acts as a =
firewall
>>>>>> and
>>>>>> depending on the service requested routes to an internal machine =
lying
>>>>>> on
>>>>>> a
>>>>>> DMZ.
>>>>>>=20
>>>>>> So,  I'd be using multiple ethernet ports as you would expect.
>>>>>>=20
>>>>>> To be clear (I hope) users would enter =
http://somesite.somewhere.com
>>>>>> and
>>>>>> it
>>>>>> would resolve to an IP address on the firewall box.
>>>>>> They hit the outside interface (port 80 or 443) and it would =
forward
>>>>>> this
>>>>>> to
>>>>>> a machine on the DMZ.  That's all I'm trying to achieve here.
>>>>>>=20
>>>>>> Is this just achieved via a series of FORWARD commands like any =
other?
>>>>>>=20
>>>>>>=20
>>>>>> On 2011-02-19, at 6:10 PM, Pascal Hambourg wrote:
>>>>>>=20
>>>>>>> Hello,
>>>>>>>=20
>>>>>>> Feasey, Nicholas a =E9crit :
>>>>>>>> I'm setting up a box that will be the only device on the =
Internet and
>>>>>>>> will forward requested services to other servers sitting on a =
DMZ.
>>>>>>>>=20
>>>>>>>> As a test I started with redirecting a web server.
>>>>>>>>=20
>>>>>>>> To test my arrangement I first merely set up a simple =
masquerade
>>>>>>>> (just
>>>>>>>> on my internal network) in my iptables like so:
>>>>>>>>=20
>>>>>>>> *nat
>>>>>>>> :PREROUTING ACCEPT [0:0]
>>>>>>>> :POSTROUTING ACCEPT [0:0]
>>>>>>>> -A PREROUTING -p tcp -i eth0 --dport 80 -j DNAT --to =
192.168.40.15
>>>>>>>> -A POSTROUTING -j MASQUERADE
>>>>>>>=20
>>>>>>> Be aware that using MASQUERADE on all interfaces may not do what =
you
>>>>>>> want. Usually, it is used only on the public internet side.
>>>>>>>=20
>>>>>>>> *filter
>>>>>>>> ...normal filtering lines follow.
>>>>>>>>=20
>>>>>>>> This POSTROUTING entry works as well:
>>>>>>>>=20
>>>>>>>> -A POSTROUTING -o eth0 -j SNAT --to-source 192.168.40.15
>>>>>>>>=20
>>>>>>>> I think this is because the above line is doing the same as the
>>>>>>>> shortcut
>>>>>>>> MASQUERADE.
>>>>>>>=20
>>>>>>> Not exactly. This rule replaces the source address of any =
connection
>>>>>>> going out eth0 with 192.168.40.15 whereas the above MASQUERADE =
rule
>>>>>>> replaces the source address of any connection going out any =
interface
>>>>>>> with the address of the interface.
>>>>>>>=20
>>>>>>> By the way, it is weird that you use the address of a remote =
host (the
>>>>>>> server in the DMZ).
>>>>>>>=20
>>>>>>>> When I check the httpd access_log it shows that the connection =
came
>>>>>>>> from
>>>>>>>> 192.168.40.15 as expected.  It works.
>>>>>>>=20
>>>>>>> I'm puzzled. A connection cannot match both the DNAT and SNAT =
rules as
>>>>>>> they have the same input and output interface eth0. Even if it =
did
>>>>>>> (the
>>>>>>> connection goes out the interface it came in), this connection =
would
>>>>>>> end
>>>>>>> up having the same address as source and destination =
192.168.40.15.
>>>>>>> --
>>>>>>> To unsubscribe from this list: send the line "unsubscribe =
netfilter"
>>>>>>> in
>>>>>>> the body of a message to majordomo@vger.kernel.org
>>>>>>> More majordomo info at  =
http://vger.kernel.org/majordomo-info.html
>>>>>>>=20
>>>>=20
>>>> Thank you for your reply.
>>>>=20
>>>> I just know that it's my inexperience that's getting me all messed =
up
>>>> here.
>>>> I've tried your advise but it's just not happening for me.
>>>> Thought I'd post my test iptables configuration in the hopes that =
my
>>>> issue
>>>> can be identified.  I've made the configuration basic so that =
nothing
>>>> else
>>>> get's in my way.
>>>>=20
>>>> Here goes...
>>>>=20
>>>> So, assuming
>>>> $WAN_IFACE =3D eth0
>>>> $WAN_IP =3D 192.168.40.10
>>>> $WEBSERVER =3D 192.168.40.15
>>>>=20
>>>> Based on your recommendation of...
>>>>=20
>>>>> -t nat -A PREROUTING -i $WAN_IFACE -d $WAN_IP -p tcp --dport 80 -j
>>>>> DNAT --to $WEBSERVER
>>>>>=20
>>>>> -A FORWARD -d $WEBSERVER -j ACCEPT
>>>>=20
>>>> *nat
>>>> :PREROUTING ACCEPT [0:0]
>>>> -A PREROUTING -i eth0 -d 192.168.40.10 -p tcp --dport 80 -j DNAT =
--to
>>>> 192.168.40.15
>>>> COMMIT
>>>> *filter
>>>> :INPUT ACCEPT [0:0]
>>>> :FORWARD ACCEPT [0:0]
>>>> :OUTPUT ACCEPT [0:0]
>>>> -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>>>> -A INPUT -p icmp -j ACCEPT
>>>> -A INPUT -i lo -j ACCEPT
>>>> -A INPUT -i eth0 -j ACCEPT
>>>> -A FORWARD -d 192.168.40.15 -j ACCEPT
>>>> COMMIT
>>>>=20
>>>> I know they are on the same interface but again I assume this =
should work
>>>> for testing purposes even though this would never be done in a real
>>>> environment.
>>>> I've assumed that the -A FORWARD goes in the *filter table and not =
the
>>>> *nat
>>>> table?  Second assumption is that I don't need any rules per say in =
the
>>>> $WEBSERVER
>>>> iptables file as you explained.
>>>>=20
>>>> I beg your indulgence with my inexperience while I try to wrap my =
head
>>>> around this and I might have taken out too many lines (or two few) =
to get
>>>> this to go.
>>>>=20
>>>> Bottom line is that with this in place I never get to the =
$WEBSERVER like
>>>> I"ve done with just my simple MASQUERADE test.
>>>>=20
>>>> I'm obviously missing something here and I can't begin to tell you =
my
>>>> frustration in my ability to get what I believe should be =
relatively
>>>> simple
>>>> to work.  :)
>>>>=20
>>>> Nicholas
>>>>=20
>>>>=20
>>>>=20
>>>>=20
>>>=20
>>>=20
>>> --
>>> --
>>> Pandu E Poluan - IT Optimizer
>>> My website: http://pandu.poluan.info/
>>>=20
>>>=20
>>=20
>>=20
>=20
>=20
> --=20
> --
> Pandu E Poluan - IT Optimizer
> My website: http://pandu.poluan.info/
>=20
>=20


--Apple-Mail-4-142324757
Content-Disposition: attachment; filename="smime.p7s"
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJojCCBEYw
ggOvoAMCAQICEGb9R+PCGeToms2Z3fU6yyQwDQYJKoZIhvcNAQEFBQAwXzELMAkGA1UEBhMCVVMx
FzAVBgNVBAoTDlZlcmlTaWduLCBJbmMuMTcwNQYDVQQLEy5DbGFzcyAxIFB1YmxpYyBQcmltYXJ5
IENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTA1MTAyODAwMDAwMFoXDTE1MTAyNzIzNTk1OVow
gd0xCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5WZXJpU2lnbiwgSW5jLjEfMB0GA1UECxMWVmVyaVNp
Z24gVHJ1c3QgTmV0d29yazE7MDkGA1UECxMyVGVybXMgb2YgdXNlIGF0IGh0dHBzOi8vd3d3LnZl
cmlzaWduLmNvbS9ycGEgKGMpMDUxHjAcBgNVBAsTFVBlcnNvbmEgTm90IFZhbGlkYXRlZDE3MDUG
A1UEAxMuVmVyaVNpZ24gQ2xhc3MgMSBJbmRpdmlkdWFsIFN1YnNjcmliZXIgQ0EgLSBHMjCCASIw
DQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMnfrOfq+PgDFMQAktXBfjbCPO98chXLwKuMPRyV
zm8eECw/AO2XJua2x+atQx0/pIdHR0w+VPhs+Mf8sZ69MHC8l7EDBeqV8a1AxUR6SwWi8mD81zpl
Yu//EHuiVrvFTnAt1qIfPO2wQuhejVchrKaZ2RHp0hoHwHRHQgv8xTTq/ea6JNEdCBU3otdzzwFB
L2OyOj++pRpu9MlKWz2VphW7NQIZ+dTvvI8OcXZZu0u2Ptb8Whb01g6J8kn+bAztFenZiHWcec5g
J925rXXOL3OVekA6hXVJsLjfaLyrzROChRFQo+A8C67AClPN1zBvhTJGG+RJEMJs4q8fef/btLUC
AwEAAaOB/zCB/DASBgNVHRMBAf8ECDAGAQH/AgEAMEQGA1UdIAQ9MDswOQYLYIZIAYb4RQEHFwEw
KjAoBggrBgEFBQcCARYcaHR0cHM6Ly93d3cudmVyaXNpZ24uY29tL3JwYTALBgNVHQ8EBAMCAQYw
EQYJYIZIAYb4QgEBBAQDAgEGMC4GA1UdEQQnMCWkIzAhMR8wHQYDVQQDExZQcml2YXRlTGFiZWwz
LTIwNDgtMTU1MB0GA1UdDgQWBBQRfV4ZfTwE32ps1qKKGj8x2DuUUjAxBgNVHR8EKjAoMCagJKAi
hiBodHRwOi8vY3JsLnZlcmlzaWduLmNvbS9wY2ExLmNybDANBgkqhkiG9w0BAQUFAAOBgQA8o9oC
YzrEk6qrctPcrVA4HgyeFkqIt+7r2f8PjZWg1rv6aguuYYTYaEeJ70+ssh9JQZtJM3aTi55uuUMc
YL3C3Ioth8FFwBFyBBprJCpsb+f8BxMp0Hc6I+f1wYVoGb/GAVQgGa41gsxiPGEJxvTV67APpp8z
hZrTcY5Qj5ndYjCCBVQwggQ8oAMCAQICEFUWx+ZIdSkGSt3gI2HfhUMwDQYJKoZIhvcNAQEFBQAw
gd0xCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5WZXJpU2lnbiwgSW5jLjEfMB0GA1UECxMWVmVyaVNp
Z24gVHJ1c3QgTmV0d29yazE7MDkGA1UECxMyVGVybXMgb2YgdXNlIGF0IGh0dHBzOi8vd3d3LnZl
cmlzaWduLmNvbS9ycGEgKGMpMDUxHjAcBgNVBAsTFVBlcnNvbmEgTm90IFZhbGlkYXRlZDE3MDUG
A1UEAxMuVmVyaVNpZ24gQ2xhc3MgMSBJbmRpdmlkdWFsIFN1YnNjcmliZXIgQ0EgLSBHMjAeFw0x
MDA0MTUwMDAwMDBaFw0xMTA0MTUyMzU5NTlaMIIBHTEXMBUGA1UEChMOVmVyaVNpZ24sIEluYy4x
HzAdBgNVBAsTFlZlcmlTaWduIFRydXN0IE5ldHdvcmsxRjBEBgNVBAsTPXd3dy52ZXJpc2lnbi5j
b20vcmVwb3NpdG9yeS9SUEEgSW5jb3JwLiBieSBSZWYuLExJQUIuTFREKGMpOTgxHjAcBgNVBAsT
FVBlcnNvbmEgTm90IFZhbGlkYXRlZDEzMDEGA1UECxMqRGlnaXRhbCBJRCBDbGFzcyAxIC0gTmV0
c2NhcGUgRnVsbCBTZXJ2aWNlMRgwFgYDVQQDFA9OaWNob2xhcyBGZWFzZXkxKjAoBgkqhkiG9w0B
CQEWG25mZWFzZXlAdXRwcmVzcy51dG9yb250by5jYTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
AQoCggEBAMu11FeHkEnDfAm5N3kts2cJclvZ6ANJR9FwDOGp/P40dzT8kEoE5p+TLWl62k9buACr
MFw2Btlc5yc2VKuEpRYz7NRScsokmKeYtq9rjzdoC3qM18FgvaflPHIxD2axrolkH4w3lTX+ImXc
tnAi9EoAVfBSYyMYxgLs9J/4EbV98tI1dc+aaKiPxPk/yJ8GwstCTI0uYcwpSAhdBVcbJy8Loj/R
NbZ2LY81mEybjiK/bgpdPdpwj2mxIU+xZoMmbvEMQxlZzigsaGmCCJc1u/iJiBeOh6XGq4HQxd47
ZTjR5QICXPE7g31L4h2/kbLut/zndNOMw2mE7a3QEGVUHVUCAwEAAaOBzDCByTAJBgNVHRMEAjAA
MEQGA1UdIAQ9MDswOQYLYIZIAYb4RQEHFwEwKjAoBggrBgEFBQcCARYcaHR0cHM6Ly93d3cudmVy
aXNpZ24uY29tL3JwYTALBgNVHQ8EBAMCBaAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMC
MEoGA1UdHwRDMEEwP6A9oDuGOWh0dHA6Ly9JbmRDMURpZ2l0YWxJRC1jcmwudmVyaXNpZ24uY29t
L0luZEMxRGlnaXRhbElELmNybDANBgkqhkiG9w0BAQUFAAOCAQEAFwVrTwvlkFm4tzzCkR4TiPAB
cPp7Jja6fTT33XSq7PtUBVL17jqYndKQjo9AvNGsVnJ1DH/Do/bTjq0NKkyo9zcPcyV2SwuohgHc
aYG/hhP9U3nBTso447GryLlWPxv43e/s6c9agsGIMoJBSmQJwDlJzLwyzLE4Spyzn4sr76qwrbrN
RbLc6NbcQtC863gCPnYXVZk60iBYCVx5QwOSDgwVPxtpd30KiICcUzwwtfU4kr4kjuPSHwFxWc+A
ub2D44i7isgOFOnzfxFL4Hb6bLDn0PHRWggrtS3Ss49bXKo8U45OSa0I6SfIYkho3zaHqRDP76IP
uAWUze2Zbl4fnjGCBIswggSHAgEBMIHyMIHdMQswCQYDVQQGEwJVUzEXMBUGA1UEChMOVmVyaVNp
Z24sIEluYy4xHzAdBgNVBAsTFlZlcmlTaWduIFRydXN0IE5ldHdvcmsxOzA5BgNVBAsTMlRlcm1z
IG9mIHVzZSBhdCBodHRwczovL3d3dy52ZXJpc2lnbi5jb20vcnBhIChjKTA1MR4wHAYDVQQLExVQ
ZXJzb25hIE5vdCBWYWxpZGF0ZWQxNzA1BgNVBAMTLlZlcmlTaWduIENsYXNzIDEgSW5kaXZpZHVh
bCBTdWJzY3JpYmVyIENBIC0gRzICEFUWx+ZIdSkGSt3gI2HfhUMwCQYFKw4DAhoFAKCCAm0wGAYJ
KoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTEwMjIzMDEyOTQ4WjAjBgkq
hkiG9w0BCQQxFgQUAsx1LqSACk0GU6s00qSHdRQ2FMwwggEDBgkrBgEEAYI3EAQxgfUwgfIwgd0x
CzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5WZXJpU2lnbiwgSW5jLjEfMB0GA1UECxMWVmVyaVNpZ24g
VHJ1c3QgTmV0d29yazE7MDkGA1UECxMyVGVybXMgb2YgdXNlIGF0IGh0dHBzOi8vd3d3LnZlcmlz
aWduLmNvbS9ycGEgKGMpMDUxHjAcBgNVBAsTFVBlcnNvbmEgTm90IFZhbGlkYXRlZDE3MDUGA1UE
AxMuVmVyaVNpZ24gQ2xhc3MgMSBJbmRpdmlkdWFsIFN1YnNjcmliZXIgQ0EgLSBHMgIQVRbH5kh1
KQZK3eAjYd+FQzCCAQUGCyqGSIb3DQEJEAILMYH1oIHyMIHdMQswCQYDVQQGEwJVUzEXMBUGA1UE
ChMOVmVyaVNpZ24sIEluYy4xHzAdBgNVBAsTFlZlcmlTaWduIFRydXN0IE5ldHdvcmsxOzA5BgNV
BAsTMlRlcm1zIG9mIHVzZSBhdCBodHRwczovL3d3dy52ZXJpc2lnbi5jb20vcnBhIChjKTA1MR4w
HAYDVQQLExVQZXJzb25hIE5vdCBWYWxpZGF0ZWQxNzA1BgNVBAMTLlZlcmlTaWduIENsYXNzIDEg
SW5kaXZpZHVhbCBTdWJzY3JpYmVyIENBIC0gRzICEFUWx+ZIdSkGSt3gI2HfhUMwDQYJKoZIhvcN
AQEBBQAEggEAUTCvvYvs5LPgu65Tt8UrfEg6YomLvaDopKisG74hXyw+uxz5nXgpOnxS7cnWucj+
sWJiZuNlaVE2TV04+i4MZMej4eaTxHrVZ8pGSRm9cCmN1JnUow445/STbj+WjGOeJM/M/P+f3dGK
BlYRqXFB/WOc+j9wZCI+VgW1dhpZwPOr33JzXZhFQZoWygrJZGzvCfrL1st02UAodvaQZLy654lh
4Z4pcDmhwEG3nhFPNNG2JnMRsum7770jmfMoYHw1zq3qHflGa3TEByxI/hV1UvRCHS6EhPmD0Wet
2TGUH5I7lv2VyztYW45JiFAHmu9hHSXD8n3goTvZKciWEg6QWwAAAAAAAA==

--Apple-Mail-4-142324757--
