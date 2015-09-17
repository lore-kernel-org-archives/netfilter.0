From: "Tamtamis, Panagiotis" <panagiotis.tamtamis@unify.com>
Subject: RE: Kernel access of bad area
Date: Thu, 17 Sep 2015 09:15:24 +0000
Message-ID: <0D74DA672F03634EA90EB18A61E36D271E15308C@MCHP01MSX.global-ad.net>
References: <0D74DA672F03634EA90EB18A61E36D271E152FF4@MCHP01MSX.global-ad.net>
 <BAY403-EAS13709A37949FAF5BEAF9D6B955A0@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=SHA1; boundary="----=_NextPart_000_0300_01D0F142.875CDD10"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BAY403-EAS13709A37949FAF5BEAF9D6B955A0@phx.gbl>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Feng Gao <gfree.wind@outlook.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

------=_NextPart_000_0300_01D0F142.875CDD10
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable

The kernel version is 3.12.19-rt30

At that particular part of code the only addition was function
"nf_ct_key_equal" which just tests "nf_ct_is_confirmed(ct)"

But from the dump the crash seems to be on "nf_ct_tuple_equal" before =
even
" nf_ct_is_confirmed" is called.

-----Original Message-----
From: Feng Gao [mailto:gfree.wind@outlook.com]=20
Sent: Thursday, September 17, 2015 12:06 PM
To: Tamtamis, Panagiotis; netfilter@vger.kernel.org
Subject: =B4=F0=B8=B4: Kernel access of bad area

You should show your kernel version.
I remember there was one similar bug in netfilter codes before.=20

-----=D3=CA=BC=FE=D4=AD=BC=FE-----
=B7=A2=BC=FE=C8=CB: netfilter-owner@vger.kernel.org =
[mailto:netfilter-owner@vger.kernel.
org] =B4=FA=B1=ED Tamtamis, Panagiotis
=B7=A2=CB=CD=CA=B1=BC=E4: 2015=C4=EA9=D4=C217=C8=D5 16:59
=CA=D5=BC=FE=C8=CB: netfilter@vger.kernel.org
=D6=F7=CC=E2: Kernel access of bad area

Hello to all,

We had the following dump at netfilter code:


