From: Bryan Shake <bshake@vt.edu>
Subject: Re: OS Fingerprint
Date: Mon, 29 Nov 2004 23:02:02 -0500
Message-ID: <41ABF0BA.7000105@vt.edu>
References: <7C9884991ADAE0479C14F10C858BCDF56795F1@alderaan.smgtec.com>
Reply-To: bshake@vt.edu
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms070602050101040001090405"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF56795F1@alderaan.smgtec.com>
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

--------------ms070602050101040001090405
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/29/04 17:12, Daniel Chemko wrote:
> Vlado Had wrote:
> 
>>hi, could somebody help me, how can i change
>>osfingerprint in packets?
>>thanks
> 
> 
> Do some homework. Basically a scanner uses inherent flaws in a packet
> response to determine the destination machine, but it could also use the
> fingerprint of the services running on the PC. Ex. if I implement 100%
> faking on the networking part of my stealthing, but leave apache open,
> the apache could say Redhat Linux blahblahblah and give it all away to
> the hacker. It isn't just 'change TOS to random', or MSS to y, or block
> all n packets to port q. Those are some OS fingerprint examples, but the
> technique is a lot more detailed. If in doubt, tear open the nmap code!
>

The IP Personality patch may be a solution, although it could only do so 
much as pointed out above (running network processes giving you away, 
etc) ... "http://ippersonality.sourceforge.net/"

Unfortunately, it doesn't appear to be actively maintained any longer.. 
  Linux 2.4.18 and iptables 1.2.2 were the last official releases, with 
a 2.4.20 patch here that doesn't seem to have ever made it onto the 
official download page.
"http://sourceforge.net/tracker/index.php?func=detail&aid=647045&group_id=7557&atid=307557" 


Additionaly, some OS fingerprinting tools such as p0f can be tricked by 
carefully modifying sysctl values such as ip_default_ttl, etc as they 
rely on matching a certain profile.

Bryan

