From: "Ian Pollock" <ianp@highsun.com.au>
Subject: Routing SMTP problem
Date: Fri, 14 Jun 2002 13:19:24 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <1597F9D20963E347AC9E232F0F636DA8047BA2@server.skinners.highsun.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hi,
Can anyone tell me if this is possible, we upgraded our internet access =
from isdn (small isp) to broadband (telstra). We had a static ip of =
eg:210.20.20.20 from our small isp on the isdn, with the new cable =
connection we get dhcp ip address which makes it hard for mail routing. =
Ok the big question can I alias the old static ip (small isp) we own of =
210.20.20.20 to my external etho dhcp (from telstra) device (ip of =
211.50.50.50) on my cable connection and route my mail through this way. =
I have included a few rules that I have in mind. Can anyone tell me if I =
am going down the wrong path with this and if they have any other way of =
doing it could they let me no (maybe I have to use pop3). Any help with =
this would be greatly appreciated, I tried to explain as best I could. =
Ian

iptables -t nat -A POSTROUTING -o eth0 -s my_mail_server -p tcp --dport =
25 -j SNAT --to OLD_ISP_mail_server_ip:25    ## can this work??

iptables -t nat -A PREROUTING -I eth0 -p tcp --dport 25 -j DNAT --to =
my_mail_server:25          ## I no this works...

ps... any help with "how to alias" would be great too

