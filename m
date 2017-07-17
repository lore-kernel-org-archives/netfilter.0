From: "Rajcan, Steven  L" <Steven.Rajcan@unisys.com>
Subject: RE: Distinguishing NAT(PAT) inbound frames when using IPsec Transport
 mode from multiple NAT(PAT) systems
Date: Mon, 17 Jul 2017 17:42:07 +0000
Message-ID: <DM5PR07MB353241878C77E394836064EF9AA00@DM5PR07MB3532.namprd07.prod.outlook.com>
References: <DM5PR07MB3532A88C49D99A7A420F56CD9AAF0@DM5PR07MB3532.namprd07.prod.outlook.com>
 <5b853f53-9c76-25a5-42d3-e2b693c0201b@familie-kuntze.de>
 <93d51af8-c58e-470e-8592-cf4dc96b9fc9@familie-kuntze.de>
Mime-Version: 1.0
Content-Type: multipart/signed;
        protocol="application/x-pkcs7-signature";
        micalg=SHA1;
        boundary="----=_NextPart_000_0171_01D2FF02.7A15EB40"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unisys.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=e0paV1+B/8DXz4Bffc4+eg8CqNaOkzrEfJcurLdGFdU=;
 b=cVg12fcc/24QesGu9Hx3z56nxHEltsJeWpomZVyBOXLyNd/ODChS5XTlpDCjhVBhg9T0QA0ibtN2BbzAHqrtgb4Qax4yhLXSofXNYMbiOIp/EtG3AYrshfrXXMmkimgyQqgduPZKjkFeHh9a1K+KsRAvNAioy9eE7P8VZwdWm/c=
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Noel Kuntze <noel@familie-kuntze.de>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

------=_NextPart_000_0171_01D2FF02.7A15EB40
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

I think part of the problem is that the conntrack entries are being
overwritten when the second TCP dialogue is initiated only in this scenario.

I retried a test with two PAT systems (192.168.0.1 and 192.168.0.2) both
initiating a TCP dialogue with source port 5000 to port 9000 of a public
system (20.20.20.20). Both established an IPsec SA with a unique mark. I
added following SNAT rules to try to force each PAT connection to modify the
source port to a specified port:
	iptables -t nat -A INPUT -s 20.20.20.10 -m mark --mark 0x01 -p tcp
--sport 5000 -j SNAT --to-source 20.20.20.10:5011
	iptables -t nat -A INPUT -s 20.20.20.10 -m mark --mark 0x02 -p tcp
--sport 5000 -j SNAT --to-source 20.20.20.10:5012

I attempted the first TCP dialogue and saw this conntrack entry:
	tcp      6 431991 ESTABLISHED src=20.20.20.10 dst=20.20.20.20
sport=5000 dport=9000 src=20.20.20.10 dst=20.20.20.20 sport=9000 dport=5011
[ASSURED] mark=1 use=1
I attempted the second dialogue and saw this conntrack entry but the
previous one was removed:
	tcp      6 431999 ESTABLISHED src=20.20.20.10 dst=20.20.20.20
sport=5000 dport=9000 src=20.20.20.10 dst=20.20.20.20 sport=9000 dport=5012
[ASSURED] mark=2 use=1

I had inserted a LOG in the mangle OUPUT chain and saw that after the second
dialogue was initiated, a single TCP response frame was sent to the first
PAT system with the modified source port (5011) and mark (0x02) mismatched:
	kernel: [ 6484.314200] IN= OUT=eth0 SRC=20.20.20.20 DST=20.20.20.10
LEN=64 TOS=0x00 PREC=0x00 TTL=64 ID=15222 DF PROTO=TCP SPT=9000 DPT=5011
WINDOW=227 RES=0x00 ACK URGP=0 MARK=0x2
Subsequent frames back to the first PAT system showed no mark and no
modified source port
	kernel: [ 6503.198838] IN= OUT=eth0 SRC=20.20.20.20 DST=20.20.20.10
LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=59925 DF PROTO=TCP SPT=9000 DPT=5000
WINDOW=0 RES=0x00 RST URGP=0

TCP responses to the second dialogue were appropriate.
	kernel: [ 5680.324821] IN= OUT=eth0 SRC=20.20.20.20 DST=20.20.20.10
LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=32252 DF PROTO=TCP SPT=9000 DPT=5012
WINDOW=227 RES=0x00 ACK URGP=0 MARK=0x2

>Noel,
>
>Thanks for the response. We are already using the connmark plugin in
>Strongswan. Using that plugin we are able to correctly configure and
>establish IPsec SAs that map to individual PAT systems. Data transfer
>through those SAs works fine except in the one case described where
multiple
>PAT systems attempt a TCP or UDP dialogue to a common port of a public
>system with a common source port.
>
>I tried the SNAT you suggested but modified for the environment:
>       iptables -t nat -A INPUT -m policy --pol ipsec --dir in -j SNAT
>--to-source 20.20.20.10 --random
>The source port was modified but it used the same source port for both
>inbound frames from each PAT endpoint. So the problem remained. The second
>TCP attempt succeeded but replaced the first TCP connection.
>
>The inbound, transformed frames maintain the mark set by the connmark. This
>means we can associate each inbound frame came from which PAT system. So I
>tried to SNAT just the port on marked inbound frames with the following:
>       iptables -t nat -A INPUT -s 20.20.20.10 -m mark ! --mark 0x00 -j
>SNAT --to-source 20.20.20.10 --random
>The source ports were changed but the new source port was again the same
for
>each frame from both PAT systems.
>
>I then tried to create two SNAT entries, one for each mark that was created
>by the connmark plugin:
>       iptables -t nat -A INPUT -s 20.20.20.10 -m mark --mark 0x01 -j SNAT
>--to-source 20.20.20.10 --random
>       iptables -t nat -A INPUT -s 20.20.20.10 -m mark --mark 0x02 -j SNAT
>--to-source 20.20.20.10 --random
>Again, the source ports were changed but the new source port was again the
>same for each frame from both PAT systems.
>
>Finally, I decided to create a TCP dialogue specific SNAT entry with an
>assigned modified port for each PAT system. That way I knew the original
>source ports from each PAT system would be mapped to unique source ports:
>       iptables -t nat -A INPUT -s 20.20.20.10/32 -p tcp -m mark --mark 0x1
>-m tcp --sport 5000 -j SNAT --to-source 20.20.20.10:5001
>       iptables -t nat -A INPUT -s 20.20.20.10/32 -p tcp -m mark --mark 0x2
>-m tcp --sport 5000 -j SNAT --to-source 20.20.20.10:5002
>When I attempted the test, the first TCP connection showed the mapped
source
>port of 5001. However, the second TCP connection again replaced the first.
I
>double checked with netstat and verified that there was only one TCP
>dialogue with the modified source port (5002) mapped from the second PAT
>system. This does not make sense but that is what happened.
>
>I think the issue is that the stack does not map the restored reply frame
>back to the correct IPsec SA for a particular PAT system but only in this
>scenario when the original post-transform inbound frames are identical from
>multiple PAT peers.
>
>Steve
>
> >I forgot to mention, that you can perform nat in INPUT and randomize the
>source ports with SNAT.
>>-t nat -A INPUT -m policy --pol ipsec --dir in -j SNAT --random
>>
>>Check the man page for iptables-extensions for details.
>>*nat INPUT isn't in the colourful graph that Jan Engelhardt made, but it
>exists.
>>
>>On 12.07.2017 21:41, Noel Kuntze wrote:
>>> Hello Steven,
>>>
>>> Take a look at what the connmark plugin[1] of strongSwan does.
>>> I think doing the same fixes your problem. Or switch to strongSwan
>>> right away and use the plugin.
>>>
>>> [1] https://wiki.strongswan.org/projects/strongswan/wiki/Connmark
>>>
>>> Kind regards
>>>
>>> Noel
>>>
>>> On 12.07.2017 21:35, Rajcan, Steven  L wrote:
>>>> Hello,
>>>>
>>>> I have created IPsec policies using transport mode that allow systems
>behind
>>>> a NAT(PAT) router to connect to a public system. The issue I am having
>is on
>>>> a public system with established IPsec tunnels to systems behind a PAT
>>>> (Port-Address-Translation) router. These routers multiplex systems
>behind a
>>>> single IPV4 address. The IPsec SAs are created properly and I am able
to
>>>> send data from these PAT system to the public system through the IPsec
>>>> tunnels in most scenarios. However, it is possible that frames sent
from
>two
>>>> or more PAT systems arrive at the public server stack with the same
>source
>>>> port, same source IP, same destination port, and same destination IP.
>This
>>>> occurs because the PAT router cannot modify the original TCP or UDP
>payload
>>>> encapsulated in the ESP frame. In these scenarios, the stack on the
>public
>>>> system gets confused and cannot map replies to those frame back through
>the
>>>> correct IPsec tunnel of the PAT system.
>>>>
>>>> Consider two PAT systems attempting a TCP connection to the same public
>>>> server but each happens to use the same local port of 45000.
>>>>     PAT1 system IP addr:               192.168.0.1
>>>>     PAT2 system IP addr                192.168.0.2
>>>>     PAT router public IP addr        20.20.20.10
>>>>     Public system IP addr:              20.20.20.20
>>>> Note that the original TCP frame, sent by the PATx system is
>encapsulated in
>>>> a UDP/ESP frame and is therefore, not modified by the PAT router.
>>>>                 PAT1 [192.168.0.1:45000,20.20.20.20:80] --> PAT Router
[
>>>> 10.10.10.10] -> public system [20.20.20.20:80]
>>>>                 PAT2 [192.168.0.2:45000,20.20.20.20:80] --> PAT Router
[
>>>> 10.10.10.10] -> public system [20.20.20.20:80]
>>>> The original IP of the PAT systems is NAT'ed to that of the PAT router
>and
>>>> the post-transform, inbound frames arriving at the public system stack
>are
>>>> identical for both endpoints. [10.10.10.10:4500,20.20.20.20:90]
>>>>
>>>> When testing this scenario, the first PAT system establish the TCP
>>>> connection properly. The second PAT system also connects but only a
>single
>>>> TCP connection is established on the public system. An iptables log
>seems to
>>>> indicate that the second TCP connection replaces the first.
>>>>
>>>> We have discovered that other platforms handle this scenario
>automatically
>>>> on the public system by modifying the source port on the inbound,
>>>> post-transform frame before it is sent up the stack. Thus the stack
sees
>a
>>>> unique frame for every TCP and UDP dialogue with the PAT endpoints. The
>>>> reply frame then contains the modified source port which is restored by
>the
>>>> OS to the original source port and is directed back through the
original
>>>> IPsec tunnel.
>>>>
>>>> So the questions is, can the Linux kernel do the same or something
>similar?
>>>> I looked at the xfrm routines and could not find anything that
indicates
>>>> that it could.
>>>>
>>>> Please note that using tunnel mode instead of transport mode is not an
>>>> option for our situation.
>>>>
>>>> Any help would be appreciated.
>>>> Thanks
>>>>
>>>> Steve Rajcan
>>>> mailto:Steven.Rajcan@unisys.com

