From: "Fritz Mesedilla" <fritz.mesedilla@overturemedia.com>
Subject: Web Server NAt Notes
Date: Mon, 27 Oct 2003 11:29:10 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F22386C3FEB012449238672E38ED61E706C25B@overlord.overturemedia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: "Netfilter Mailing List (E-mail)" <netfilter@lists.netfilter.org>


Greetings!
As I was helped by this group so much especially by Mr. George Vieira, =
I'd like to share what I can...

Creating NAT for a web server:

# web server NAT
#

eth0:
- external network card
- 192.168.8.235

eth1:
- internal network card
- 192.168.9.230

# visitor makes contact to firewall to server
$IPTABLES -t nat -A PREROUTING -p tcp -i eth0 -d 192.168.8.235 --dport =
80 -j DNAT --to 192.168.9.230
$IPTABLES -A FORWARD -p tcp -i eth0 -o eth1 -d 192.168.9.230 --dport 80 =
-j ACCEPT

# server replies to firewall to user
$IPTABLES -t nat -A POSTROUTING -p tcp -o eth1 -d 192.168.9.230 --dport =
80 -j MASQUERADE
$IPTABLES -A FORWARD -p tcp -i eth1 -o eth0 -s 192.168.9.230 --sport 80 =
-j ACCEPT

Notice that the postrouting rule uses MASQUERADE instead of SNAT back to =
the firewall. I noticed that every visitor to the web server got his ip =
address to the packets and thus, became the source ip. When I tried =
MASQUERADE, the rules worked.

my computer:
- 192.168.8.11

SAMPLE LOG
**PRE:  IN=3Deth0 OUT=3D     SRC=3D192.168.8.11 DST=3D192.168.9.235 =
PROTO=3DTCP SPT=3D4806 DPT=3D80
**FWD:  IN=3Deth0 OUT=3Deth1 SRC=3D192.168.8.11 DST=3D192.168.9.230 =
PROTO=3DTCP SPT=3D4800 DPT=3D80
**POST: IN=3D     OUT=3Deth1 SRC=3D192.168.8.11 DST=3D192.168.9.230 =
PROTO=3DTCP SPT=3D4808 DPT=3D80
**FWD:  IN=3Deth1 OUT=3Deth0 SRC=3D192.168.9.230 DST=3D192.168.8.11 =
PROTO=3DTCP SPT=3D80   DPT=3D4800

Based on this log, I cannot really use SNAT for a web server but a =
MASQUERADE. I dunno why this happens to my iptables. I have seen on a =
lot of tutorials use SNAT for the web server postrouting.

Anyway, I got the rules fixed after George suggested I log the forward =
packets. I noticed that there was another forward that was being done. =
Thus, not only do you need 1 forward rule but 2. Of course, you need 2 =
forward rules only if you have $IPTABLES -P FORWARD DROP by default. If =
you have $IPTABLES -P FORWARD ACCEPT then you only need 1 forward rule.

Hope that helps. It was really hard looking for these 4 rules from the =
net. :D So I hope it can help someone.


fritz <www.mesedilla.com>
---
+ Basta Ikaw Lord=20

----------------------------------------------------------------------
This email and any files transmitted with it are confidential and
intended solely for the use of the individual or entity to whom they
are addressed. If you have received this email in error please notify
the sender immediately by e-mail and delete this e-mail from your
system. Please note that any views or opinions presented in this
email are solely those of the author and do not necessarily represent
those of the company. Finally, the recipient should check this email
and any attachments for the presence of viruses. The company accepts
no liability for any damage caused by any virus transmitted by this
email.=20

Overture Media, Inc.
Direct Line: (632) 635-4785
Trunkline:   (632) 631-8971 Local 146
Fax: (632) 637-2206
Level 1 Summit Media Offices, Robinsons Galleria EDSA Cor. Ortigas Ave., =
Quezon City 1100


