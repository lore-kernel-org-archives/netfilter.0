From: <anisha.chandrasekaran@wipro.com>
Subject: RE: INPUT and PORTS
Date: Wed, 1 Nov 2006 19:05:01 +0530
Message-ID: <2FEE63312285CF428A8480B07AC1C359037A19B1@CHN-SNR-MBX01.wipro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: devnull@plugthebox.net, netfilter@lists.netfilter.org


I would like to have a little more clear idea on what you need to do
exactly????

That is, DO you need to allow only 80 and 20 ports from the specified
ip?
In that case you can have=0D
Iptables -P FORWARD DROP
Iptables -A FORWARD -p tcp -s 10.2.2.115 -m multiport --dports 80,22 -j
ACCEPT

The above rule will allow only 80 and 22 requests from that ip. Is this
clear or am I not answering what you are asking????

=0D
 Regards,

Anisha Chandrasekaran
=0D
 =0D
        =0D
-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of
plugthebox.net /dev/null
Sent: Wednesday, November 01, 2006 6:19 PM
To: netfilter
Subject: INPUT and PORTS

Hello,
I want to do the following, accept in comings from 10.2.2.115 only
restricting to port 80,22

is this correct?=0D

-P rules ...
-F rules ...
/sbin/iptables -A FORWARD -d 10.2.2.115 -j ACCEPT
/sbin/iptables -A FORWARD -s 10.2.2.115 -j ACCEPT
/sbin/iptables -A INPUT -s 10.2.2.115 -j ACCEPT
/sbin/iptables -A FORWARD -m multiport -p tcp --ports 80,22 -j ACCEPT
/sbin/iptables -A INPUT -m multiport -p tcp --ports 80,22 -j ACCEPT

Eventhough i saw this setup in many tutorials/howtos,  when ever i want
to block 10.2.2.115 (by not listing him in the INPUT -j ACCEPT), that ip
can still connect to port 80 and 22.



Thanks
Sincerely,




The information contained in this electronic message and any attachments to=
 this message are intended for the exclusive use of the addressee(s) and=
 may contain proprietary, confidential or privileged information. If you=
 are not the intended recipient, you should not disseminate, distribute or=
 copy this e-mail. Please notify the sender immediately and destroy all=
 copies of this message and any attachments.=0D

WARNING: Computer viruses can be transmitted via email. The recipient=
 should check this email and any attachments for the presence of viruses.=
 The company accepts no liability for any damage caused by any virus=
 transmitted by this email.
=0D
www.wipro.com

