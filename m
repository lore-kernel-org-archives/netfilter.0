From: Yoann Juet <yoann.juet@univ-nantes.fr>
Subject: ipset causing a kernel crash
Date: Mon, 09 Sep 2013 10:00:08 +0200
Message-ID: <522D8008.4080609@univ-nantes.fr>
Reply-To: yoann.juet@univ-nantes.fr
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha1; boundary="------------ms080104060801030505050306"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is a cryptographically signed message in MIME format.

--------------ms080104060801030505050306
Content-Type: multipart/mixed;
 boundary="------------090504030508040006080503"

This is a multi-part message in MIME format.
--------------090504030508040006080503
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi all,

We've experienced a recent kernel crash on a captive portal server=20
running debian/wheezy with a standard kernel 3.2.0-4. The crash seems to =

be related to ipset that we're using to check bitmaps {ip,mac}. It has=20
not been seen before on this production server.

Thanks for your help,
Regards,
--=20
Universit=E9 de Nantes - Direction des Syst=E8mes d'Information
IM jabber: yoann.juet@univ-nantes.fr
T=E9l: 02.53.48.49.26 - Fax: 02.53.48.49.09

--------------090504030508040006080503
Content-Type: text/plain; charset=UTF-8;
 name="bug.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="bug.txt"

