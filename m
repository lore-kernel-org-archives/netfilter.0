From: "Wennie V. Lagmay" <wlagmay@yanbulink.net>
Subject: Re: private to public IP
Date: Mon, 3 Jul 2006 13:42:24 +0300
Message-ID: <004b01c69e8d$5f083ab0$7819a8c0@MYNOTEBOOK>
References: <006801c69dcb$9fccd140$7819a8c0@MYNOTEBOOK>
	<1151856182.5609.2.camel@robee.mars.cyberbajt.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="iso-8859-1"; reply-type="original"
To: mlody@elpec.com, netfilter@lists.netfilter.org

Hi Robee,

Thank you very much for your reply, just want to confirn something.

1. Based on the script  you've sent to me does it mean that I have to input=
=20
all my private subnets example
iptables -I  FORWARD  -s 192.168.1.0/24 -m state --state NEW -j=20
LOG --log-level info
iptables -I  FORWARD  -s 192.168.2.0/24 -m state --state NEW -j=20
LOG --log-level info
iptables -I  FORWARD  -s 192.168.3.0/24 -m state --state NEW -j=20
LOG --log-level info
iptables -I  FORWARD  -s 192.168.4.0/24 -m state --state NEW -j=20
LOG --log-level info
and so on

2. With this script I can  identify a certain Private IP, which public IP=20
address it use and which remote IP it is connected? example

Private IP =3D 192.168.2.56
Public IP =3D  203.174.11.8
Remote IP =3D 65.67.87.9 (www.yahoo.com)

3. Are all the log are stored in /var/log/messages?


Thank you very much for you support,

Wennie

----- Original Message -----=20
From: "robee" <mlody@elpec.com>
To: <netfilter@lists.netfilter.org>
Sent: Sunday, July 02, 2006 7:03 PM
Subject: Re: private to public IP


Dnia 02-07-2006, nie o godzinie 14:35 +0300, Wennie V. Lagmay
napisa=B3(a):
> Hi all,
> I want to create a log on Iptables wherein to store and to identify which
> private Ip is connected on public Ip on a certain date and time. Can you
> help me on this
>
> Thanks,
>
> Wennie
>
>

the easiest way:

iptables -I FORWARD -s PRIVATE_IP -m state --state NEW \
-j LOG --log-level info



robee



