From: "Trevor Paskett" <tpaskett@cymphonix.com>
Subject: RE: HELP! Transparent Proxy using bridging 2.6.9 and REDIRECT on
	different subnet
Date: Fri, 25 Mar 2005 14:30:17 -0700
Message-ID: <2F413D5F33545D4A8465BBEE900238CC3FA831@cymmail.cymphonix.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=SHA1; boundary="----=_NextPart_000_02E3_01C53145.F1BF55C0"
content-class: urn:content-classes:message
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
To: gtaylor@riverviewtech.net
Cc: coreteam@netfilter.org, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_02E3_01C53145.F1BF55C0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit

I have found a solution :)

It was missing a route. If I do

ip route add 192.168.255.0/24 dev br0

For the remote subnets everything works as it should. Thanks for everyone's
help!!

Trevor Paskett
Cymphonix Programmer - CCNA, CWNA
P: 801-938-1500 F: 801-938-1501
 

-----Original Message-----
From: Grant Taylor [mailto:gtaylor@riverviewtech.net] 
Sent: Thursday, March 24, 2005 1:10 PM
To: Trevor Paskett
Cc: netfilter@lists.netfilter.org; coreteam@netfilter.org
Subject: Re: HELP! Transparent Proxy using bridging 2.6.9 and REDIRECT on
different subnet

There is one last really dastardly thing that I think *might* work.  That
would be running your system with a UML in side of it that does nothing but
DNATing/SNATing of traffic coming in to it so that traffic could be
redirected right back to Squid and then out and back through the DNAT/SNAT
router and then back to the box it's self where things can be handled.  But
when I start thinking of things like this I also start thinking that there
is something either missing or broken that is preventing me from doing what
I want to do, but sometimes things like this are necessary.  I presently do
not have a system set up any where to test this and I will not have time to
do so for a while.  If you would like me to continue down this road next
week I would be willing to do so.  In short the following would be the
packet's path through the network:

Client System(s) <-> Linux 2.6.9 System (DNAT/SNAT) <-> Linux 2.6.9 UML
(DNAT/SNAT) <-> Squid on Linux 2.6.9 System <-> Linux 2.6.9 UML (DNAT/SNAT)
<-> Linux 2.6.9 System (DNAT/SNAT) <-> INet Router <-> Client System(s)

Yes this is a LONG convoluted path, but this is all that I can think of with
out really messing with the packet.  I have had reasonable success running
UMLs for routing before as I have a client that routes out across 8 cable
modems on the same subnet in a pseudo round robin fashion via routing to 8
UML virtual routers and then bridging back to the interfaces that the cable
modems are connected to.  I ended up using 802.1q VLAN tagging to create the
8 virtual interfaces with wonderful success.  So things like this are
doable, just cumbersome and I've not seen any network config or firewall
package that would even come close to doing things like this.  This is all
hand rolled stuff.



Grant. . . .

Trevor Paskett wrote:

> Thanks for your reply. Our product is a Linux based product that uses
> netfilter. We have Squid and a filtering engine on our box. We are
> strong supporters of netfilter. Our customers have many subnets behind
> our box because of where it is placed in their network. Bringing up
> alias's on br0 for each of their subnets that are not even on that
> broadcast domain is a big band aid :). I think this is somehow a bug in
> ip_nat_core.c and will investigate that further and have cc'd
> coreteam@netfilter.org and hopefully that will get to Rusty who wrote
> it.
> 
> As for the SNAT I think Jason Opperisano's response is correct.
> Everything works great, except somewhere in ip_nat_core.c the src port
> is getting changed to 1 from 80. I have attached an ethereal dump to
> show this happening and a dump when it does what it is supposed to.
> Everything between the 2 is the same, except after I captured the
> no_work.cap, I did
> 
> ifconfig br0:0 192.168.255.165
> 
> So it had an IP on the test machine's subnet. Of course it worked fine
> and that capture is work.cap
> 
> Thanks for all your help.
> 
> Trevor Paskett
> Cymphonix Programmer - CCNA, CWNA
> P: 801-938-1500 F: 801-938-1501