-----Original Message-----
From: Rajcan, Steven L 
Sent: Friday, July 14, 2017 2:06 PM
To: 'Noel Kuntze' <noel@familie-kuntze.de>; netfilter@vger.kernel.org
Subject: RE: Distinguishing NAT(PAT) inbound frames when using IPsec
Transport mode from multiple NAT(PAT) systems

Noel,

Thanks for the response. We are already using the connmark plugin in
Strongswan. Using that plugin we are able to correctly configure and
establish IPsec SAs that map to individual PAT systems. Data transfer
through those SAs works fine except in the one case described where multiple
PAT systems attempt a TCP or UDP dialogue to a common port of a public
system with a common source port.

I tried the SNAT you suggested but modified for the environment:
	iptables -t nat -A INPUT -m policy --pol ipsec --dir in -j SNAT
--to-source 20.20.20.10 --random
The source port was modified but it used the same source port for both
inbound frames from each PAT endpoint. So the problem remained. The second
TCP attempt succeeded but replaced the first TCP connection.

The inbound, transformed frames maintain the mark set by the connmark. This
means we can associate each inbound frame came from which PAT system. So I
tried to SNAT just the port on marked inbound frames with the following:
	iptables -t nat -A INPUT -s 20.20.20.10 -m mark ! --mark 0x00 -j
