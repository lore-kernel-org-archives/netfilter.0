From: "Walter H." <Walter.H@mathemainzel.info>
Subject: Routing some packets different?
Date: Sun, 06 Aug 2017 11:03:23 +0200
Message-ID: <5986DB5B.1070505@mathemainzel.info>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha1; boundary="------------ms040005030303050408060900"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mathemainzel.info; s=dkim11;
        h=Content-Type:Subject:To:MIME-Version:From:Date:Message-ID; bh=3pjNdVeV0vEGpKzPDBUVt/SuX6U9OHZQrJAq97XX6+U=;
        b=FrprZTdlptcpCt1HDwv0jX5LPVmbTEGjTWy7Mi68y/LO/9GTGwampYIDyupDXsPeG7IPyNHB5v4f2+UAten27OPXBPBAqRQ1Q1+bTBIPtxWzT8dWikRmVIjXBw3IDOaCpwlYYAinhWOoijwlOEOOOOrNI0DCP5TQCM9W5uJOLsE=;
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is a cryptographically signed message in MIME format.

--------------ms040005030303050408060900
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello,

this is my /etc/sysconfig/iptables of my router
(br0 is LAN,
  eth1 is WAN):

<BEGIN>
# Firewall configuration written by system-config-firewall
# Manual customization of this file is not recommended.
*nat
:PREROUTING ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]

# Establish NAT
-A POSTROUTING -o eth1 -s 192.168.1.0/24 -j SNAT --to-source #WANIP#

COMMIT

*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT DROP [0:0]

# Restricted host: extra chain
-N RESTRICT-HOST
-A RESTRICT-HOST -p icmp -j ACCEPT
-A RESTRICT-HOST -p udp --dport 123 -j ACCEPT
-A RESTRICT-HOST -p udp --sport 32769:65535 --dport 33434:33523 -j ACCEPT=

-A RESTRICT-HOST -j LOG --log-prefix "IP[FWD-ANY(out)]: " --log-level 7
-A RESTRICT-HOST -j REJECT

# Filter all packets with state INVALID
-A INPUT -m state --state INVALID -j DROP
-A FORWARD -m state --state INVALID -j DROP
-A OUTPUT -m state --state INVALID -j DROP

# Allow multicast
-A INPUT -d 224.0.0.0/4 -j ACCEPT
-A OUTPUT -d 224.0.0.0/4 -j ACCEPT

# Allow anything on the local link
-A INPUT -i lo -j ACCEPT
-A OUTPUT -o lo -j ACCEPT

# Allow anything out on LAN
-A OUTPUT -o br0 -j ACCEPT
# Allow established, related packets back in
-A INPUT -i br0 -m state --state ESTABLISHED,RELATED -j ACCEPT

# Enable DHCP for LAN
-A INPUT -i br0 -m udp -p udp --sport 67:68 --dport 67:68 -j ACCEPT

# Enable DNS-Cache for LAN
-A INPUT -i br0 -m tcp -p tcp --dport 53 -m state --state NEW -j ACCEPT
-A INPUT -i br0 -m udp -p udp --dport 53 -j ACCEPT

# Enable SSH from LAN
-A INPUT -i br0 -m tcp -p tcp --dport 22 -m state --state NEW -j ACCEPT

# Enable HTTP/HTTPS from LAN (some gui interface)
-A INPUT -i br0 -m tcp -p tcp --dport 80 -m state --state NEW -j ACCEPT
-A INPUT -i br0 -m tcp -p tcp --dport 443 -m state --state NEW -j ACCEPT

# Enable Squid-Proxy from LAN
-A INPUT -i br0 -m tcp -p tcp --dport 3128 -m state --state NEW -j ACCEPT=


# Allow anything out on internet
-A OUTPUT -o eth1 -j ACCEPT
# Allow established, related packets back in
-A INPUT -i eth1 -m state --state ESTABLISHED,RELATED -j ACCEPT

# Restricted Host: My PC (192.168.1.100)
-A FORWARD -i br0 -o eth1 -s 192.168.1.100 -j RESTRICT-HOST

# Allow Forwarding to WAN interface
-A FORWARD -i br0 -o eth1 -j ACCEPT
# Allow established, related packets back through
-A FORWARD -i eth1 -o br0 -m state --state ESTABLISHED,RELATED -j ACCEPT

# Only the lan is allowed to ping me without restriction
-A INPUT -i br0 -p icmp -j ACCEPT
# Else only pings with restricted icmp are allowed
-A INPUT -i eth1 -p icmp -m limit --limit 2/sec --limit-burst 4 -j ACCEPT=


# Enable TRACEroute to me from LAN
-A INPUT -i br0 -p udp --sport 32769:65535 --dport 33434:33523 -j ACCEPT
# Enable TRACEroute to me from internet
-A INPUT -i eth1 -p udp --sport 32769:65535 --dport 33434:33523 -j ACCEPT=


# Log all other
-A INPUT -j LOG --log-prefix "IP[IN]: " --log-level 7
-A FORWARD -j LOG  --log-prefix "IP[FWD]: " --log-level 7104.16.91.188
-A OUTPUT -j LOG  --log-prefix "IP[OUT]: " --log-level 7

