From: "Prasanta kumar Panda" <prasanta.kumar@wipro.com>
Subject: RE: iptables2.spec
Date: Wed, 12 Mar 2003 23:40:46 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7F9067FBD7B14F4387EA63434CE260033F844C@hyd-mdp-msg.wipro.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_001_01C2E8C2.B46957C8"
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Luis Miguel Cruz Miranda <luismi@b2bi.es>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C2E8C2.B46957C8
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hi Luis

But before that you should be able to build it manually. When I run make =
after a normal configure got this error


make[1]: Entering directory =
`/usr/src/redhat/BUILD/iptables2-pra1/libnfnetlink'
cd . && aclocal
/bin/sh ./config.status --recheck
./config.status: ./config.status: No such file or directory
make[1]: *** [config.status] Error 127
make[1]: Leaving directory =
`/usr/src/redhat/BUILD/iptables2-pra1/libnfnetlink'
make: *** [all-recursive] Error 1
=20

Other wise this is the way to make the rpm

Move the iptables2 directory to iptables2-VERSION directory and put to =
tar+gzip as iptables2-VERSION.tar.gz
Next
rpmbuild -tb iptables2-VERSION.tar.gz
Or
rpmbuild -ts iptables2-VERSION.tar.gz to get a srpm package which you =
can compile later on with rpmbuild --rebuild command.

Reg.
Prasanta




-----Original Message-----
From: Luis Miguel Cruz Miranda [mailto:luismi@b2bi.es]=20
Sent: Wednesday, March 12, 2003 10:26 PM
To: netfilter@lists.netfilter.org
Subject: iptables2.spec


I downloaded netfilter code from cvs.
I discover it cames with a iptables2.spec.
I tried to use it in order to create an iptables rpm, but I couldn't!!. =
How can I use it? rpm -ba iptables2.spec doesn't run for me.

Luis Miguel Cruz Miranda.               |       B2B INTEGRAL, S.A.
CCNA - Systems Administrator            |       Pol. Ind. de Asipo
                                         |       C/A - Parcela 86-C
Tel: +34 902 506 605                    |       33.428 - CAYES - LLANERA
Fax:+34 985 980 794                     |       ASTURIAS =
(ESPA=D1A/SPAIN)




------_=_NextPart_001_01C2E8C2.B46957C8
Content-Type: text/x-vcard;
	name="Prasanta (prasanta.kumar@wipro.com).vcf"
Content-Transfer-Encoding: base64
Content-Description: Prasanta (prasanta.kumar@wipro.com).vcf
Content-Disposition: attachment;
	filename="Prasanta (prasanta.kumar@wipro.com).vcf"

QkVHSU46VkNBUkQNClZFUlNJT046Mi4xDQpOOlBhbmRhO1ByYXNhbnRhO0t1bWFyDQpGTjpQcmFz
YW50YSAocHJhc2FudGEua3VtYXJAd2lwcm8uY29tKSAocHJhc2FudGEpDQpPUkc6V2lwcm8gVGVj
aG5vbG9naWVzO0lNRy1IREMNClRJVExFOlNyLiBOZXR3b3JrIEFuYWx5c3QNClRFTDtXT1JLO1ZP
SUNFOis5MSA0MC02NTY1MTQ4DQpURUw7V09SSztWT0lDRTorOTEgNDAtNjU2NTAwMA0KQURSO1dP
Uks7RU5DT0RJTkc9UVVPVEVELVBSSU5UQUJMRTo7O1dpcHJvIFRlY2hub2xvZ2llcz0wRD0wQVN1
cnZleSAjIDY0PTBEPTBBTWFkaGFwdXI7SHlkZXJhYmFkO0FuZGhyYSBQcmFkZXNoPQ0KOzUwMDAz
MztJbmRpYQ0KTEFCRUw7V09SSztFTkNPRElORz1RVU9URUQtUFJJTlRBQkxFOldpcHJvIFRlY2hu
b2xvZ2llcz0wRD0wQVN1cnZleSAjIDY0PTBEPTBBTWFkaGFwdXI9MEQ9MEFIeWRlcmFiYWQsIEFu
ZGhyYSBQcmE9DQpkZXNoIDUwMDAzMz0wRD0wQUluZGlhDQpVUkw7V09SSzpodHRwOi8vd3d3Lndp
cHJvLmNvbQ0KRU1BSUw7UFJFRjtFWDovbz1XaXByby9vdT1GaXJzdCBBZG1pbmlzdHJhdGl2ZSBH
cm91cC9jbj1SZWNpcGllbnRzL2NuPXByYXNhbnRhDQpSRVY6MjAwMjA3MjVUMDcwODI3Wg0KRU5E
OlZDQVJEDQo=


------_=_NextPart_001_01C2E8C2.B46957C8
Content-Type: text/plain;
	name="Wipro_Disclaimer.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="Wipro_Disclaimer.txt"

**************************Disclaimer************************************************

Information contained in this E-MAIL being proprietary to Wipro Limited is 
'privileged' and 'confidential' and intended for use only by the individual
 or entity to which it is addressed. You are notified that any use, copying 
or dissemination of the information contained in the E-MAIL in any manner 
whatsoever is strictly prohibited.

***************************************************************************************

------_=_NextPart_001_01C2E8C2.B46957C8--