SNAT --to-source 20.20.20.10 --random
The source ports were changed but the new source port was again the same for
each frame from both PAT systems. 

I then tried to create two SNAT entries, one for each mark that was created
by the connmark plugin:
	iptables -t nat -A INPUT -s 20.20.20.10 -m mark --mark 0x01 -j SNAT
--to-source 20.20.20.10 --random
	iptables -t nat -A INPUT -s 20.20.20.10 -m mark --mark 0x02 -j SNAT
--to-source 20.20.20.10 --random
Again, the source ports were changed but the new source port was again the
same for each frame from both PAT systems.

Finally, I decided to create a TCP dialogue specific SNAT entry with an
assigned modified port for each PAT system. That way I knew the original
source ports from each PAT system would be mapped to unique source ports:
	iptables -t nat -A INPUT -s 20.20.20.10/32 -p tcp -m mark --mark 0x1
-m tcp --sport 5000 -j SNAT --to-source 20.20.20.10:5001
	iptables -t nat -A INPUT -s 20.20.20.10/32 -p tcp -m mark --mark 0x2
-m tcp --sport 5000 -j SNAT --to-source 20.20.20.10:5002
When I attempted the test, the first TCP connection showed the mapped source
port of 5001. However, the second TCP connection again replaced the first. I
double checked with netstat and verified that there was only one TCP
dialogue with the modified source port (5002) mapped from the second PAT
system. This does not make sense but that is what happened. 

I think the issue is that the stack does not map the restored reply frame
back to the correct IPsec SA for a particular PAT system but only in this
scenario when the original post-transform inbound frames are identical from
multiple PAT peers. 

Steve

 >I forgot to mention, that you can perform nat in INPUT and randomize the