COMMIT
</END>

I regularly see in  the log that HTTP traffic to these IPs
- 104.16.89.188
- 104.16.90.188
- 104.16.91.188
- 104.16.92.188
- 104.16.93.188

is there a way to redirect these packets through the squid-proxy running =

on the router?
or any other way to get to know what is causing these traffic?

Thanks,
Walter


--------------ms040005030303050408060900
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIKBDCC
BOgwggPQoAMCAQICDkgbagkTvYAkyl0i8BTzMA0GCSqGSIb3DQEBCwUAMEwxIDAeBgNVBAsT
F0dsb2JhbFNpZ24gUm9vdCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQD
EwpHbG9iYWxTaWduMB4XDTE2MDYxNTAwMDAwMFoXDTI0MDYxNTAwMDAwMFowXTELMAkGA1UE
BhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExMzAxBgNVBAMTKkdsb2JhbFNpZ24g
UGVyc29uYWxTaWduIDIgQ0EgLSBTSEEyNTYgLSBHMzCCASIwDQYJKoZIhvcNAQEBBQADggEP
ADCCAQoCggEBALaWaJNl/SwB7GKjDVS/i8ukQ5Gimq+xg/K1bW/Z8OrczxZ71xnjhAOF+cYf
cI8fbEnFaRkecJE4NX4CSF05axhEpmqlyHT0XfWEPmMfcUSCCD7tyaf26W4mQSmAyUm6/9l2
oKO7G/Z530so00p7nFHCD2VQoZ+oSp3lRgSNg0/cssg9z5ghCZhMwPGPeqk/NyZlR9hmj0km
wsNAvmY9bP86rSlG8BOc4fLrmaeLwtNfUG2iDm/HBpc4L06hjkcCtIMA2KTjukEHYOXdN1ry
B8E7p5yXaC6376lINrzpaaiZqkfpx/ZR0vmxLLbFSbWYnlNT2vty83wP+HE+1wP6Z8MCAwEA
AaOCAbUwggGxMA4GA1UdDwEB/wQEAwIBBjBqBgNVHSUEYzBhBggrBgEFBQcDAgYIKwYBBQUH
AwQGCCsGAQUFBwMJBgorBgEEAYI3FAICBgorBgEEAYI3CgMEBgkrBgEEAYI3FQYGCisGAQQB
gjcKAwwGCCsGAQUFBwMHBggrBgEFBQcDETASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdDgQW
BBRpcoJiMWeVRIV3kYDEBDZJnXsLYTAfBgNVHSMEGDAWgBSP8Et/qC5FJK5NUPpjmove4t0b
vDA+BggrBgEFBQcBAQQyMDAwLgYIKwYBBQUHMAGGImh0dHA6Ly9vY3NwMi5nbG9iYWxzaWdu
LmNvbS9yb290cjMwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNv
bS9yb290LXIzLmNybDBnBgNVHSAEYDBeMAsGCSsGAQQBoDIBKDAMBgorBgEEAaAyASgKMEEG
CSsGAQQBoDIBXzA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9y
ZXBvc2l0b3J5LzANBgkqhkiG9w0BAQsFAAOCAQEAqJ3NMsx8Z+ILUNelXHCjZuIl7+q0tlMw
bocSN1wz4sIoVuOTvUWV81jYFXFM8+SCiRS+/qXMR73rBlSCPua/vvXqiPV5xCgiC4x69g4L
4yquSZoOm8In8my2G1VKAbYZ4WhQdFi8EkUYT67eXhsTMOdVJjSAov4UigSrB4RhUhGiUAC2
cuBy9BFnbhOiC2AI1+gUl0Q7RxXlD3XW+On+R3+a8yExi7J/QSKaDla4EvO/DuCZ31FkItvc
gX5++R2o4nxbzwvrqp/q3FZ766S4LCzmBv+uJFl/xUR/PpoVXvpnEl98bFKXMSvavby01ba6
FP8iVJhAuDnB+XULGxwaozCCBRQwggP8oAMCAQICDDf7Me/cd27Vi+FlDzANBgkqhkiG9w0B
AQsFADBdMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTEzMDEGA1UE
AxMqR2xvYmFsU2lnbiBQZXJzb25hbFNpZ24gMiBDQSAtIFNIQTI1NiAtIEczMB4XDTE3MDQy
NDEwNDQxOFoXDTIwMDQyNDEwNDQxOFowVTELMAkGA1UEBhMCQVQxGzAZBgNVBAMTEldhbHRl
ciBIb2VobGh1Ym1lcjEpMCcGCSqGSIb3DQEJARYad2FsdGVyLmhAbWF0aGVtYWluemVsLmlu
Zm8wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDROn0wc2eBzHcRoKiSnUFz1H4T
SN5QEKhssd+B8F0YMDxEzXyvnOeCLAN+8+ui/fyZ0g1A8qgWIGkerNeJJgVes9Xf5EpemE5b
zksNPIoVQVB7sBfWezlJ6E12FUNssdLdcQlVqNtFnHtfZV0SD0BS87mW5GL75Ay8XpSkwwTV
6XpIAcKRyd7EFCw+7g2Udp/ZAjPZ4X7oZl8sFFlOClPvWu8LCjbnDcWHpE93QeXnmMx86LQg
tACrTy1PDX0yAOeCTan6F3sX0tz5Cp8sWduQiMaKof8yxW/t2V7BJwXhZhiDhax3y/AFREOH
NC5dJ2w1sFiwidK7sljogU7/orGHAgMBAAGjggHaMIIB1jAOBgNVHQ8BAf8EBAMCBaAwgZ4G
CCsGAQUFBwEBBIGRMIGOME0GCCsGAQUFBzAChkFodHRwOi8vc2VjdXJlLmdsb2JhbHNpZ24u
Y29tL2NhY2VydC9nc3BlcnNvbmFsc2lnbjJzaGEyZzNvY3NwLmNydDA9BggrBgEFBQcwAYYx
aHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL2dzcGVyc29uYWxzaWduMnNoYTJnMzBMBgNV
HSAERTBDMEEGCSsGAQQBoDIBKDA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxz
aWduLmNvbS9yZXBvc2l0b3J5LzAJBgNVHRMEAjAAMEQGA1UdHwQ9MDswOaA3oDWGM2h0dHA6
Ly9jcmwuZ2xvYmFsc2lnbi5jb20vZ3NwZXJzb25hbHNpZ24yc2hhMmczLmNybDAlBgNVHREE
HjAcgRp3YWx0ZXIuaEBtYXRoZW1haW56ZWwuaW5mbzAdBgNVHSUEFjAUBggrBgEFBQcDAgYI
KwYBBQUHAwQwHQYDVR0OBBYEFOQybe9sZCmROEwJqrOUU1qsTrgqMB8GA1UdIwQYMBaAFGly
gmIxZ5VEhXeRgMQENkmdewthMA0GCSqGSIb3DQEBCwUAA4IBAQBY5Zn+1HTT58xtZQgu1IcN
UI9t2PC0ps6sELyN3eCBvqYiqk5D8J58hNl9j0hnht5oM0aKVgTL1GNFu6J9DDd3Bk2sNmG6
8uIvo0NsJAFk23lMzKt+YOm3C6+oveuxICFhHeiTxn9z2jLfU+xYLg8UXpSl5U6m0uZcVoLA
YYYhLgpaSM8jNYgAv8U2NVK+f8hd4AVEpwyF2edKbZTAdj/iDmjmOm9lkUIzacemNR8DRxiD
Eb2XTZa5pcrsPOe1bisJ5wcHoIx+217fm8WJF7Vk2amB9fg8AM3cGU7V7D2Ynbg5tJdV5Et6
ff+sk9Fv1HRaFDqKQVorlDY1P5h1HsoxMYIDYTCCA10CAQEwbTBdMQswCQYDVQQGEwJCRTEZ
MBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTEzMDEGA1UEAxMqR2xvYmFsU2lnbiBQZXJzb25h
bFNpZ24gMiBDQSAtIFNIQTI1NiAtIEczAgw3+zHv3Hdu1YvhZQ8wCQYFKw4DAhoFAKCCAckw
GAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTcwODA2MDkwMzIz
WjAjBgkqhkiG9w0BCQQxFgQU4nBbZJtXLVAWW8wZDRpjJGy5oekwbAYJKoZIhvcNAQkPMV8w
XTALBglghkgBZQMEASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIA
gDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDB8BgkrBgEEAYI3EAQx
bzBtMF0xCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTMwMQYDVQQD
EypHbG9iYWxTaWduIFBlcnNvbmFsU2lnbiAyIENBIC0gU0hBMjU2IC0gRzMCDDf7Me/cd27V
i+FlDzB+BgsqhkiG9w0BCRACCzFvoG0wXTELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2Jh
bFNpZ24gbnYtc2ExMzAxBgNVBAMTKkdsb2JhbFNpZ24gUGVyc29uYWxTaWduIDIgQ0EgLSBT
SEEyNTYgLSBHMwIMN/sx79x3btWL4WUPMA0GCSqGSIb3DQEBAQUABIIBABJexuar9t+qqhrI
WNU6teD87jkml3H2YWdwTcxWCO0bukPWS2VrwPQTaQst57ayhzkfS/HUYcEGgXDBam8PRytU
OfSjkuivdo+d+QL5kVXKkVhtDBuKplkPH5MXoC46Lmdf7qHuR9AKPzusFJfDLcWVeIkeEAgv
6oC4xIH+Gi9Zq1+BqZejx38isaP+fob58tPKlfgPtUADY4UOqdmsX/bqxKW2WIYwbEfknD8o
+Guf4RU5dXCb8DhlZfAlojMl7h2nqbxbcAZTBYsg2bux/qjkiCfDmfFhnp8Os6yf7u/z9Ju2
gxb2cRBFijCYbCyxMrBHaJmOO4C6XWfhLMwP7H4AAAAAAAA=
--------------ms040005030303050408060900--
