From: Robert Vangel <vangelr@rfgt.net>
Subject: Re: Starting a fw
Date: Fri, 08 Jul 2005 13:47:16 +0800
Message-ID: <42CE1364.9020006@rfgt.net>
References: <9927912d0507072234673f1aa0@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms060706010903050103040406"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9927912d0507072234673f1aa0@mail.gmail.com>
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

--------------ms060706010903050103040406
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Visham Ramsurrun wrote:
> Hi to all,
> 
> I was once told that in order to start a firewall automatically when a
> machine boots, we must make sure that the init process calls the
> script by making a symbolic link to that file in the /etc/rc.d/rcX.d
> directories.
> 
> I have found that there is a file called S08iptables (kernel 2.4.20-8)
> containing startup commands for iptables service. Do i delete it and
> then put the symbolic link to my script there or just leave it?

Leave that. You can use this to do your firewalling.

> 
> Let's say I have a firewall script called fw.sh with the following rules in it:
> 
> #!/bin/bash
> IPT=/sbin/iptables
> 
> $IPT -F
> $IPT -X
> $IPT -P INPUT DROP
> $IPT -P OUTPUT DROP
> $IPT -P FORWARD DROP
> 
> $IPT -A FORWARD -i eth0 -o eth0 -s 192.168.10.0/24 -d 192.168.10.0/24
> -m state --state NEW,ESTABLISHED,RELATED -p icmp --icmp-type echo
> request -j ACCEPT
> 
> $IPT -A FORWARD -i eth0 -o eth0 -s 192.168.10.0/24 -d 192.168.10.0/24
> -m state --state NEW,ESTABLISHED,RELATED -p icmp --icmp-type echo
> reply -j ACCEPT
> 
> What steps (where to create symbolic links, at which runlevel, etc)
> should I take in order to have this script be started automatically
> when PC boots up. How can I make sure that it is this firewall script
> that is running and all packets are being checked against these rules?
> 
> Thx in advance..
> 
> Warm regards,
> Visham
> 


What distro? I am going to take a stab at it and choose RH/Fedora. I am also going to take a stab at it (I don't use Fedora) and say that default runlevel is 4?

If my memory serves me well (I hope it does), the file we need to look at is /etc/sysconfig/iptables. The contents of this file match the output of a `iptables-save'. Basically what the init script does is `iptables-restore < /etc/sysconfig/iptables'.

All you need to do is edit the /etc/sysconfig/iptables file to match your needs and then restart the iptables service.

That said, if you aren't using RH or Fedora... I'm probably way off

--------------ms060706010903050103040406
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
DQEHATAcBgkqhkiG9w0BCQUxDxcNMDUwNzA4MDU0NzE2WjAjBgkqhkiG9w0BCQQxFgQUlbH0
90UbhDB7ZNprMqj5nekjfe0wUgYJKoZIhvcNAQkPMUUwQzAKBggqhkiG9w0DBzAOBggqhkiG
9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgweAYJKwYB
BAGCNxAEMWswaTBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcg
KFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3Vpbmcg
Q0ECAw1u0jB6BgsqhkiG9w0BCRACCzFroGkwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRo
YXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBG
cmVlbWFpbCBJc3N1aW5nIENBAgMNbtIwDQYJKoZIhvcNAQEBBQAEggEASbfn73W1JnA/JTyX
5E4AJ/118s5PfIm2qEYzt3hrOWK6zIh/rJCzF7FxxAiKXEzrj+e94u4XgcMArK7LY1uHI1bM
SJeer2wgQ4DEM3HRc8Bd+cdsUQeP9nb5TJbQl/pIH1fIRP11MEHq2t+zF1h7n4+W3mK0E/s+
flzt+RpUISLbCT3bM848kFRruL5W9IPCrcTqI2Maa54UI2N28ImDwyOkH2xT5SPOh3gVZi2Q
weWkyExP72XdqQYy9uMtIt3sWV81Kf4RzG+TUM4WaFMdA1KU2XVG6G9fO3B7N1n7Kpe7GKzD
P6qEo41OCK+xfnwOdIe8SNlnra38/ESL5oaQdAAAAAAAAA==
--------------ms060706010903050103040406--