source ports with SNAT.
>-t nat -A INPUT -m policy --pol ipsec --dir in -j SNAT --random
>
>Check the man page for iptables-extensions for details.
>*nat INPUT isn't in the colourful graph that Jan Engelhardt made, but it
exists.
>
>On 12.07.2017 21:41, Noel Kuntze wrote:
>> Hello Steven,
>>
>> Take a look at what the connmark plugin[1] of strongSwan does.
>> I think doing the same fixes your problem. Or switch to strongSwan
>> right away and use the plugin.
>>
>> [1] https://wiki.strongswan.org/projects/strongswan/wiki/Connmark
>>
>> Kind regards
>>
>> Noel
>>
>> On 12.07.2017 21:35, Rajcan, Steven  L wrote:
>>> Hello,
>>>
>>> I have created IPsec policies using transport mode that allow systems
behind
>>> a NAT(PAT) router to connect to a public system. The issue I am having
is on
>>> a public system with established IPsec tunnels to systems behind a PAT
>>> (Port-Address-Translation) router. These routers multiplex systems
behind a
>>> single IPV4 address. The IPsec SAs are created properly and I am able to
>>> send data from these PAT system to the public system through the IPsec
>>> tunnels in most scenarios. However, it is possible that frames sent from
two
>>> or more PAT systems arrive at the public server stack with the same
source
>>> port, same source IP, same destination port, and same destination IP.
This
>>> occurs because the PAT router cannot modify the original TCP or UDP
payload
>>> encapsulated in the ESP frame. In these scenarios, the stack on the
public
>>> system gets confused and cannot map replies to those frame back through
the
>>> correct IPsec tunnel of the PAT system.
>>>
>>> Consider two PAT systems attempting a TCP connection to the same public
>>> server but each happens to use the same local port of 45000.
>>>     PAT1 system IP addr:               192.168.0.1
>>>     PAT2 system IP addr                192.168.0.2
>>>     PAT router public IP addr        20.20.20.10
>>>     Public system IP addr:              20.20.20.20
>>> Note that the original TCP frame, sent by the PATx system is
encapsulated in
>>> a UDP/ESP frame and is therefore, not modified by the PAT router.
>>>                 PAT1 [192.168.0.1:45000,20.20.20.20:80] --> PAT Router [
>>> 10.10.10.10] -> public system [20.20.20.20:80]
>>>                 PAT2 [192.168.0.2:45000,20.20.20.20:80] --> PAT Router [
>>> 10.10.10.10] -> public system [20.20.20.20:80]
>>> The original IP of the PAT systems is NAT'ed to that of the PAT router
and
>>> the post-transform, inbound frames arriving at the public system stack
are
>>> identical for both endpoints. [10.10.10.10:4500,20.20.20.20:90]
>>>
>>> When testing this scenario, the first PAT system establish the TCP
>>> connection properly. The second PAT system also connects but only a
single
>>> TCP connection is established on the public system. An iptables log
seems to
>>> indicate that the second TCP connection replaces the first.
>>>
>>> We have discovered that other platforms handle this scenario
automatically
>>> on the public system by modifying the source port on the inbound,
>>> post-transform frame before it is sent up the stack. Thus the stack sees
a
>>> unique frame for every TCP and UDP dialogue with the PAT endpoints. The
>>> reply frame then contains the modified source port which is restored by
the
>>> OS to the original source port and is directed back through the original
>>> IPsec tunnel.
>>>
>>> So the questions is, can the Linux kernel do the same or something
similar?
>>> I looked at the xfrm routines and could not find anything that indicates
>>> that it could.
>>>
>>> Please note that using tunnel mode instead of transport mode is not an
>>> option for our situation.
>>>
>>> Any help would be appreciated.
>>> Thanks
>>>
>>> Steve Rajcan
>>> mailto:Steven.Rajcan@unisys.com


