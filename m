From: "Greg Dickinson" <gdickinson@logistasolutions.com>
Subject: Static NATting
Date: Tue, 18 Mar 2003 11:48:11 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <se770789.071@logistasolutions.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=_83DCC7F9.C8A9DC0E"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

This is a MIME message. If you are reading this text, you may want to 
consider changing to a mail reader or gateway that understands how to 
properly handle MIME multipart messages.

--=_83DCC7F9.C8A9DC0E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello all,

This question will undoubtedly get me branded as a n00b :-) but I am about =
to go insane trying to figure this out.  Am I doing something wrong?

Here's the scenario:

I have a RedHat 8 (Kernel 2.4-18) firewall that I am going to run squid =
on, as well as do some static NATting for some of the administrative PC's =
here.  I have configured the Cisco router to direct all the traffic from =
the affected /24 subnet to the linux box, and I am trying to do a 1-to-1 =
NAT so we can do things like Terminal Services, etc. across the internet.  =
I am using the following commands (the addresses are for my PC)

iptables -t nat -A POSTROUTING -s 10.227.101.4 -j SNAT --to 207.157.9.<some=
thing>
iptables -t nat -A PREROUTING -s 207.157.9.<something> -j DNAT --to =
10.227.101.4

And all the traffic summarily dies at the firewall :-)

I have aliased the 207.157.9.<something> address to the eth1 interface of =
the firewall.  What simple, obvious thing have I missed?

TIA,

--Greg



Gregory B. Dickinson, CNE CCNA
Systems Engineer
Logista Solutions
(205) 231-5602
(tQ =3D 2b|!2b)


--=_83DCC7F9.C8A9DC0E
Content-Type: text/x-vcard
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="Greg Dickinson.vcf"

QkVHSU46VkNBUkQNClZFUlNJT046Mi4xDQpYLUdXVFlQRTpVU0VSDQpGTjpEaWNraW5zb24sIEdy
ZWcNCk9SRzo7VGVjaG5pY2FsIFNlcnZpY2VzDQpFTUFJTDtXT1JLO1BSRUY7TkdXOkdEaWNraW5z
b25AbG9naXN0YXNvbHV0aW9ucy5jb20NCk46RGlja2luc29uO0dyZWcNCkVORDpWQ0FSRA0KDQpC
RUdJTjpWQ0FSRA0KVkVSU0lPTjoyLjENClgtR1dUWVBFOlVTRVINCkZOOkRpY2tpbnNvbiwgR3Jl
Zw0KT1JHOjtUZWNobmljYWwgU2VydmljZXMNCkVNQUlMO1dPUks7UFJFRjtOR1c6R0RpY2tpbnNv
bkBsb2dpc3Rhc29sdXRpb25zLmNvbQ0KTjpEaWNraW5zb247R3JlZw0KRU5EOlZDQVJEDQoNCkJF
R0lOOlZDQVJEDQpWRVJTSU9OOjIuMQ0KWC1HV1RZUEU6VVNFUg0KRk46RGlja2luc29uLCBHcmVn
DQpPUkc6O1RlY2huaWNhbCBTZXJ2aWNlcw0KRU1BSUw7V09SSztQUkVGO05HVzpHRGlja2luc29u
QGxvZ2lzdGFzb2x1dGlvbnMuY29tDQpOOkRpY2tpbnNvbjtHcmVnDQpFTkQ6VkNBUkQNCg0K

--=_83DCC7F9.C8A9DC0E--

