From: Bernd Matthes <mainbug@celocom.de>
Subject: Re: Iptables 2.4.x kernels
Date: Sun, 13 Mar 2005 20:09:39 +0100
Message-ID: <42348FF3.1080208@celocom.de>
References: <200503111736.j2BHaiZ1016306@commserver.noach.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms050105080407020102090504"
In-Reply-To: <200503111736.j2BHaiZ1016306@commserver.noach.com>
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
To: John Hill <jhill@noach.com>
Cc: netfilter@lists.netfilter.org

This is a cryptographically signed message in MIME format.

--------------ms050105080407020102090504
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

John Hill wrote:
> Should I consider iptables to be dropping 2.4.x kernel support?
> 
> I have yet to compile iptables successfully since 2.4.26 and 1.2.11. I get a
> MUTEX error. This was addressed by a patch (sent to me in email) but a
> permanent fix has failed to make the kernel and the iptables code. The new
> 2.4.29 and 1.3.1 still does it. I also had segmentation errors with
> shorewall after applying the patch to 2.4.28 and 1.3.0. I gave up without
> looking into the problem further hoping the new kernel and iptables would
> fix it. It has not.
> 
> Thanks

Hi to all!

So I ran into the same problems
with the 2.4.29/1.3.1 combination.
But its not alone the 'MUTEX' error,
what is an error in the kernel sources
(The patch was published only in the netfilter-dev list).

But some other useful extensions such as "mport"
are no more patchable.
"mport" is going to obsolete. Why?

"nf-log" is not patchable,
the dependencies of tproxy
are not patchable:
"nat-reservations": unable to find ladd slot in src 
/usr/src/linux/net/ipv4/netfilter/Config.in
"nfnetlink-ctnetlink":
nfnetlink-ctnetlink-0.13 has dependency on ctstat, but ctstat is not 
known cannot apply (3 rejects out of 52 hunks)
the "tproxy" itself:
unable to find ladd slot in src /usr/src/linux/net/ipv4/netfilter/Config.in
nat-reservations not applied
newfile: 3 files in our way, unable to apply
cannot apply (2 rejects out of 22 hunks)
apply_dependency: unable to apply dependent nf-log

In conclusion my impression is the same as John's as well:
The 2.4.X kernel serie are no more supported.

To build a new 2.4 kernel requires in the meantime many, many
hours of troubleshooting and code changes by hand. And
I'm not an shrewd kernel developer.

Not all of people using linux kernels want to upgrade
to 2.6 kernels.

With great respect to the netfilter developers but