------=_NextPart_000_0171_01D2FF02.7A15EB40
Content-Type: application/pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIa6zCCBJEw
ggN5oAMCAQICBEVrUFQwDQYJKoZIhvcNAQEFBQAwgbAxCzAJBgNVBAYTAlVTMRYwFAYDVQQKEw1F
bnRydXN0LCBJbmMuMTkwNwYDVQQLEzB3d3cuZW50cnVzdC5uZXQvQ1BTIGlzIGluY29ycG9yYXRl
ZCBieSByZWZlcmVuY2UxHzAdBgNVBAsTFihjKSAyMDA2IEVudHJ1c3QsIEluYy4xLTArBgNVBAMT
JEVudHJ1c3QgUm9vdCBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTAeFw0wNjExMjcyMDIzNDJaFw0y
NjExMjcyMDUzNDJaMIGwMQswCQYDVQQGEwJVUzEWMBQGA1UEChMNRW50cnVzdCwgSW5jLjE5MDcG
A1UECxMwd3d3LmVudHJ1c3QubmV0L0NQUyBpcyBpbmNvcnBvcmF0ZWQgYnkgcmVmZXJlbmNlMR8w
HQYDVQQLExYoYykgMjAwNiBFbnRydXN0LCBJbmMuMS0wKwYDVQQDEyRFbnRydXN0IFJvb3QgQ2Vy
dGlmaWNhdGlvbiBBdXRob3JpdHkwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC2lbZD
QvrGbSpvSN+UTDlXBe7DeRFBaDbt7P6aAY+hOCj89xBGZi5NHhqxGk7G0cCViLDJ/zGLMwPbt4N7
PiCEXu2yViin+OC5QHE3xctHDpcqaMAilWIV20fZ9dAr/4JLya0+3kzbkIBQPwmKhADsMAo9GM37
/SpZmiOVFyxFnh9uQ3ltDFyY/kinxSNHXF79bucetPZoRdGGg1uiio2x4ymA/iVxiK2+vI+sUpZL
qlGN5BMxGehOTZ/brLNq1bw5VHHKenp/kN19HYDZgbtZJsIR/uaT4veA5GX7NDcOKYBwTa84hi6e
f1evnheu6xzLKCFfthzY56IEIvnT2tjLAgMBAAGjgbAwga0wDgYDVR0PAQH/BAQDAgEGMA8GA1Ud
EwEB/wQFMAMBAf8wKwYDVR0QBCQwIoAPMjAwNjExMjcyMDIzNDJagQ8yMDI2MTEyNzIwNTM0Mlow
HwYDVR0jBBgwFoAUaJDkZ6SmU4DHhmak8fdLQ/uEvW0wHQYDVR0OBBYEFGiQ5GekplOAx4ZmpPH3
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
gDAHBgUrDgMCBzAKBggqhkiG9w0DBzAdBgNVHQ4EFgQU8IoGNURBsB/WUOLAj3MNr2tPcBowHwYD
VR0jBBgwFoAUXkfIMPFDvwHPOiMDwJ4BAgNYfmEwQQYDVR0fBDowODA2oDSgMoYwaHR0cDovL3Vp
c3BraS51bmlzeXMuY29tL3JlcC9VSVMtSXN1QjEtQ0EoNikuY3JsMHcGCCsGAQUFBwEBBGswaTA8
BggrBgEFBQcwAoYwaHR0cDovL3Vpc3BraS51bmlzeXMuY29tL3JlcC9VSVMtSXN1QjEtQ0EoNiku
Y3J0MCkGCCsGAQUFBzABhh1odHRwOi8vcGVjczEudW5pc3lzLmNvbS9vY3NwLzAjBgNVHREEHDAa
gRhTdGV2ZW4uUmFqY2FuQHVuaXN5cy5jb20wDQYJKoZIhvcNAQELBQADggEBAAOkVkVgQJqTaE4e
djpula4Lb2HHe425NySHkRuRJsZ3gEPs5VBYYyeyAlf0IEzfa74h/n1l0pqSf8uErGk+jlOFV+7W
SxYY03picvXwk3wbTeaYwRXf5P8aHDXqYlPauDMcqOlKqNLmYklJh4SkFzpwnIcGFAwQ/Dvt1YHt
i36PWmnoWVEe7B243e4zp+ehkSiExylMESmXVzgk7voFuXFfJpM/oO2r1TP5fNR7fxA0WgLWdMM8
UetPWdBSK+VCF7VXApR9pwW39FqO+8qRlZHaSRBEtwnB0+L3mmIXi5vq9zn79SMExhb7cJpO14p7
I5zPYjl8aOfW5xyARoBBVkAwggcAMIIF6KADAgECAgoQSGGkAAYAAAAYMA0GCSqGSIb3DQEBCwUA
MBYxFDASBgNVBAMTC1VJUy1JbnRCLUNBMB4XDTE1MTAxOTE3NTUzMloXDTIxMTAxOTE4MDUzMlow
WTETMBEGCgmSJomT8ixkARkWA2NvbTEWMBQGCgmSJomT8ixkARkWBnVuaXN5czETMBEGCgmSJomT
8ixkARkWA3VpczEVMBMGA1UEAxMMVUlTLUlzdUIxLUNBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A
MIIBCgKCAQEAzxZCmWWZPZnkBSMK2ALw+me532YzNjAaJ8Jl+0C1MP8XpiqmSYu7XzXG0hoJpSnQ
TftHtz/Ej9T67yMl/KFgGtD+0fJgddgb+mUPOB4o2E0mFC0xMR5mm23plCGPVfdH1r+WEFYuAZpc
Hh6ke5y8vy9TzChemi/YDKREw+7z+2R7oTwQ2/S8eDWRxuvrAN+4qqoAcgDMv4N2EvHXkeuV1P5D
9H6aEhLgTkwvRCS2SSftXLQYMsvio1x5CLbag4fIHJ6uBR93DRUBj9wcTOe1POiDv+v6UkqaUnZ7
SG96lnjpZBup4srwdEJFFyqD5kq9Ux+IPPfRTR4hpE0kevoLhwIDAQABo4IECzCCBAcwDgYDVR0P
AQH/BAQDAgGGMBIGCSsGAQQBgjcVAQQFAgMGAAYwIwYJKwYBBAGCNxUCBBYEFKwIWz4yX+iqzaNJ
t5hs96yYnEN7MB0GA1UdDgQWBBReR8gw8UO/Ac86IwPAngECA1h+YTCCAiAGA1UdIASCAhcwggIT
MDkGCmCGSAGG/TABAQcwKzApBggrBgEFBQcCARYdaHR0cDovL3Vpc3BraS51bmlzeXMuY29tL3Jl
cC8wOQYKYIZIAYb9MAEBPTArMCkGCCsGAQUFBwIBFh1odHRwOi8vdWlzcGtpLnVuaXN5cy5jb20v
cmVwLzA5BgpghkgBhv0wAQEDMCswKQYIKwYBBQUHAgEWHWh0dHA6Ly91aXNwa2kudW5pc3lzLmNv
bS9yZXAvMDkGCmCGSAGG/TABAQIwKzApBggrBgEFBQcCARYdaHR0cDovL3Vpc3BraS51bmlzeXMu
Y29tL3JlcC8wOQYKYIZIAYb9MAEBBDArMCkGCCsGAQUFBwIBFh1odHRwOi8vdWlzcGtpLnVuaXN5
cy5jb20vcmVwLzA5BgpghkgBhv0wAQEFMCswKQYIKwYBBQUHAgEWHWh0dHA6Ly91aXNwa2kudW5p
c3lzLmNvbS9yZXAvMDkGCmCGSAGG/TABAQ4wKzApBggrBgEFBQcCARYdaHR0cDovL3Vpc3BraS51
bmlzeXMuY29tL3JlcC8wOQYKYIZIAYb9MAEBATArMCkGCCsGAQUFBwIBFh1odHRwOi8vdWlzcGtp
LnVuaXN5cy5jb20vcmVwLzA5BgpghkgBhv0wAQEGMCswKQYIKwYBBQUHAgEWHWh0dHA6Ly91aXNw
a2kudW5pc3lzLmNvbS9yZXAvMBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBBMBIGA1UdEwEB/wQI
MAYBAf8CAQAwHwYDVR0jBBgwFoAUcjcBNj34ZtYDmE71+AAupCSqdiAwcQYDVR0fBGowaDBmoGSg
YoYvaHR0cDovL3Vpc3BraS51bmlzeXMuY29tL3JlcC9VSVMtSW50Qi1DQSg2KS5jcmyGL2h0dHA6
Ly9wa2lyZXAudW5pc3lzLmNvbS9yZXAvVUlTLUludEItQ0EoNikuY3JsMIG1BggrBgEFBQcBAQSB
qDCBpTA7BggrBgEFBQcwAoYvaHR0cDovL3Vpc3BraS51bmlzeXMuY29tL3JlcC9VSVMtSW50Qi1D
QSg2KS5jcnQwOwYIKwYBBQUHMAKGL2h0dHA6Ly9wa2lyZXAudW5pc3lzLmNvbS9yZXAvVUlTLUlu
dEItQ0EoNikuY3J0MCkGCCsGAQUFBzABhh1odHRwOi8vcGVjczEudW5pc3lzLmNvbS9vY3NwLzAN
BgkqhkiG9w0BAQsFAAOCAQEAVnYItqwJLH0Vg4aQZWxCNSNqsOz2wd0sIbT+/5NIoeM+owWFaVdN
U/aNZZyjtRSfJt+hJELd3ZYb9sHUQnyZCfvNaaB2wVDPnTOUmkvWVoiiGx8sbHpuETiIkIqGB3xF
GOtB3XdOt00L18sCGGpuMGuNFYDW7GAPexeu7uUOuW7BkjvBcJnh1xIjS97R6gG7av4hkoK39YUQ
wZvU3HAgof7JCf9x4zObylzY/++ojSgt8R6/L6khADxL3huB2F+ep7Qxj29s5GhyVwT96oH39CPk
6JNeXrpnIpUD3Wq1CJtj4NOm9Gg9X/kri8RvDBqS1l+dOBSboxlp9GMYxo891TGCA5MwggOPAgEB
MHAwWTETMBEGCgmSJomT8ixkARkWA2NvbTEWMBQGCgmSJomT8ixkARkWBnVuaXN5czETMBEGCgmS
JomT8ixkARkWA3VpczEVMBMGA1UEAxMMVUlTLUlzdUIxLUNBAhM5AADrKe1AhKdd7UcTAAYAAOsp
MAkGBSsOAwIaBQCgggH4MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8X
DTE3MDcxNzE3NDIwNVowIwYJKoZIhvcNAQkEMRYEFGXlSc0nketMonCF+VbuPraCGdpbMH8GCSsG
AQQBgjcQBDFyMHAwWTETMBEGCgmSJomT8ixkARkWA2NvbTEWMBQGCgmSJomT8ixkARkWBnVuaXN5
czETMBEGCgmSJomT8ixkARkWA3VpczEVMBMGA1UEAxMMVUlTLUlzdUIxLUNBAhM5AAEhXOYqD+Pq
E7KOAAYAASFcMIGBBgsqhkiG9w0BCRACCzFyoHAwWTETMBEGCgmSJomT8ixkARkWA2NvbTEWMBQG
CgmSJomT8ixkARkWBnVuaXN5czETMBEGCgmSJomT8ixkARkWA3VpczEVMBMGA1UEAxMMVUlTLUlz
dUIxLUNBAhM5AAEhXOYqD+PqE7KOAAYAASFcMIGTBgkqhkiG9w0BCQ8xgYUwgYIwCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjAKBggqhkiG9w0DBzALBglghkgBZQMEAQIwDgYIKoZIhvcNAwICAgCA
MA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIaMAsGCWCGSAFlAwQCAzALBglghkgBZQMEAgIwCwYJYIZI
AWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAI1fTXX+8GbDXfP8t8zykt0yvS+ewBoRbqMBoQ26JRR3
je8Zyp/Ot+9JOQbO8nx0YFv+95pjveMr+Y74FhQwZ8eoJHQ/kBCgjQcguUD9Btx823G4Wg4WTxAp
eadbsiPO+NjBspSqsT99BdyWRe8fBvj/d9CRydWHaOypWPUr1jwAWnI8/v0GxafaN45B4Kn7V0O8
ow2d1fekRj8kn/UgbuwzFs+PbTtzB2vZMtccoxlCk0odsJVYx2zE9dSvlh3XnQ37ux/eprpW5opE
x/3Ru/t8eAzFy2Z20cFBOzjZU6VQLf4JRWTiRqfx2LB1ogEzFri8ik7B0E0wn0uiM9s2pUMAAAAA
AAA=

------=_NextPart_000_0171_01D2FF02.7A15EB40--
