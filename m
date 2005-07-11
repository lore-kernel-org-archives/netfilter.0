From: Robert Vangel <vangelr@rfgt.net>
Subject: Re: Starting a fw
Date: Mon, 11 Jul 2005 15:35:15 +0800
Message-ID: <42D22133.3020909@rfgt.net>
References: <9927912d0507072234673f1aa0@mail.gmail.com>
	<9927912d05071022336896dbb@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms060705030601010101060703"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9927912d05071022336896dbb@mail.gmail.com>
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

--------------ms060705030601010101060703
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Please try to keep the discussion on-list. Thanks.

Visham Ramsurrun wrote:
> Hi Robert,
> 
> First of, many thx for the reply..
> 
> 
>>What distro? I am going to take a stab at it and choose RH/Fedora. I am also going to take a stab at it (I don't use Fedora) and say that default runlevel is 4?
> 
> 
> Yes, i'm using Red Hat 9 with an upgraded kernel of 2.6.11.7
> 
> 
>>If my memory serves me well (I hope it does), the file we need to look at is /etc/sysconfig/iptables. The contents of this file match the output of a `iptables-save'. Basically what the init script does is `iptables-restore < /etc/sysconfig/iptables'.
> 
> 
>>All you need to do is edit the /etc/sysconfig/iptables file to match your needs and then restart the iptables service.
> 
> 
> Do I delete the lines that are written inthe file and then paste the
> contents of my fiewall script?

You don't just paste the contents line for line. It needs to be changed a little.

Take a look at

http://zilla.id.au/netfilter/iptables & http://zilla.id.au/netfilter/shell

The first file is what I call `iptables syntax'. It is the file outputted by running `iptables-save' and can be read by using `iptables-restore < file'

The second is simply a shell script, executing iptables each time and appending each rule.

Hopefully the two files above will help you in converting your shell script into the iptables syntax one to put in /etc/sysconfig/iptables.

> 
> Hope to hear from you soon..
> 
> Warm regards,
> Visham
> 


--------------ms060705030601010101060703
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
DQEHATAcBgkqhkiG9w0BCQUxDxcNMDUwNzExMDczNTE1WjAjBgkqhkiG9w0BCQQxFgQU5ycq
unEkvcywVkuG+1qDjVEVXn4wUgYJKoZIhvcNAQkPMUUwQzAKBggqhkiG9w0DBzAOBggqhkiG
9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgweAYJKwYB
BAGCNxAEMWswaTBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcg
KFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3Vpbmcg
Q0ECAw1u0jB6BgsqhkiG9w0BCRACCzFroGkwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRo
YXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBG
cmVlbWFpbCBJc3N1aW5nIENBAgMNbtIwDQYJKoZIhvcNAQEBBQAEggEAFKg4QmrJUjs1anCl
pt/euQse0wchfEJAyI/ecOzEEO6u9XfGb36HJVANbMDw+a84HsJOSsJ8OhOq6mvFIUXKsmeO
JGoM/ZoAUDHYfhK0HfMBaow8kuncb036t45/VUhT4IWX9h1ryi+hKzaG3VdYbF+uoLdTN26L
See+d+4859g9nMPNW87iuxVop7sVjVCDmIWBj1yJLvIDWHKQhPZwthqn6FruIjux4/S1PAWo
FyGfAcHBlQTc5i5mp9vsUE77cAaZ6+6uHwEIZSGKNB1QplsL/VJi+z8/DjeCIPoZq4KMEwZI
gPk/5U0kdzCebXQhlZSbSvvYTk00+eGeHqnNOAAAAAAAAA==
--------------ms060705030601010101060703--