with funereal greetings
-- 
# make love
make: *** No rule to make target `love'.  Stop.

--------------ms050105080407020102090504
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIII7TCC
AtEwggI6oAMCAQICAwy9tDANBgkqhkiG9w0BAQQFADBiMQswCQYDVQQGEwJaQTElMCMGA1UE
ChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNv
bmFsIEZyZWVtYWlsIElzc3VpbmcgQ0EwHhcNMDQwNzIzMTEyODI5WhcNMDUwNzIzMTEyODI5
WjBEMR8wHQYDVQQDExZUaGF3dGUgRnJlZW1haWwgTWVtYmVyMSEwHwYJKoZIhvcNAQkBFhJt
YWluYnVnQGNlbG9jb20uZGUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQChsCZb
wDLPNNvpl6RnMx595n0C6FOLlGF6MewlPE3i176WReqmFRv5kBwBD7bBgBKfzzCv5UJ835A6
Pbnd7ZET9uWVWPLXOqXLMu0Nt0UVfAjVE2flxB9WqpaksFCaNV0vMEuK96OK4dBNeHdTT8uZ
z0rdaHSr3H3GcqJraFeOruF/tAnziQu6CmPoI43ieqIpyOgHYRXvP+MFzN+/t9poVwt7a8D0
ls2xQ2/EsIu2GhHakyc860hxFRM4ooXPu9XT+979BNar3s/CUawCoBJVl+s1WIXbKlNqI8wt
LRK3kdVrvVUr4M9oewbOs9Did9bB/UUhQA5vhlG3ehsfkmm/AgMBAAGjLzAtMB0GA1UdEQQW
MBSBEm1haW5idWdAY2Vsb2NvbS5kZTAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBBAUAA4GB
AFdq0kDcl3GCmoADWvs+9IpUAmjsBqZ7XIxA5FmZP9Na6e+Tvf0N+/36CE2TGd7MZLrbalSQ
yBmG6OHIxCRYZ4xKXxDMBDF0EQvWNpp2LwF9hBvTIh8Q83x8QrjrxGClvKomEQSmaVVHrZKO
KT1qU+p0tcXCg+kuMWDuLl3jUtoNMIIC0TCCAjqgAwIBAgIDDL20MA0GCSqGSIb3DQEBBAUA
MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQu
MSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQTAeFw0wNDA3
MjMxMTI4MjlaFw0wNTA3MjMxMTI4MjlaMEQxHzAdBgNVBAMTFlRoYXd0ZSBGcmVlbWFpbCBN
ZW1iZXIxITAfBgkqhkiG9w0BCQEWEm1haW5idWdAY2Vsb2NvbS5kZTCCASIwDQYJKoZIhvcN
AQEBBQADggEPADCCAQoCggEBAKGwJlvAMs802+mXpGczHn3mfQLoU4uUYXox7CU8TeLXvpZF
6qYVG/mQHAEPtsGAEp/PMK/lQnzfkDo9ud3tkRP25ZVY8tc6pcsy7Q23RRV8CNUTZ+XEH1aq
lqSwUJo1XS8wS4r3o4rh0E14d1NPy5nPSt1odKvcfcZyomtoV46u4X+0CfOJC7oKY+gjjeJ6
oinI6AdhFe8/4wXM37+32mhXC3trwPSWzbFDb8Swi7YaEdqTJzzrSHEVEziihc+71dP73v0E
1qvez8JRrAKgElWX6zVYhdsqU2ojzC0tEreR1Wu9VSvgz2h7Bs6z0OJ31sH9RSFADm+GUbd6
Gx+Sab8CAwEAAaMvMC0wHQYDVR0RBBYwFIESbWFpbmJ1Z0BjZWxvY29tLmRlMAwGA1UdEwEB
/wQCMAAwDQYJKoZIhvcNAQEEBQADgYEAV2rSQNyXcYKagANa+z70ilQCaOwGpntcjEDkWZk/
01rp75O9/Q37/foITZMZ3sxkuttqVJDIGYbo4cjEJFhnjEpfEMwEMXQRC9Y2mnYvAX2EG9Mi
HxDzfHxCuOvEYKW8qiYRBKZpVUetko4pPWpT6nS1xcKD6S4xYO4uXeNS2g0wggM/MIICqKAD
AgECAgENMA0GCSqGSIb3DQEBBQUAMIHRMQswCQYDVQQGEwJaQTEVMBMGA1UECBMMV2VzdGVy
biBDYXBlMRIwEAYDVQQHEwlDYXBlIFRvd24xGjAYBgNVBAoTEVRoYXd0ZSBDb25zdWx0aW5n
MSgwJgYDVQQLEx9DZXJ0aWZpY2F0aW9uIFNlcnZpY2VzIERpdmlzaW9uMSQwIgYDVQQDExtU
aGF3dGUgUGVyc29uYWwgRnJlZW1haWwgQ0ExKzApBgkqhkiG9w0BCQEWHHBlcnNvbmFsLWZy
ZWVtYWlsQHRoYXd0ZS5jb20wHhcNMDMwNzE3MDAwMDAwWhcNMTMwNzE2MjM1OTU5WjBiMQsw
CQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoG
A1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3VpbmcgQ0EwgZ8wDQYJKoZIhvcN
AQEBBQADgY0AMIGJAoGBAMSmPFVzVftOucqZWh5owHUEcJ3f6f+jHuy9zfVb8hp2vX8MOmHy
v1HOAdTlUAow1wJjWiyJFXCO3cnwK4Vaqj9xVsuvPAsH5/EfkTYkKhPPK9Xzgnc9A74r/rsY
Pge/QIACZNenprufZdHFKlSFD0gEf6e20TxhBEAeZBlyYLf7AgMBAAGjgZQwgZEwEgYDVR0T
AQH/BAgwBgEB/wIBADBDBgNVHR8EPDA6MDigNqA0hjJodHRwOi8vY3JsLnRoYXd0ZS5jb20v
VGhhd3RlUGVyc29uYWxGcmVlbWFpbENBLmNybDALBgNVHQ8EBAMCAQYwKQYDVR0RBCIwIKQe
MBwxGjAYBgNVBAMTEVByaXZhdGVMYWJlbDItMTM4MA0GCSqGSIb3DQEBBQUAA4GBAEiM0VCD
6gsuzA2jZqxnD3+vrL7CF6FDlpSdf0whuPg2H6otnzYvwPQcUCCTcDz9reFhYsPZOhl+hLGZ
GwDFGguCdJ4lUJRix9sncVcljd2pnDmOjCBPZV+V2vf3h9bGCE6u9uo05RAaWzVNd+NWIXiC
3CEZNd4ksdMdRv9dX2VPMYIDOzCCAzcCAQEwaTBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMc
VGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFs
IEZyZWVtYWlsIElzc3VpbmcgQ0ECAwy9tDAJBgUrDgMCGgUAoIIBpzAYBgkqhkiG9w0BCQMx
CwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0wNTAzMTMxOTA5MzlaMCMGCSqGSIb3DQEJ
BDEWBBSAtlK7G9iUxTqOaEcq0OYCAPTcWjBSBgkqhkiG9w0BCQ8xRTBDMAoGCCqGSIb3DQMH
MA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIB
KDB4BgkrBgEEAYI3EAQxazBpMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29u
c3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwg
SXNzdWluZyBDQQIDDL20MHoGCyqGSIb3DQEJEAILMWugaTBiMQswCQYDVQQGEwJaQTElMCMG
A1UEChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBl
cnNvbmFsIEZyZWVtYWlsIElzc3VpbmcgQ0ECAwy9tDANBgkqhkiG9w0BAQEFAASCAQBYNIXo
O0UQU8PgPf/fucv86F2FDAaLH0IcgGYk1Riz6QCioqpVjYNWsBdikFGmCx9x9ULIshAWfE2g
HO/20lqRnB9KhQ5dl0spW4q+4z8sDIvYMBSP1FHfPPi1B1j49Fjdf+kXtWlS5oEaNcozpwzM
BKZXUMaB+h6jR+ZHJfPRy0MlqlnsyKdx83AvCeBOzKdt5lEhMRzL5EVbbW1j3llMtbgCI4pG
AW7GpQw8xR25+QBFiNNE+uSOfwxTJajwpSzt/j4PBr9MbNrzgEi/ATfG+dtZsJ9X0Augedzd
GYS0rVknAptlcdnUy7g1dSGWYmWCaQPLrAH0efVKsBq9U44lAAAAAAAA
--------------ms050105080407020102090504--

