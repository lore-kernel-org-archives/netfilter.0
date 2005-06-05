From: DoM <dom@netsons.it>
Subject: patch-o-matic: netlink and nlgroup
Date: Sun, 05 Jun 2005 18:36:11 +0200
Message-ID: <42A329FB.9010503@netsons.it>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms030701010004060209060708"
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

This is a cryptographically signed message in MIME format.

--------------ms030701010004060209060708
Content-Type: multipart/mixed; boundary="------------080603030003070707060506"

This is a multi-part message in MIME format.
--------------080603030003070707060506
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,
i installed patch-o-matic to use some patches like psd or quota and i
would like to try netlink patch too.

I read that netlink patch adds a NETLINK target that sends dropped
packets to
userspace via a netlink socket.
I tried to install it but if i use -j NETLINK i receive this alert:
Couldn't load target
`NETLINK':/usr/local/lib/iptables/libipt_NETLINK.so: cause no such file ..
I didn't find this library anywhere on my box so looklike i didn't
install or compile it but everywhere i checked on kernel  all
*netlink* are loaded as modules.During patch-o-matic installation i
checked all netlink patches.I applied patches with ./runme extra.

lsmod show me these modules about netlink: ip_conntrack_netlink,
nfnetlink,netlink_dev but if i loaded a rule with -j NETLINK i obtain
error above.

Anyone has any ideas where i am wrong ?
Both iptables and patch-o-matic are snapshot of 2005/06/04.
I tried also snapshot of 2005/06/02 but it was the same.

Thx & Byez DoM
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (FreeBSD)

iD8DBQFCoyn7qmh6DMJCyAARApO+AJ9cxV96wqWgoHwqIbJ+d3Mkj86EfwCgmGzk
vSJZ6Iw5cZlgencA3QCpPiU=
=ledR
-----END PGP SIGNATURE-----


--------------080603030003070707060506--

--------------ms030701010004060209060708
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJ6TCC
Az8wggKooAMCAQICAQ0wDQYJKoZIhvcNAQEFBQAwgdExCzAJBgNVBAYTAlpBMRUwEwYDVQQI
EwxXZXN0ZXJuIENhcGUxEjAQBgNVBAcTCUNhcGUgVG93bjEaMBgGA1UEChMRVGhhd3RlIENv
bnN1bHRpbmcxKDAmBgNVBAsTH0NlcnRpZmljYXRpb24gU2VydmljZXMgRGl2aXNpb24xJDAi
BgNVBAMTG1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBDQTErMCkGCSqGSIb3DQEJARYccGVy
c29uYWwtZnJlZW1haWxAdGhhd3RlLmNvbTAeFw0wMzA3MTcwMDAwMDBaFw0xMzA3MTYyMzU5
NTlaMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBM
dGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQTCBnzAN
BgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAxKY8VXNV+065yplaHmjAdQRwnd/p/6Me7L3N9Vvy
Gna9fww6YfK/Uc4B1OVQCjDXAmNaLIkVcI7dyfArhVqqP3FWy688Cwfn8R+RNiQqE88r1fOC
dz0Dviv+uxg+B79AgAJk16emu59l0cUqVIUPSAR/p7bRPGEEQB5kGXJgt/sCAwEAAaOBlDCB
kTASBgNVHRMBAf8ECDAGAQH/AgEAMEMGA1UdHwQ8MDowOKA2oDSGMmh0dHA6Ly9jcmwudGhh
d3RlLmNvbS9UaGF3dGVQZXJzb25hbEZyZWVtYWlsQ0EuY3JsMAsGA1UdDwQEAwIBBjApBgNV
HREEIjAgpB4wHDEaMBgGA1UEAxMRUHJpdmF0ZUxhYmVsMi0xMzgwDQYJKoZIhvcNAQEFBQAD
gYEASIzRUIPqCy7MDaNmrGcPf6+svsIXoUOWlJ1/TCG4+DYfqi2fNi/A9BxQIJNwPP2t4WFi
w9k6GX6EsZkbAMUaC4J0niVQlGLH2ydxVyWN3amcOY6MIE9lX5Xa9/eH1sYITq726jTlEBpb
NU1341YheILcIRk13iSx0x1G/11fZU8wggNPMIICuKADAgECAgMOv6wwDQYJKoZIhvcNAQEE
BQAwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0
ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA1
MDUyMDEwMDMwMVoXDTA2MDUyMDEwMDMwMVowgaIxETAPBgNVBAQTCERlIE1vbnRlMREwDwYD
VQQqEwhEb21lbmljbzEaMBgGA1UEAxMRRG9tZW5pY28gRGUgTW9udGUxHTAbBgkqhkiG9w0B
CQEWDmRvbUBuZXRzb25zLml0MSIwIAYJKoZIhvcNAQkBFhNkLmRlbW9udGVAbWljc28uY29t
MRswGQYJKoZIhvcNAQkBFgxkb21AbWljc28uaXQwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw
ggEKAoIBAQC9gkrCClgV9zoYh8KogEPJQeIEHE0qcK4fgjIhlUX72YquzC7sB9bjEC+ee9jg
AEFVMUMNAKxzrP81DcsQnNnV5CHZLB6bDBi41Z9onOlYUPDnDnQbS99ItmIWYJnXIFYH5WQ/
AKgsWQAuBFN9eGhFhrx9mNKh7/qUwcGanxOxX6058Zz/2VdI9tO1mD7YA9jl7q82osYQRAQN
pUTYoYrS0vBmcYajec71YqLsiZRx6sP5E2FD4aemWcrVsOM+LlV1qQFdzoVw/5O4bMLjGly6
oPj24733t2XIxtk/xEX/RaHIw3KSDnvvxWD+ZP3ABJOTb/aNzcXBZv451GoXXgDDAgMBAAGj
TjBMMDwGA1UdEQQ1MDOBDmRvbUBuZXRzb25zLml0gRNkLmRlbW9udGVAbWljc28uY29tgQxk
b21AbWljc28uaXQwDAYDVR0TAQH/BAIwADANBgkqhkiG9w0BAQQFAAOBgQBE6P+fXGPdqj2Q
bXHfM6duxv82H046Ud+AcnLBKjKvQcRJauzAwiVW8HkUwL5aT+YBZ8KnI1XtD2TQCjW1XJz9
P+2fGW+4IZVTprZ7qLSnhd9lRo9MBKnjceGyNH1+HeKK1BcsX6E7O980q0VT9buO+JV2bf/K
ME7itIvK+qV7SjCCA08wggK4oAMCAQICAw6/rDANBgkqhkiG9w0BAQQFADBiMQswCQYDVQQG
EwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMj
VGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3VpbmcgQ0EwHhcNMDUwNTIwMTAwMzAxWhcN
MDYwNTIwMTAwMzAxWjCBojERMA8GA1UEBBMIRGUgTW9udGUxETAPBgNVBCoTCERvbWVuaWNv
MRowGAYDVQQDExFEb21lbmljbyBEZSBNb250ZTEdMBsGCSqGSIb3DQEJARYOZG9tQG5ldHNv
bnMuaXQxIjAgBgkqhkiG9w0BCQEWE2QuZGVtb250ZUBtaWNzby5jb20xGzAZBgkqhkiG9w0B
CQEWDGRvbUBtaWNzby5pdDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAL2CSsIK
WBX3OhiHwqiAQ8lB4gQcTSpwrh+CMiGVRfvZiq7MLuwH1uMQL5572OAAQVUxQw0ArHOs/zUN
yxCc2dXkIdksHpsMGLjVn2ic6VhQ8OcOdBtL30i2YhZgmdcgVgflZD8AqCxZAC4EU314aEWG
vH2Y0qHv+pTBwZqfE7FfrTnxnP/ZV0j207WYPtgD2OXurzaixhBEBA2lRNihitLS8GZxhqN5
zvViouyJlHHqw/kTYUPhp6ZZytWw4z4uVXWpAV3OhXD/k7hswuMaXLqg+Pbjvfe3ZcjG2T/E
Rf9FocjDcpIOe+/FYP5k/cAEk5Nv9o3NxcFm/jnUahdeAMMCAwEAAaNOMEwwPAYDVR0RBDUw
M4EOZG9tQG5ldHNvbnMuaXSBE2QuZGVtb250ZUBtaWNzby5jb22BDGRvbUBtaWNzby5pdDAM
BgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBBAUAA4GBAETo/59cY92qPZBtcd8zp27G/zYfTjpR
34BycsEqMq9BxElq7MDCJVbweRTAvlpP5gFnwqcjVe0PZNAKNbVcnP0/7Z8Zb7ghlVOmtnuo
tKeF32VGj0wEqeNx4bI0fX4d4orUFyxfoTs73zSrRVP1u474lXZt/8owTuK0i8r6pXtKMYID
OzCCAzcCAQEwaTBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcg
KFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3Vpbmcg
Q0ECAw6/rDAJBgUrDgMCGgUAoIIBpzAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqG
SIb3DQEJBTEPFw0wNTA2MDUxNjM2MTFaMCMGCSqGSIb3DQEJBDEWBBQSuUsVp9fHn7EECicl
yYksqWU8RzBSBgkqhkiG9w0BCQ8xRTBDMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDAN
BggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDB4BgkrBgEEAYI3EAQxazBp
MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQu
MSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIDDr+sMHoG
CyqGSIb3DQEJEAILMWugaTBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1
bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElz
c3VpbmcgQ0ECAw6/rDANBgkqhkiG9w0BAQEFAASCAQC8mlF4DPBruNDouazjpqTzj2QHvErR
2d3kSyyq6OqWh4F5wJxe48KNqrsaufx/ZkLvbiRyXO48Rj2onxLb7/shZChz+g5SScgImnaa
sQPW5jsBVOm0MB/G2PPqWjazwWemE0voXa+z6ukCAXuzEgMtokzigDi0R9WS8ZPCy+dRMofH
hlZffDMP0w/v4icEKkGzruMwKHLaKOoEsGO7MOWNFZ3BQENSeegD+cWXoMvkf0Q/vyOQnmk0
KTKkyCyyu1OoQvisa6ELFpKsY0ua8amrdHHvvGLBXFxNrQDj/LqJaMy7ZUt5kVLl15FBwC4W
da2+sK3oKHxyjYFu6UVPaUk2AAAAAAAA
--------------ms030701010004060209060708--