Unable to handle kernel paging request for data at address 0x7fe3fb80
Faulting instruction address: 0xf15a69b4
Oops: Kernel access of bad area, sig: 11 [#1]
SMP NR_CPUS=3D2 OCC
Modules linked in: nf_conntrack_netlink pppoe pppox ppp_generic slhc
ppp_drv(O) msp(O) xt_nat iptable_raw xt_CT xt_mark xt_DSCP =
ipt_MASQUERADE
iptable_nat nf_nat_ipv4 nf_nat xt_limit xt_TCPMSS iptable_mangle
nfnetlink_queue nfnetlink_log nfnetlink httpk(O) nf_conntrack_ipv6
nf_defrag_ipv6 ip6table_filter ip6_tables xt_tcpudp nf_conntrack_ipv4
nf_defrag_ipv4 xt_pkttype xt_conntrack nf_conntrack iptable_filter =
ip_tables
x_tables i2c_dev tun drv_vxt(O) avmfritz mISDN_isac mISDN_l1 falc_e1
drv_tapi(O) tlani_fpga mISDN_core drv_ifxos(O) cma_card iomengine =
cma_mfc
tdmswitch bmod_scc lsb hdlc_scc scc_core icgx common_irq board_control =
akse
CPU: 1 PID: 17461 Comm: kworker/u4:0 Tainted: G           O 3.12.19-rt30 =
#1
Workqueue: DSP_MGMT dsp_rsrv [msp]
task: db91df80 ti: efb5e000 task.ti: d52ec000
NIP: f15a69b4 LR: f15a6958 CTR: c0037aa0
REGS: efb5fbf0 TRAP: 0300   Tainted: G           O  (3.12.19-rt30)
MSR: 00029000 <CE,EE,ME>  CR: 28ef2324  XER: 00000000
DEAR: 7fe3fb80, ESR: 00000000

GPR00: 00000000 efb5fca0 db91df80 c0771960 c078d988 efb5e000 0000c37c
c078d988=20
GPR08: 0005b524 c0a88368 00cd5000 7fe3fb78 c0037aa0 00000000 d3cfdc00
c5782b40=20
GPR16: 00000020 ef4da618 00000001 000086dd 00000000 c0772cc0 80000000
c37d7a2d=20
GPR24: 00000014 f15b3e28 00000000 f15e5980 000030df efb5fcf4 7fe3fb78
c0771960=20
NIP [f15a69b4] ____nf_conntrack_find+0x88/0x1a8 [nf_conntrack]
LR [f15a6958] ____nf_conntrack_find+0x2c/0x1a8 [nf_conntrack]
Call Trace:
[efb5fca0] [00000015] 0x15 (unreliable)
[efb5fcc0] [f15a6b14] __nf_conntrack_find_get+0x40/0x198 [nf_conntrack]
[efb5fce0] [f15a8b54] nf_conntrack_in+0x384/0x700 [nf_conntrack]
[efb5fd50] [f15e42ac] ipv4_conntrack_in+0x24/0x34 [nf_conntrack_ipv4]
[efb5fd60] [c047e364] nf_iterate+0x98/0xfc
[efb5fd90] [c047e43c] nf_hook_slow+0x74/0x158
[efb5fdd0] [c04857b4] ip_rcv+0x388/0x4f0
[efb5fe00] [c044ed3c] __netif_receive_skb_core+0x504/0x6d0
[efb5fe60] [c0450f64] netif_receive_skb+0x3c/0xd0
[efb5fe90] [c0453d88] napi_gro_receive+0xb4/0xec
[efb5fea0] [c0378e24] gfar_process_frame+0xac/0x188
[efb5fed0] [c037b08c] gfar_clean_rx_ring+0x194/0x46c
[efb5ff40] [c037b3a4] gfar_poll_rx_sq+0x40/0xac
[efb5ff60] [c0451310] net_rx_action+0x110/0x1c8
[efb5ff90] [c0037dd0] __do_softirq+0x10c/0x1c8
[efb5fff0] [c000e444] call_do_softirq+0x24/0x3c
[efb5dfb0] [c000494c] do_softirq+0x8c/0xb4
[efb5dfd0] [c0038790] irq_exit+0x7c/0x90
[efb5dfe0] [c0004624] __do_irq+0x4c/0x94
[efb5dff0] [c000e480] call_do_irq+0x24/0x3c
[d52edc10] [c00046f8] do_IRQ+0x8c/0xe0
[d52edc30] [c0010880] ret_from_except+0x0/0x18
--- Exception: 501 at vprintk_emit+0x1f0/0x4ac
    LR =3D vprintk_emit+0x254/0x4ac
[d52edd40] [c0563648] printk+0x68/0x78
[d52edd80] [f2728980] fEvent+0x218/0x230 [msp]
[d52ede00] [f277230c] dspCheckCommonMessage+0x32c/0x9c8 [msp]
[d52ede40] [f275bc84] dsp_rsrv+0x188/0x274 [msp]
[d52edea0] [c004b894] process_one_work+0x120/0x348
[d52edec0] [c004c658] worker_thread+0xf0/0x2c4
[d52edef0] [c0052dfc] kthread+0x98/0x9c
[d52edf40] [c00102fc] ret_from_kernel_thread+0x5c/0x64
--- Exception: 0 at   (null)
    LR =3D   (null)
Instruction dump:
80050008 813f047c 5400103a 7d47002e 7d09502e 38080001 7c09512e 816b0000=20
71600001 408200f0 813d0000 7d7e5b78 <800b0008> 7f890000 409effc8 =
813d0004=20
---[ end trace 7536e18f69aeba2e ]---


From what I have seen this part of code has not been changed a lot since
latest kernel version.
The crash seems to be at=20

static inline int nf_inet_addr_cmp(const union nf_inet_addr *a1,
                                    const union nf_inet_addr *a2)
 {
         return a1->all[0] =3D=3D a2->all[0] &&
                a1->all[1] =3D=3D a2->all[1] &&
                a1->all[2] =3D=3D a2->all[2] &&
                a1->all[3] =3D=3D a2->all[3];
 }


Is it possible a race condition to exist somewhere in the code and not =
all
parts be protected with locks?

Thanks,
Tamis


------=_NextPart_000_0300_01D0F142.875CDD10
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIPnTCCAzYw
ggIeoAMCAQICEFKIki0gLsWYSyx9eBbYcr0wDQYJKoZIhvcNAQELBQAwNTELMAkGA1UEBhMCREUx
DjAMBgNVBAoMBVVuaWZ5MRYwFAYDVQQDDA1VbmlmeSBSb290IENBMB4XDTEzMDkyNTA3MzQzMFoX
DTI4MDkyNTA3NDQyNVowNTELMAkGA1UEBhMCREUxDjAMBgNVBAoMBVVuaWZ5MRYwFAYDVQQDDA1V
bmlmeSBSb290IENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAp7oHRPmtJ+/8I3iv
apenTzPKMh+diPfZPmp9SkuRTuW3NZivOarkd7vs2+gkhD8syKpPyLpKDRMG2zHgBjYxxdUhagYW
MNKej07xGs3kmPXKbt/FxL+xI+64aHLV35fCmOrOS7tLBGpDfAMJhAWMEI9xmQdDAYcxJOXlR4Hw
cosfPFvfDI7Tiwj4Kml547YRq1cKTpy8AtQgo1Rc41WakCknXeRcRtSlllGHydqd8RCNe49Ut+OI
zBtKSfoe/cYVuUrSh2cOCUFOh3EAxKmFi2lCEI5t3mtZV35MVGOIAbFF8On9udmA10uvM/RR51fg
o3oh9wdCOn0tFfMPLYOSGwIDAQABo0IwQDAOBgNVHQ8BAf8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB
/zAdBgNVHQ4EFgQUL/fEwyUdkMhFfPNnCnMzxVyab08wDQYJKoZIhvcNAQELBQADggEBAGaM56dC
Yx9O21zPZ/Qnw8jw7uIVxlAdOE+jlrs5MLvenLmrlG5StAIgpqaXVzp5i9m+duDXhR+NVy9FwnyA
xqah+NZd0sp5p/M+0MYPu2BynLBfrMBoW6TwtStkkoK8PfQr5U9u8KeVifyQJe2fswcDWg6odiUb
/bdEmqQmXc2aA9qM6WEcCOYWa7QNHKt+bLXqFiznNiEkhIyehiro213FOvPn9OgVd8OjZzlSbxCp
WbkGER4aD36mJSq7dU1/8qdfLn1nXwtlJkqP5Gj0DCjyNVRZTGKNvKRvHGDTOTRD/bbQOigqHDlf
SXemNB3a5En3X73EJd8raK2M5JZRQ7MwggW9MIIEpaADAgECAg4w9GNsY4mqiwAAAAAABDANBgkq
hkiG9w0BAQsFADA1MQswCQYDVQQGEwJERTEOMAwGA1UECgwFVW5pZnkxFjAUBgNVBAMMDVVuaWZ5
IFJvb3QgQ0EwHhcNMTMwOTI2MTQ0MDA0WhcNMjMwOTI2MTQ1MDA0WjA1MQswCQYDVQQGEwJERTEO
MAwGA1UECgwFVW5pZnkxFjAUBgNVBAMMDVVuaWZ5IFVzZXIgQ0EwggEiMA0GCSqGSIb3DQEBAQUA
A4IBDwAwggEKAoIBAQCPGIg7woGyfrEXR+ihrCDd3i0M2evThPreB9ap8fL+bBiANbWggXV5rR/w
DBo1rzMnTeaEEsmQQ8n00D+wl/Rwby8JZUtgS3y3284/H5kfgVnGL6FW7qnJLq/cQKgIQuCP+nGs
dt5gc9LriPuwDo1p22lQuduffmF21saaFYOu7cSLAwV+YKoERBL7M00r9I4Qm1twYUqPI6/T9OVw
V2nmerPobEwBUcBeXDxHzD7MGR+z0CRUuVvROcM28lakGuDW09YlBSNY81xrCj7Zf82uPoNdEb1T
MkEcjVQO8U/IfCKPnalP/2/frXrWK6JAgGWpxXAcWMgKXAghR8uqsySTAgMBAAGjggLJMIICxTAO
BgNVHQ8BAf8EBAMCAYYwHQYDVR0OBBYEFJhx96C5h8dG9AYMgSYzvV3eUAtmMBIGA1UdEwEB/wQI
MAYBAf8CAQAwHwYDVR0jBBgwFoAUL/fEwyUdkMhFfPNnCnMzxVyab08wggEbBgNVHR8EggESMIIB
DjCCAQqgggEGoIIBAoYqaHR0cDovL3BraS51bmlmeS5jb20vY3JsL3VuaWZ5LXJvb3QtY2EuY3Js
hoHTbGRhcDovL3BraS1kaXJlY3RvcnkudW5pZnkuY29tL0NOPVVuaWZ5JTIwUm9vdCUyMENBLENO
PXVuaWZ5LXBraSxDTj1DRFAsQ049UHVibGljJTIwS2V5JTIwU2VydmljZXMsQ049U2VydmljZXMs
Q049Q29uZmlndXJhdGlvbixEQz1nbG9iYWwtYWQsREM9bmV0P2NlcnRpZmljYXRlUmV2b2NhdGlv
bkxpc3Q/YmFzZT9vYmplY3RDbGFzcz1jUkxEaXN0cmlidXRpb25Qb2ludDCCAT4GCCsGAQUFBwEB
BIIBMDCCASwwNgYIKwYBBQUHMAKGKmh0dHA6Ly9wa2kudW5pZnkuY29tL2NydC91bmlmeS1yb290
LWNhLmNydDCByQYIKwYBBQUHMAKGgbxsZGFwOi8vcGtpLWRpcmVjdG9yeS51bmlmeS5jb20vQ049
VW5pZnklMjBSb290JTIwQ0EsQ049QUlBLENOPVB1YmxpYyUyMEtleSUyMFNlcnZpY2VzLENOPVNl
cnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9Z2xvYmFsLWFkLERDPW5ldD9jQUNlcnRpZmljYXRl
P2Jhc2U/b2JqZWN0Q2xhc3M9Y2VydGlmaWNhdGlvbkF1dGhvcml0eTAmBggrBgEFBQcwAYYaaHR0
cDovL29jc3AudW5pZnkuY29tL29yMDEwDQYJKoZIhvcNAQELBQADggEBAJ/DjgX7xxKEhsGGpQ0J
xImw4V8hTITbBq8FqllxWhvkMjyI+7524g2xXBNLeHAfF+1W6BFgVeUuWjYqQzKl2vFkjLXJy4OX
JQMigXk24N+s6PtF235yqMCiaOg4q/KIT4RjdWJKgNpWuf3r5GMUKCmRQiAOQggHKCbSfyky5f+J
IHNHzby2x+AlRjipyEoy8Y4S96kdG90PQ/8fkplmjoigN03cSKglEvDVdf+EoBjVEgzhRTb+YIhh
GCRuzlTl2BFQNMHoNDsIU4eoMa0eLIcsOZOEoTl9YLbdHrOkEiiF8FkOmsVRoQTmVeGTA6Cx0gd0
ZB4vGvsaMJFxezMZTf8wggaeMIIFhqADAgECAgp+i/nRAAAAABCvMA0GCSqGSIb3DQEBCwUAMDUx
CzAJBgNVBAYTAkRFMQ4wDAYDVQQKDAVVbmlmeTEWMBQGA1UEAwwNVW5pZnkgVXNlciBDQTAeFw0x
MzEwMjEwNzM1MDRaFw0xODEwMjAwNzM1MDRaMFgxLDAqBgkqhkiG9w0BCQEWHXBhbmFnaW90aXMu
dGFtdGFtaXNAdW5pZnkuY29tMSgwJgYDVQQDDB9UYW10YW1pcyBQYW5hZ2lvdGlzIFNFTkdSMDcw
MTQwMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAyNe0JD2i3s+szC33fTp76iZIUvbc
GgGxbPdqG5/nQ4GCks2/lbRv9jslpM4sBctP1z+ggppIN/+elifcW1FBnLUaYYWZLMqmnJIzw8In
VoqTP+0XEuGV/sx8Ekr5BJJigF6L2FN38b4OZT9Y5xBQHPB60QeUwSSnckgh9rQGx2ArhrgyYID7
NKBSZjApGx1RNDckKEx2pe1Rv3WpmLz+T5vphZoTEJ2Go81u5TxpTa4+4A9yqEjMENLZ9KAjxjqd
AK8jH8jD+v70xG2LKL8QV0wmgJ5QkvBZvNzQLGr7MezYZ7RibjD0di3SeTxEQrHayrrWactsSeMj
T60og0h6hwIDAQABo4IDizCCA4cwPQYJKwYBBAGCNxUHBDAwLgYmKwYBBAGCNxUIgt6SVoGmryaG
iZkJpvV0gvKhRYEphvjFSoLYuW8CAWQCAQ4wNQYDVR0lBC4wLAYKKwYBBAGCNxQCAgYIKwYBBQUH
AwQGCisGAQQBgjcKAwQGCCsGAQUFBwMCMA4GA1UdDwEB/wQEAwIEsDAMBgNVHRMBAf8EAjAAMB0G
A1UdDgQWBBRFUxQGRVbllZJknipjnI3bA7gs5TAfBgNVHSMEGDAWgBSYcfeguYfHRvQGDIEmM71d
3lALZjCCARsGA1UdHwSCARIwggEOMIIBCqCCAQagggEChipodHRwOi8vcGtpLnVuaWZ5LmNvbS9j
cmwvdW5pZnktdXNlci1jYS5jcmyGgdNsZGFwOi8vcGtpLWRpcmVjdG9yeS51bmlmeS5jb20vQ049
VW5pZnklMjBVc2VyJTIwQ0EsQ049dW5pZnktcGtpLENOPUNEUCxDTj1QdWJsaWMlMjBLZXklMjBT
ZXJ2aWNlcyxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0aW9uLERDPWdsb2JhbC1hZCxEQz1uZXQ/
Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENsYXNzPWNSTERpc3RyaWJ1dGlv
blBvaW50MIIBPgYIKwYBBQUHAQEEggEwMIIBLDA2BggrBgEFBQcwAoYqaHR0cDovL3BraS51bmlm
eS5jb20vY3J0L3VuaWZ5LXVzZXItY2EuY3J0MIHJBggrBgEFBQcwAoaBvGxkYXA6Ly9wa2ktZGly
ZWN0b3J5LnVuaWZ5LmNvbS9DTj1VbmlmeSUyMFVzZXIlMjBDQSxDTj1BSUEsQ049UHVibGljJTIw
S2V5JTIwU2VydmljZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz1nbG9iYWwtYWQs
REM9bmV0P2NBQ2VydGlmaWNhdGU/YmFzZT9vYmplY3RDbGFzcz1jZXJ0aWZpY2F0aW9uQXV0aG9y
aXR5MCYGCCsGAQUFBzABhhpodHRwOi8vb2NzcC51bmlmeS5jb20vb3IwMTBQBgNVHREESTBHoCYG
CisGAQQBgjcUAgOgGAwWR1JNUzgyNjVAR0xPQkFMLUFELk5FVIEdcGFuYWdpb3Rpcy50YW10YW1p
c0B1bmlmeS5jb20wDQYJKoZIhvcNAQELBQADggEBADhumYGMCtI/WyN7RrIqEPnn6EPv5+HhamLW
t2pgQIDacVXWM3febceYb5Ytt0u/DcZvVG9X9Qqj1xmiplUE1spHv4kpO4YEzlXk+UmB3p8wFUzC
ZHRRWap6Y5UeZrzM9W8E/x2gAH2CHF5Nj9X2EQg+JUZD7ro0G7XXTG7ciV+gxIAjrN4E2CsxLy8d
LnXGTv7nk1OCmi/4NmnOdGJzjOEGh6XhNofosu17QGr541YsJHpw1x1VFWigImMxwfw9GC7X85dY
HGtRTo2BIfr1eayJqgNSm7DWp5u5oprq1tpNXYaATsRB7o8ORVb/aIYp8Xc9v2GxNAWDtaANR+Ew
I2MxggMvMIIDKwIBATBDMDUxCzAJBgNVBAYTAkRFMQ4wDAYDVQQKDAVVbmlmeTEWMBQGA1UEAwwN
VW5pZnkgVXNlciBDQQIKfov50QAAAAAQrzAJBgUrDgMCGgUAoIIBwTAYBgkqhkiG9w0BCQMxCwYJ
KoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xNTA5MTcwOTE1MjNaMCMGCSqGSIb3DQEJBDEWBBTk
8vvg+ZricoTQO1c2WM1OH1eUwzBSBgkrBgEEAYI3EAQxRTBDMDUxCzAJBgNVBAYTAkRFMQ4wDAYD
VQQKDAVVbmlmeTEWMBQGA1UEAwwNVW5pZnkgVXNlciBDQQIKfov50QAAAAAQrzBUBgsqhkiG9w0B
CRACCzFFoEMwNTELMAkGA1UEBhMCREUxDjAMBgNVBAoMBVVuaWZ5MRYwFAYDVQQDDA1VbmlmeSBV
c2VyIENBAgp+i/nRAAAAABCvMIG3BgkqhkiG9w0BCQ8xgakwgaYwCwYJYIZIAWUDBAEqMAsGCWCG
SAFlAwQBFjAKBggqhkiG9w0DBzALBglghkgBZQMEAQIwDgYIKoZIhvcNAwICAgCAMAcGBSsOAwIH
MA0GCCqGSIb3DQMCAgFAMA0GCCqGSIb3DQMCAgEoMAcGBSsOAwIaMAsGCWCGSAFlAwQCAzALBglg
hkgBZQMEAgIwCwYJYIZIAWUDBAIBMAoGCCqGSIb3DQIFMA0GCSqGSIb3DQEBAQUABIIBACusFBPR
ueYGmIoK3cPgI3e0YeDpzUPk9ulYQMOG1+imATZzSie4c29StZAWwv/AZijpxFnfjqhzOo2R+wfb
++lhNuJeMPstatwVOmwtw83lKL07d4cyiF873mMxRynUp4WwNmgmveFZpo40klCc9+jRze1ggWyF
GXuWaYGcDL0TlpEuDQS2CtzXHfiG6dQb3yrRwoRDhSmcrujjlabMGJeZLOazOuwcQ4AAw5cGJJEo
pIfJbffEqzyRP6r0XmaySlD3ullF5M8Ywua5MXP2HQBft7as/AN/euT+otxtKFAJI8otYm2HDXVP
u5qlysSVqVoQBxDzQK2FIUtbgPHrAwAAAAAAAAA=

------=_NextPart_000_0300_01D0F142.875CDD10--