--------------ms070602050101040001090405
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIH0TCC
AkMwggGsoAMCAQICAwxwlDANBgkqhkiG9w0BAQQFADBiMQswCQYDVQQGEwJaQTElMCMGA1UE
ChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNv
bmFsIEZyZWVtYWlsIElzc3VpbmcgQ0EwHhcNMDQwNjA0MDE1ODU1WhcNMDUwNjA0MDE1ODU1
WjA/MR8wHQYDVQQDExZUaGF3dGUgRnJlZW1haWwgTWVtYmVyMRwwGgYJKoZIhvcNAQkBFg1i
c2hha2VAdnQuZWR1MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDgjvmS1fUQHkUhtF52
ab5eFn2XsmlntTjK0Qnf7kMhjq4wSMhND7oXqE3DF4Q+c6DiCy9aVVEUFGsb45/Kd+8jL2Tp
ciK53KhS9hmykptedflW08++Xk396aVxXUpObf4zxy/6nb42YgfmD8RO3veALXYHmNubqAa7
HeWLc8yMUwIDAQABoyowKDAYBgNVHREEETAPgQ1ic2hha2VAdnQuZWR1MAwGA1UdEwEB/wQC
MAAwDQYJKoZIhvcNAQEEBQADgYEAaUP/eDG3ad/FT0gH/bqgngM538dg8vFj4cCG8dHsiJUP
sU0gIzLIlW5stl3o0r89nrjsWBh/c7b8lm3DqVdGuzKwmUEeg7lrER56wc1sE69TFS78XA37
vHCcu+Or4EBeMZW0Oz+JVbNejcFYANQ5+QEWfi5usrF+GX0ZRZ43w6YwggJDMIIBrKADAgEC
AgMMcJQwDQYJKoZIhvcNAQEEBQAwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBD
b25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFp
bCBJc3N1aW5nIENBMB4XDTA0MDYwNDAxNTg1NVoXDTA1MDYwNDAxNTg1NVowPzEfMB0GA1UE
AxMWVGhhd3RlIEZyZWVtYWlsIE1lbWJlcjEcMBoGCSqGSIb3DQEJARYNYnNoYWtlQHZ0LmVk
dTCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEA4I75ktX1EB5FIbRedmm+XhZ9l7JpZ7U4
ytEJ3+5DIY6uMEjITQ+6F6hNwxeEPnOg4gsvWlVRFBRrG+OfynfvIy9k6XIiudyoUvYZspKb
XnX5VtPPvl5N/emlcV1KTm3+M8cv+p2+NmIH5g/ETt73gC12B5jbm6gGux3li3PMjFMCAwEA
AaMqMCgwGAYDVR0RBBEwD4ENYnNoYWtlQHZ0LmVkdTAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3
DQEBBAUAA4GBAGlD/3gxt2nfxU9IB/26oJ4DOd/HYPLxY+HAhvHR7IiVD7FNICMyyJVubLZd
6NK/PZ647FgYf3O2/JZtw6lXRrsysJlBHoO5axEeesHNbBOvUxUu/FwN+7xwnLvjq+BAXjGV
tDs/iVWzXo3BWADUOfkBFn4ubrKxfhl9GUWeN8OmMIIDPzCCAqigAwIBAgIBDTANBgkqhkiG
9w0BAQUFADCB0TELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rlcm4gQ2FwZTESMBAGA1UE
BxMJQ2FwZSBUb3duMRowGAYDVQQKExFUaGF3dGUgQ29uc3VsdGluZzEoMCYGA1UECxMfQ2Vy
dGlmaWNhdGlvbiBTZXJ2aWNlcyBEaXZpc2lvbjEkMCIGA1UEAxMbVGhhd3RlIFBlcnNvbmFs
IEZyZWVtYWlsIENBMSswKQYJKoZIhvcNAQkBFhxwZXJzb25hbC1mcmVlbWFpbEB0aGF3dGUu
Y29tMB4XDTAzMDcxNzAwMDAwMFoXDTEzMDcxNjIzNTk1OVowYjELMAkGA1UEBhMCWkExJTAj
BgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKB
gQDEpjxVc1X7TrnKmVoeaMB1BHCd3+n/ox7svc31W/Iadr1/DDph8r9RzgHU5VAKMNcCY1os
iRVwjt3J8CuFWqo/cVbLrzwLB+fxH5E2JCoTzyvV84J3PQO+K/67GD4Hv0CAAmTXp6a7n2XR
xSpUhQ9IBH+nttE8YQRAHmQZcmC3+wIDAQABo4GUMIGRMBIGA1UdEwEB/wQIMAYBAf8CAQAw
QwYDVR0fBDwwOjA4oDagNIYyaHR0cDovL2NybC50aGF3dGUuY29tL1RoYXd0ZVBlcnNvbmFs
RnJlZW1haWxDQS5jcmwwCwYDVR0PBAQDAgEGMCkGA1UdEQQiMCCkHjAcMRowGAYDVQQDExFQ
cml2YXRlTGFiZWwyLTEzODANBgkqhkiG9w0BAQUFAAOBgQBIjNFQg+oLLswNo2asZw9/r6y+
whehQ5aUnX9MIbj4Nh+qLZ82L8D0HFAgk3A8/a3hYWLD2ToZfoSxmRsAxRoLgnSeJVCUYsfb
J3FXJY3dqZw5jowgT2Vfldr394fWxghOrvbqNOUQGls1TXfjViF4gtwhGTXeJLHTHUb/XV9l
TzGCArowggK2AgEBMGkwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0
aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1
aW5nIENBAgMMcJQwCQYFKw4DAhoFAKCCAacwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAc
BgkqhkiG9w0BCQUxDxcNMDQxMTMwMDQwMjAyWjAjBgkqhkiG9w0BCQQxFgQUipUYAJe4bL1Y
4Pvr7mRLO+1fqWUwUgYJKoZIhvcNAQkPMUUwQzAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgIC
AIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgweAYJKwYBBAGCNxAE
MWswaTBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkg
THRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3VpbmcgQ0ECAwxw
lDB6BgsqhkiG9w0BCRACCzFroGkwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBD
b25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFp
bCBJc3N1aW5nIENBAgMMcJQwDQYJKoZIhvcNAQEBBQAEgYBDMzsXZ3sNf74GyrSdY73amxCD
NDFg3Z83Bfl1FkpnWVsw0Wf7mgEyIeWEyD1hdcnxPAPCYk23vnkAj3CdBULGrIigUWNRkXO0
laraZFhyn43AcJix5VSO6EjMWX1Bqy6VGHPfff2BOJEjrUheoFS9iw/WQcR2uHnPfaJUdCq5
UAAAAAAAAA==
--------------ms070602050101040001090405--