Sep  8 21:04:01 p1 kernel: [1245305.746885] ------------[ cut here ]-----=
-------
Sep  8 21:04:01 p1 kernel: [1245305.747344] kernel BUG at /build/linux-s5=
x2oE/linux-3.2.46/net/netfilter/ipset/ip_set_core.c:317!
Sep  8 21:04:01 p1 kernel: [1245305.748212] invalid opcode: 0000 [#1] SMP=
=20
Sep  8 21:04:01 p1 kernel: [1245305.748623] CPU 2=20
Sep  8 21:04:01 p1 kernel: [1245305.748697] Modules linked in: ip_vs crc3=
2c libcrc32c ipt_LOG xt_set ip_set_bitmap_ipmac ip_set nfnetlink xt_TPROX=
Y nf_tproxy_core xt_socket ipt_REDIRECT xt_mark xt_tcpudp xt_limit xt_sta=
te ip6table_filter ip6_tables iptable_mangle iptable_filter nf_nat_ftp ip=
table_nat nf_nat nf_conntrack_irc nf_conntrack_ftp nf_conntrack_ipv4 nf_d=
efrag_ipv4 ip_tables x_tables ext2 mbcache nf_conntrack_ipv6 nf_defrag_ip=
v6 nf_conntrack psmouse snd_pcm snd_page_alloc evdev i2c_piix4 serio_raw =
virtio_balloon i2c_core processor snd_timer snd soundcore pcspkr thermal_=
sys button xfs dm_mod ata_generic virtio_blk virtio_net floppy ata_piix l=
ibata uhci_hcd ehci_hcd scsi_mod virtio_pci virtio_ring virtio usbcore us=
b_common [last unloaded: scsi_wait_scan]
Sep  8 21:04:01 p1 kernel: [1245305.749268]=20
Sep  8 21:04:01 p1 kernel: [1245305.749268] Pid: 29834, comm: ipset Not t=
ainted 3.2.0-4-amd64 #1 Debian 3.2.46-1 Bochs Bochs
Sep  8 21:04:01 p1 kernel: [1245305.749268] RIP: 0010:[<ffffffffa02a1087>=
]  [<ffffffffa02a1087>] ip_set_put_byindex+0x30/0x46 [ip_set]
Sep  8 21:04:01 p1 kernel: [1245305.749268] RSP: 0018:ffff8800d799fa38  E=
FLAGS: 00010246
Sep  8 21:04:01 p1 kernel: [1245305.749268] RAX: ffff8801188627c0 RBX: 00=
00000000000000 RCX: 0000000000000002
Sep  8 21:04:01 p1 kernel: [1245305.749268] RDX: 0000000000000000 RSI: 00=
00000000000016 RDI: ffffffffa02a5034
Sep  8 21:04:01 p1 kernel: [1245305.749268] RBP: ffff8801152f6c00 R08: 00=
00000000000004 R09: 0000000000000002
Sep  8 21:04:01 p1 kernel: [1245305.749268] R10: 0000000000000246 R11: 00=
00000000000246 R12: ffff8800bfc0f580
Sep  8 21:04:01 p1 kernel: [1245305.749268] R13: 0000000000000e80 R14: ff=
ff8801149956c0 R15: ffff8800d799fae0
Sep  8 21:04:01 p1 kernel: [1245305.749268] FS:  00007f437895b700(0000) G=
S:ffff88011fd00000(0000) knlGS:0000000000000000
Sep  8 21:04:01 p1 kernel: [1245305.749268] CS:  0010 DS: 0000 ES: 0000 C=
R0: 0000000080050033
Sep  8 21:04:01 p1 kernel: [1245305.749268] CR2: 00007f4378536cb0 CR3: 00=
000000cd4aa000 CR4: 00000000000006e0
Sep  8 21:04:01 p1 kernel: [1245305.749268] DR0: 0000000000000000 DR1: 00=
00000000000000 DR2: 0000000000000000
Sep  8 21:04:01 p1 kernel: [1245305.749268] DR3: 0000000000000000 DR6: 00=
000000ffff0ff0 DR7: 0000000000000400
Sep  8 21:04:01 p1 kernel: [1245305.749268] Process ipset (pid: 29834, th=
readinfo ffff8800d799e000, task ffff880117ccea70)
Sep  8 21:04:01 p1 kernel: [1245305.749268] Stack:
Sep  8 21:04:01 p1 kernel: [1245305.749268]  ffff8801149956c0 ffffffffa02=
a10ae 0000000000000002 ffffffff812ad5bd
Sep  8 21:04:01 p1 kernel: [1245305.749268]  ffffffff810364e8 ffffffa6813=
4d81c 0000000000000246 ffff8801152f6c00
Sep  8 21:04:01 p1 kernel: [1245305.749268]  ffff8801179da400 ffff8800c0e=
20e00 ffffffffa02a10b2 ffffffff812adf7d
Sep  8 21:04:01 p1 kernel: [1245305.749268] Call Trace:
Sep  8 21:04:01 p1 kernel: [1245305.749268]  [<ffffffffa02a10ae>] ? ip_se=
t_dump_done+0x11/0x15 [ip_set]
Sep  8 21:04:01 p1 kernel: [1245305.749268]  [<ffffffff812ad5bd>] ? netli=
nk_dump+0x16f/0x1ce
Sep  8 21:04:01 p1 kernel: [1245305.749268]  [<ffffffff810364e8>] ? shoul=
d_resched+0x5/0x23
Sep  8 21:04:01 p1 kernel: [1245305.749268]  [<ffffffffa02a10b2>] ? ip_se=
t_dump_done+0x15/0x15 [ip_set]
Sep  8 21:04:01 p1 kernel: [1245305.749268]  [<ffffffff812adf7d>] ? netli=
nk_dump_start+0xf1/0x118
Sep  8 21:04:01 p1 kernel: [1245305.749268]  [<ffffffffa02a109d>] ? ip_se=
t_put_byindex+0x46/0x46 [ip_set]
Sep  8 21:04:01 p1 kernel: [1245305.749268]  [<ffffffffa02972ac>] ? nfnet=
link_rcv_msg+0x1b6/0x1fe [nfnetlink]
Sep  8 21:04:01 p1 kernel: [1245305.749268]  [<ffffffffa029712e>] ? nfnet=
link_rcv_msg+0x38/0x1fe [nfnetlink]
Sep  8 21:04:01 p1 kernel: [1245305.749268]  [<ffffffffa02970f6>] ? nfnl_=
lock+0xc/0xc [nfnetlink]
Sep  8 21:04:01 p1 kernel: [1245305.749268]  [<ffffffff812af559>] ? netli=
nk_rcv_skb+0x36/0x7a
Sep  8 21:04:01 p1 kernel: [1245305.749268]  [<ffffffff812af090>] ? netli=
nk_unicast+0xe6/0x14e
Sep  8 21:04:01 p1 kernel: [1245305.749268]  [<ffffffff812af36c>] ? netli=
nk_sendmsg+0x274/0x2ac
Sep  8 21:04:01 p1 kernel: [1245305.749268]  [<ffffffff810364e8>] ? shoul=
d_resched+0x5/0x23
Sep  8 21:04:01 p1 kernel: [1245305.749268]  [<ffffffff8127e831>] ? sock_=
sendmsg+0xc1/0xde
Sep  8 21:04:01 p1 kernel: [1245305.749268]  [<ffffffff810f267c>] ? mem_c=
group_update_page_stat+0x17/0xd4
Sep  8 21:04:01 p1 kernel: [1245305.749268]  [<ffffffff810d0c6b>] ? handl=
e_pte_fault+0x298/0x79f
Sep  8 21:04:01 p1 kernel: [1245305.749268]  [<ffffffff810364e8>] ? shoul=
d_resched+0x5/0x23
Sep  8 21:04:01 p1 kernel: [1245305.749268]  [<ffffffff8134d81c>] ? _cond=
_resched+0x7/0x1c
Sep  8 21:04:01 p1 kernel: [1245305.749268]  [<ffffffff8127d27f>] ? copy_=
from_user+0x18/0x30
Sep  8 21:04:01 p1 kernel: [1245305.749268]  [<ffffffff812800c7>] ? sys_s=
endto+0xf7/0x137
Sep  8 21:04:01 p1 kernel: [1245305.749268]  [<ffffffff810fb5b2>] ? fget_=
light+0x2e/0x7b
Sep  8 21:04:01 p1 kernel: [1245305.749268]  [<ffffffff81353b52>] ? syste=
m_call_fastpath+0x16/0x1b
Sep  8 21:04:01 p1 kernel: [1245305.749268] Code: 00 00 53 0f b7 df 48 83=
 3c d8 00 74 32 48 c7 c7 34 50 2a a0 e8 f0 db 0a e1 48 8b 05 84 42 00 00 =
48 8b 04 d8 8b 50 24 85 d2 75 02 <0f> 0b ff ca 48 c7 c7 34 50 2a a0 89 50=
 24 5b e9 a2 db 0a e1 5b=20
Sep  8 21:04:01 p1 kernel: [1245305.749268] RIP  [<ffffffffa02a1087>] ip_=
set_put_byindex+0x30/0x46 [ip_set]
Sep  8 21:04:01 p1 kernel: [1245305.749268]  RSP <ffff8800d799fa38>
Sep  8 21:04:01 p1 kernel: [1245305.783960] ---[ end trace cf0b8013a04e30=
16 ]---
Sep  8 21:04:01 p1 kernel: [1245305.784351] Kernel panic - not syncing: F=
atal exception in interrupt
Sep  8 21:04:01 p1 kernel: [1245305.784739] Pid: 29834, comm: ipset Taint=
ed: G      D      3.2.0-4-amd64 #1 Debian 3.2.46-1
Sep  8 21:04:01 p1 kernel: [1245305.785471] Call Trace:
Sep  8 21:04:01 p1 kernel: [1245305.785836]  [<ffffffff813481ed>] ? panic=
+0x95/0x1a2
Sep  8 21:04:01 p1 kernel: [1245305.786190]  [<ffffffff8134eb77>] ? _raw_=
spin_unlock_irqrestore+0xe/0xf
Sep  8 21:04:01 p1 kernel: [1245305.786732]  [<ffffffff8134f986>] ? oops_=
end+0xa9/0xb6
Sep  8 21:04:01 p1 kernel: [1245305.787252]  [<ffffffff8100e961>] ? do_in=
valid_op+0x87/0x91
Sep  8 21:04:01 p1 kernel: [1245305.787673]  [<ffffffffa02a1087>] ? ip_se=
t_put_byindex+0x30/0x46 [ip_set]
Sep  8 21:04:01 p1 kernel: [1245305.788167]  [<ffffffff811bf17c>] ? __nla=
_put+0xd/0x20
Sep  8 21:04:01 p1 kernel: [1245305.788604]  [<ffffffff811bf1bf>] ? nla_p=
ut+0x30/0x34
Sep  8 21:04:01 p1 kernel: [1245305.789044]  [<ffffffffa02ad7b9>] ? bitma=
p_ipmac_tlist+0x1ed/0x216 [ip_set_bitmap_ipmac]
Sep  8 21:04:01 p1 kernel: [1245305.789725]  [<ffffffff81355b2b>] ? inval=
id_op+0x1b/0x20
Sep  8 21:04:01 p1 kernel: [1245305.790105]  [<ffffffffa02a1087>] ? ip_se=
t_put_byindex+0x30/0x46 [ip_set]
Sep  8 21:04:01 p1 kernel: [1245305.790597]  [<ffffffffa02a1075>] ? ip_se=
t_put_byindex+0x1e/0x46 [ip_set]
Sep  8 21:04:01 p1 kernel: [1245305.791107]  [<ffffffffa02a10ae>] ? ip_se=
t_dump_done+0x11/0x15 [ip_set]
Sep  8 21:04:01 p1 kernel: [1245305.791760]  [<ffffffff812ad5bd>] ? netli=
nk_dump+0x16f/0x1ce
Sep  8 21:04:01 p1 kernel: [1245305.792559]  [<ffffffff810364e8>] ? shoul=
d_resched+0x5/0x23
Sep  8 21:04:01 p1 kernel: [1245305.793085]  [<ffffffffa02a10b2>] ? ip_se=
t_dump_done+0x15/0x15 [ip_set]
Sep  8 21:04:01 p1 kernel: [1245305.793480]  [<ffffffff812adf7d>] ? netli=
nk_dump_start+0xf1/0x118
Sep  8 21:04:01 p1 kernel: [1245305.793885]  [<ffffffffa02a109d>] ? ip_se=
t_put_byindex+0x46/0x46 [ip_set]
Sep  8 21:04:01 p1 kernel: [1245305.794299]  [<ffffffffa02972ac>] ? nfnet=
link_rcv_msg+0x1b6/0x1fe [nfnetlink]
Sep  8 21:04:01 p1 kernel: [1245305.794972]  [<ffffffffa029712e>] ? nfnet=
link_rcv_msg+0x38/0x1fe [nfnetlink]
Sep  8 21:04:01 p1 kernel: [1245305.795571]  [<ffffffffa02970f6>] ? nfnl_=
lock+0xc/0xc [nfnetlink]
Sep  8 21:04:01 p1 kernel: [1245305.796036]  [<ffffffff812af559>] ? netli=
nk_rcv_skb+0x36/0x7a
Sep  8 21:04:01 p1 kernel: [1245305.796484]  [<ffffffff812af090>] ? netli=
nk_unicast+0xe6/0x14e
Sep  8 21:04:01 p1 kernel: [1245305.796899]  [<ffffffff812af36c>] ? netli=
nk_sendmsg+0x274/0x2ac
Sep  8 21:04:01 p1 kernel: [1245305.797279]  [<ffffffff810364e8>] ? shoul=
d_resched+0x5/0x23
Sep  8 21:04:01 p1 kernel: [1245305.797738]  [<ffffffff8127e831>] ? sock_=
sendmsg+0xc1/0xde
Sep  8 21:04:01 p1 kernel: [1245305.798113]  [<ffffffff810f267c>] ? mem_c=
group_update_page_stat+0x17/0xd4
Sep  8 21:04:01 p1 kernel: [1245305.798503]  [<ffffffff810d0c6b>] ? handl=
e_pte_fault+0x298/0x79f
Sep  8 21:04:01 p1 kernel: [1245305.798943]  [<ffffffff810364e8>] ? shoul=
d_resched+0x5/0x23
Sep  8 21:04:01 p1 kernel: [1245305.799331]  [<ffffffff8134d81c>] ? _cond=
_resched+0x7/0x1c
Sep  8 21:04:01 p1 kernel: [1245305.799734]  [<ffffffff8127d27f>] ? copy_=
from_user+0x18/0x30
Sep  8 21:04:01 p1 kernel: [1245305.800149]  [<ffffffff812800c7>] ? sys_s=
endto+0xf7/0x137

--------------090504030508040006080503
Content-Type: text/x-vcard; charset=utf-8;
 name="yoann_juet.vcf"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="yoann_juet.vcf"

begin:vcard
fn:Yoann Juet
n:Juet;Yoann
org;quoted-printable;quoted-printable:Direction des Syst=3DC3=3DA8mes d'I=
nformation;P=3DC3=3DB4le R=3DC3=3DA9seau
adr;quoted-printable:BP 92208;;2 rue de la Houssini=3DC3=3DA8re;Nantes Ce=
dex 3;;44322;France
email;internet:yoann.juet@univ-nantes.fr
tel;work:02.53.48.49.26
tel;fax:02.53.48.49.09
tel;cell:06.73.15.42.19
version:2.1
end:vcard


--------------090504030508040006080503--

--------------ms080104060801030505050306
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJcDCC
BKUwggONoAMCAQICEQCaw9r4AWwhPTK3X2MyL6H8MA0GCSqGSIb3DQEBBQUAMDsxCzAJBgNV
BAYTAk5MMQ8wDQYDVQQKEwZURVJFTkExGzAZBgNVBAMTElRFUkVOQSBQZXJzb25hbCBDQTAe
Fw0xMTA4MTcwMDAwMDBaFw0xNDA4MTYyMzU5NTlaMGcxCzAJBgNVBAYTAkZSMR0wGwYDVQQK
ExRVTklWRVJTSVRFIERFIE5BTlRFUzETMBEGA1UEAxMKWW9hbm4gSlVFVDEkMCIGCSqGSIb3
DQEJAhYVanVldC15QHVuaXYtbmFudGVzLmZyMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB
CgKCAQEAzT4cyMjT4IaRAql635iNoxjb9ticpoS8Qauq9qGkV2HzDOqjI5SIc0nlU1EOWnbO
05cewhUbOcM1YunHBSahw5cltsC3Uu4D2XAVQ5vD9VmS9kV2eBn3T9vSB1Yz7r7xSPOhHN50
8qspRwgRExu1tFANqG7TMJbFtN5iG22fiQkNzlVLDV3vgB6B9eJaAayfVlZSq+QUMv2dp6AI
8g7Z1tInb7EWVMbB17d7rSfGXJnQHN9wlRduAg2r+PfHcH2Z6Bxmxl66GABxH9keZxdnfo6G
ph0/l0FFj7VwitXEU7V1kTuq7+vZc5qAT/mcSPO471+KzfU14AgEc8qvALV6iQIDAQABo4IB
djCCAXIwHwYDVR0jBBgwFoAUY01DWhlIP8RGwQK6v+4O5YK3ZqYwHQYDVR0OBBYEFKPfL4a9
soFXobME5dHUc30NI4iCMA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAAMB0GA1UdJQQW
MBQGCCsGAQUFBwMEBggrBgEFBQcDAjAYBgNVHSAEETAPMA0GCysGAQQBsjEBAgIdMD8GA1Ud
HwQ4MDYwNKAyoDCGLmh0dHA6Ly9jcmwudGNzLnRlcmVuYS5vcmcvVEVSRU5BUGVyc29uYWxD
QS5jcmwwcgYIKwYBBQUHAQEEZjBkMDoGCCsGAQUFBzAChi5odHRwOi8vY3J0LnRjcy50ZXJl
bmEub3JnL1RFUkVOQVBlcnNvbmFsQ0EuY3J0MCYGCCsGAQUFBzABhhpodHRwOi8vb2NzcC50
Y3MudGVyZW5hLm9yZzAkBgNVHREEHTAbgRlZb2Fubi5KdWV0QHVuaXYtbmFudGVzLmZyMA0G
CSqGSIb3DQEBBQUAA4IBAQCsH20G5ntaV5rBAKu+TjhdseCOkRFhExE6W+ImhXJb1aKFLtnt
epvS6pTenXbBp+8OTjOXDJ9JpmA6sbGpy8FYIThiDiRLVMf1kVgU4ECDo2RE6AHtnRJ645Dw
+fvXbFef9u+0aGehKREb6OVdl/6x9DFQvVm/bj9hQtXPusCXYUe1b/ZCbUKFQSfmXwFMLmFb
U64YhP3YRczYaznadT8Cm0INpaYZJatUan74iufwiC71toLGOEnupbQGOLSHalBdAy+u9WGl
5Nm+oE+R+m8tqbRFUn9GSiswSi7RQXxk4O/qOev3/aF+cG4W4D5DCVBsKqTpFcu1fgzdzWQE
IxRTMIIEwzCCA6ugAwIBAgIQc/5X+t+4xQiBe2a5a/At7zANBgkqhkiG9w0BAQUFADCBrjEL
MAkGA1UEBhMCVVMxCzAJBgNVBAgTAlVUMRcwFQYDVQQHEw5TYWx0IExha2UgQ2l0eTEeMBwG
A1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMSEwHwYDVQQLExhodHRwOi8vd3d3LnVzZXJ0
cnVzdC5jb20xNjA0BgNVBAMTLVVUTi1VU0VSRmlyc3QtQ2xpZW50IEF1dGhlbnRpY2F0aW9u
IGFuZCBFbWFpbDAeFw0wOTA1MTgwMDAwMDBaFw0yODEyMzEyMzU5NTlaMDsxCzAJBgNVBAYT
Ak5MMQ8wDQYDVQQKEwZURVJFTkExGzAZBgNVBAMTElRFUkVOQSBQZXJzb25hbCBDQTCCASIw
DQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMgV2fUzaiOhkA3PuwVEw6sfSjWFGiGFoE/4
8EDiSkOb/luxsL+0V9x1gEFLZBr2209vj9AlRTX56stK+vva0+1FiBGUNuTMqA3vxT037RZ7
48KVnlgzfyL7+P/s5r7brgplJSKH2m+Ei0boQIYoP79WCOJK6YOi6SL7Lfq2KB+RwcNx+1PA
K06kDKFunVXt7OEkhzoI4g0c5MRN0Msn+oRk5tGXnVYkW5O7KS5D4kFqPeJKZfyaX1qGh7yH
x3mAlplRxpAPZJGZfRDdrCwDKuF4ZP7OPU70K1ARS9FY1JsD8H/1O1OwU0P7xS/EBCkaOqzX
VenRDpXROzF/eE+uKS0CAwEAAaOCAU0wggFJMB8GA1UdIwQYMBaAFImCZ33EnSZwAEu0UEh8
3j2uBG59MB0GA1UdDgQWBBRjTUNaGUg/xEbBArq/7g7lgrdmpjAOBgNVHQ8BAf8EBAMCAQYw
EgYDVR0TAQH/BAgwBgEB/wIBADAYBgNVHSAEETAPMA0GCysGAQQBsjEBAgIdMFgGA1UdHwRR
ME8wTaBLoEmGR2h0dHA6Ly9jcmwudXNlcnRydXN0LmNvbS9VVE4tVVNFUkZpcnN0LUNsaWVu
dEF1dGhlbnRpY2F0aW9uYW5kRW1haWwuY3JsMG8GCCsGAQUFBwEBBGMwYTA4BggrBgEFBQcw
AoYsaHR0cDovL2NydC51c2VydHJ1c3QuY29tL1VUTkFBQUNsaWVudF9DQS5jcnQwJQYIKwYB
BQUHMAGGGWh0dHA6Ly9vY3NwLnVzZXJ0cnVzdC5jb20wDQYJKoZIhvcNAQEFBQADggEBAAYr
qVMvE9xcORbMhp9eTHty++yNVYpemgr/U0x29AY9UM9X8KLPr5mMqv6gGXY+mQMy+nWDOIq7
a5qlDBOy1Bt25pQuZ5hZ45FsApCanMhgS1WryohajSvlaZUDB9HUDvwkIi5ZsWOkX+3ZI3Lk
nM46XGwfT6kAyR3++n9FLbYuhN0PJ6BZGE7VdiVF9JkmedtvnyP3Q7srDwSjgSYst3s1+T13
X0Ah5n8dpZZavdDLFjpsu2GLiv0EOUQKyyzhy84uEJga2+CT7UlkZAggn7ejUPCi3cq0xnwM
PedeFdwnhuQ6O1JaF6upBlMrnQlzZBwBw/0w0ocDb+QVA3o5X2gxggMKMIIDBgIBATBQMDsx
CzAJBgNVBAYTAk5MMQ8wDQYDVQQKEwZURVJFTkExGzAZBgNVBAMTElRFUkVOQSBQZXJzb25h
bCBDQQIRAJrD2vgBbCE9MrdfYzIvofwwCQYFKw4DAhoFAKCCAY8wGAYJKoZIhvcNAQkDMQsG
CSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTMwOTA5MDgwMDA4WjAjBgkqhkiG9w0BCQQx
FgQUU0scrZvyAbeRUBYY4MA37TmQBC4wXwYJKwYBBAGCNxAEMVIwUDA7MQswCQYDVQQGEwJO
TDEPMA0GA1UEChMGVEVSRU5BMRswGQYDVQQDExJURVJFTkEgUGVyc29uYWwgQ0ECEQCaw9r4
AWwhPTK3X2MyL6H8MGEGCyqGSIb3DQEJEAILMVKgUDA7MQswCQYDVQQGEwJOTDEPMA0GA1UE
ChMGVEVSRU5BMRswGQYDVQQDExJURVJFTkEgUGVyc29uYWwgQ0ECEQCaw9r4AWwhPTK3X2My
L6H8MGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG
9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcN
AwICASgwDQYJKoZIhvcNAQEBBQAEggEAyDMx6hhkyDtjFTLQRrChi9S0NPeY4mQy9cVXMqG8
MAy74FIIay6sO6w7uQYksLuSI2udGAs0X9tY7onNWjkmkcAhUMfoLfShxv3nF5nvZNzOHhjC
I+E1i0DdB76F8ACGykjWUvlJUtNubGVXyHBmUfXKEDATaNSQoXPVje96s69VAC0vJ7hO5Gxp
ZV33vQQN5NTvzlk1P1AE/YGuIaNc8xZMsmpuIx4mAheOMbqm1UOMgAfjxaGofCZxGdd9XwcA
PxhVhpT5SrCWMrXMhJusdjlFcu0Ng+WWHcDEBCJpRjvU+TDeuqPW+u/gBFFG6KrGbbH+4h5N
cbcMwDo/Djn21QAAAAAAAA==
--------------ms080104060801030505050306--
