From: Robert Vangel <vangelr@rfgt.net>
Subject: Re: iptables LOG options
Date: Tue, 24 May 2005 12:00:15 +0800
Message-ID: <4292A6CF.4020904@rfgt.net>
References: <4292A1A7.3020401@poornam.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms060408050804000302000807"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4292A1A7.3020401@poornam.com>
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

--------------ms060408050804000302000807
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Binish A R wrote:
> Hello,
> 
> I am trying to write my custom firewall rules.
> I want to drop all outgoing ssh for non root users and log any such 
> attempts at the same time.
> I want to log the username trying to do that. What option should I give?
> 
> The following won't definitely work.
> 
> iptables -I OUTPUT -p tcp --dport 22  -m owner ! --uid-owner root -j LOG 
> --log-prefix "$USER NO SSH ALLOWED"
> 
> because the shell expands $USER variable immediately.
> 
> Is there any other option to find the value of owner that get matched by 
> the below rule:
> 
> 
> iptables -I OUTPUT -p tcp --dport 22  -m owner ! --uid-owner root
> 
> 
> Any help is much appreciated.
> 
> 
> Thanks and Regards,
> 
> Binish
> 
> 
> 

Make it `--uid-owner ! root' instead of `! --uid-owner root'

--------------ms060408050804000302000807
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
YXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMIGfMA0GCSqGSIb3DQEBAQUAA4GN
ADCBiQKBgQDEpjxVc1X7TrnKmVoeaMB1BHCd3+n/ox7svc31W/Iadr1/DDph8r9RzgHU5VAK
MNcCY1osiRVwjt3J8CuFWqo/cVbLrzwLB+fxH5E2JCoTzyvV84J3PQO+K/67GD4Hv0CAAmTX
p6a7n2XRxSpUhQ9IBH+nttE8YQRAHmQZcmC3+wIDAQABo4GUMIGRMBIGA1UdEwEB/wQIMAYB
Af8CAQAwQwYDVR0fBDwwOjA4oDagNIYyaHR0cDovL2NybC50aGF3dGUuY29tL1RoYXd0ZVBl
cnNvbmFsRnJlZW1haWxDQS5jcmwwCwYDVR0PBAQDAgEGMCkGA1UdEQQiMCCkHjAcMRowGAYD
VQQDExFQcml2YXRlTGFiZWwyLTEzODANBgkqhkiG9w0BAQUFAAOBgQBIjNFQg+oLLswNo2as
Zw9/r6y+whehQ5aUnX9MIbj4Nh+qLZ82L8D0HFAgk3A8/a3hYWLD2ToZfoSxmRsAxRoLgnSe
JVCUYsfbJ3FXJY3dqZw5jowgT2Vfldr394fWxghOrvbqNOUQGls1TXfjViF4gtwhGTXeJLHT
HUb/XV9lTzGCAzswggM3AgEBMGkwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBD
b25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFp
bCBJc3N1aW5nIENBAgMNbtIwCQYFKw4DAhoFAKCCAacwGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMDUwNTI0MDQwMDE1WjAjBgkqhkiG9w0BCQQxFgQU0MXn
xDsC2tIf3SpmIES/dLjAVyowUgYJKoZIhvcNAQkPMUUwQzAKBggqhkiG9w0DBzAOBggqhkiG
9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgweAYJKwYB
BAGCNxAEMWswaTBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcg
KFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3Vpbmcg
Q0ECAw1u0jB6BgsqhkiG9w0BCRACCzFroGkwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRo
YXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBG
cmVlbWFpbCBJc3N1aW5nIENBAgMNbtIwDQYJKoZIhvcNAQEBBQAEggEAfshrjXx9M8OmftCa
+F0V7NtLTfiKNyxuzhtWc2g8bnFM1oQKuKDecOamxcZd1z1W0aoT9WW4etgreVEX9AxG1VC+
wUjgXQD9MxwadSU05dWg1MqZdCGSBsyUk/KWFdcg50Wp1KmpD84aJw5lzQyhbbQslerlGB0l
IHA8zXUCuxPL5pu/NwwEoaivGT0CzW2IOlJs/zJS8xXjVoVVFKnXgm/v+MRd01NdOUSb/yiM
rWFfrr2yQofYxY73BcB/8689SkHF47PQTgQJY9RfUq7/XDqvvGHMS8f9YJaXiRIA7Zo0j4HH
WuBtp/f47mficJ6IZccGjv/Y+uAuLEHOzL609QAAAAAAAA==
--------------ms060408050804000302000807--