------=_NextPart_000_02E3_01C53145.F1BF55C0
Content-Type: application/x-pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIIzTCCAlUw
ggG+oAMCAQICAw1wIDANBgkqhkiG9w0BAQQFADBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhh
d3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVt
YWlsIElzc3VpbmcgQ0EwHhcNMDQxMTE2MTgyMTAxWhcNMDUxMTE2MTgyMTAxWjBIMR8wHQYDVQQD
ExZUaGF3dGUgRnJlZW1haWwgTWVtYmVyMSUwIwYJKoZIhvcNAQkBFhZ0cGFza2V0dEBjeW1waG9u
aXguY29tMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC5aEKzCwlp1xzQdkwSqSdtBWpnGV8b
g/66yec21YF3HYJnjcFXcNSSTffJ3xR5bF+qEQKAreVJ3sYmJape7mJD/n6fnR1eAJjZM1vRXK8S
tOYJ3WBcphKLUhJ66Icah3/ILRk1N2f3tWJZj2C6zm+XoQN1kekzD3RQcLISv9I6ZQIDAQABozMw
MTAhBgNVHREEGjAYgRZ0cGFza2V0dEBjeW1waG9uaXguY29tMAwGA1UdEwEB/wQCMAAwDQYJKoZI
hvcNAQEEBQADgYEAM0gxU/PMQ61PzetX/3TiZroY+jZXuLBhyt9vlVTPvRXQ9k2PNRX6/8T1TXBF
pYhCJU9cA7uT8gK/LxahJLf7a0S/VnxG5CWB8zDR4OUDMt9PS37LkH8KJhThDMa+XMRoUt24hDCG
2qcllZ8RyQsWA1JO3Sx1GoiojYgK9i/Loj4wggMtMIIClqADAgECAgEAMA0GCSqGSIb3DQEBBAUA
MIHRMQswCQYDVQQGEwJaQTEVMBMGA1UECBMMV2VzdGVybiBDYXBlMRIwEAYDVQQHEwlDYXBlIFRv
d24xGjAYBgNVBAoTEVRoYXd0ZSBDb25zdWx0aW5nMSgwJgYDVQQLEx9DZXJ0aWZpY2F0aW9uIFNl
cnZpY2VzIERpdmlzaW9uMSQwIgYDVQQDExtUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgQ0ExKzAp
BgkqhkiG9w0BCQEWHHBlcnNvbmFsLWZyZWVtYWlsQHRoYXd0ZS5jb20wHhcNOTYwMTAxMDAwMDAw
WhcNMjAxMjMxMjM1OTU5WjCB0TELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rlcm4gQ2FwZTES
MBAGA1UEBxMJQ2FwZSBUb3duMRowGAYDVQQKExFUaGF3dGUgQ29uc3VsdGluZzEoMCYGA1UECxMf
Q2VydGlmaWNhdGlvbiBTZXJ2aWNlcyBEaXZpc2lvbjEkMCIGA1UEAxMbVGhhd3RlIFBlcnNvbmFs
IEZyZWVtYWlsIENBMSswKQYJKoZIhvcNAQkBFhxwZXJzb25hbC1mcmVlbWFpbEB0aGF3dGUuY29t
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDUadfUsJRkW3HpR9gMUbbqcpGwhF59LQ2PexLf
hSV1KHQ6QixjJ5+Ve0vvfhmHHYbqo925zpZkGsIUbkSsfOaP6E0PcR9AOKYAo4d49vmUhl6t6sBe
duvZFKNdbnp8DKVLVX8GGSl/npom1Wq7OCQIapjHsdqjmJH9edvlWsQcuQIDAQABoxMwETAPBgNV
HRMBAf8EBTADAQH/MA0GCSqGSIb3DQEBBAUAA4GBAMfskn5O+PWWpWdiKqTwTRFg0G+NYFhhrCa7
UjVcCM8w+6hKloofYkIjjBcP9LpknBesRynfnZhe0mxgcVyirNx54+duAEcftQ0o6AKd5Jr9E/Sm
2Xyx+NxfIyYJkYBz0BQb3kOpgyXy5pwvFcr+pquKB3WLDN1RhGvk+NHOd6KBMIIDPzCCAqigAwIB
AgIBDTANBgkqhkiG9w0BAQUFADCB0TELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rlcm4gQ2Fw
ZTESMBAGA1UEBxMJQ2FwZSBUb3duMRowGAYDVQQKExFUaGF3dGUgQ29uc3VsdGluZzEoMCYGA1UE
CxMfQ2VydGlmaWNhdGlvbiBTZXJ2aWNlcyBEaXZpc2lvbjEkMCIGA1UEAxMbVGhhd3RlIFBlcnNv
bmFsIEZyZWVtYWlsIENBMSswKQYJKoZIhvcNAQkBFhxwZXJzb25hbC1mcmVlbWFpbEB0aGF3dGUu
Y29tMB4XDTAzMDcxNzAwMDAwMFoXDTEzMDcxNjIzNTk1OVowYjELMAkGA1UEBhMCWkExJTAjBgNV
BAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25h
bCBGcmVlbWFpbCBJc3N1aW5nIENBMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDEpjxVc1X7
TrnKmVoeaMB1BHCd3+n/ox7svc31W/Iadr1/DDph8r9RzgHU5VAKMNcCY1osiRVwjt3J8CuFWqo/
cVbLrzwLB+fxH5E2JCoTzyvV84J3PQO+K/67GD4Hv0CAAmTXp6a7n2XRxSpUhQ9IBH+nttE8YQRA
HmQZcmC3+wIDAQABo4GUMIGRMBIGA1UdEwEB/wQIMAYBAf8CAQAwQwYDVR0fBDwwOjA4oDagNIYy
aHR0cDovL2NybC50aGF3dGUuY29tL1RoYXd0ZVBlcnNvbmFsRnJlZW1haWxDQS5jcmwwCwYDVR0P
BAQDAgEGMCkGA1UdEQQiMCCkHjAcMRowGAYDVQQDExFQcml2YXRlTGFiZWwyLTEzODANBgkqhkiG
9w0BAQUFAAOBgQBIjNFQg+oLLswNo2asZw9/r6y+whehQ5aUnX9MIbj4Nh+qLZ82L8D0HFAgk3A8
/a3hYWLD2ToZfoSxmRsAxRoLgnSeJVCUYsfbJ3FXJY3dqZw5jowgT2Vfldr394fWxghOrvbqNOUQ
Gls1TXfjViF4gtwhGTXeJLHTHUb/XV9lTzGCAs8wggLLAgEBMGkwYjELMAkGA1UEBhMCWkExJTAj
BgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJz
b25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAgMNcCAwCQYFKw4DAhoFAKCCAbwwGAYJKoZIhvcNAQkD
MQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMDUwMzI1MjIyMTMyWjAjBgkqhkiG9w0BCQQx
FgQU1ZnGs6gxgEaJeuLC22Tte0DSqPswZwYJKoZIhvcNAQkPMVowWDAKBggqhkiG9w0DBzAOBggq
hkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwBwYFKw4D
AhowCgYIKoZIhvcNAgUweAYJKwYBBAGCNxAEMWswaTBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMc
VGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZy
ZWVtYWlsIElzc3VpbmcgQ0ECAw1wIDB6BgsqhkiG9w0BCRACCzFroGkwYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAgMNcCAwDQYJKoZIhvcNAQEBBQAEgYB50VCHAfxe
90CmvAlv7Z5Vy57fZ9t4lvZS/25lt4LRsk36JLD1aGDFkqM45++fHPh5hIxctxHgKL0L+l5OtAQM
t/gFN/v33l4Jcz6nAWdRoVycRxhlnID1/xpst1CD1AhZqp+0T6YJUa+DduSxE3bwobn3NstgWPco
UBWSmByLNQAAAAAAAA==

------=_NextPart_000_02E3_01C53145.F1BF55C0--

