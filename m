From: Paulo Ricardo Bruck <pauloric@contatogs.com.br>
Subject: raccon+openvpn route problem....
Date: Thu, 25 Nov 2010 18:05:18 -0200 (BRST)
Message-ID: <5587032.20.1290715518120.JavaMail.root@mercurio>
References: <4CEE5EA9.3020309@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CEE5EA9.3020309@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi Guys

After google and ask help at openvpn's forum  I'm still w/ no lucky.
Please let me know if there is another forum/email list that could help me.

That's what I have :

Italy      ----------------------Brazil HeadQuarter--------------Brazil branch
cisco ipsec                      debian+racoon+openvpn            debian+openvpn
LAN 10.0.0.0/24                  LAN 10.54.0.0/24                 LAN 10.54.1.0/24
                                 OPENVPN=10.8.0.1                 openvpn=10.8.0.2

Italy and headquarter in braszil talk w/ each other without problems
Headquarter and branch in brazil talk w/ each other without problems
branch in Brazil can't talk w/ Italy.

using traceroute from branch I get 10.8.0.1 and stop. 
I'm almost certain that it's a route problem but I dont know how to solve.
Any help could be very appreciate.

best regards

route table at headOffice brazil
xx.xx.xx.xx/28 dev eth2  proto kernel  scope link  src xx.xx.xx.xx
10.8.0.0/24 dev tun0  proto kernel  scope link  src 10.8.0.1
10.54.0.0/24 dev eth0  proto kernel  scope link  src 10.54.0.1
default via xx.xx.xx.xx  dev eth2



route table at branch
10.8.0.0/24 dev tun0  proto kernel  scope link  src 10.8.0.2
10.54.1.0/24 dev eth0  proto kernel  scope link  src 10.54.1.1
10.0.0.0/24 via 10.8.0.1 dev tun0
yy.yy.yy.yy dev eth1  proto kernel  scope link  src yy.yy.yy.yy
default via yy.yy.yy.yy dev eth1

ipsec.conf ( HeadOffice Brazil)
spdadd 10.54.0.0/16 10.0.0.0/24 any -P out ipsec
        esp/tunnel/xx.xx.xx.xx-ww.ww.ww.ww/require;

spdadd 10.0.0.0/24 10.54.0.0/16 any -P in ipsec
        esp/tunnel/ww.ww.ww.ww-xx.xx.xx.xx/require;

PS how can a see route tables inserted by racoon/ipsec?


Paulo Ricardo Bruck
consultor
http://www.contatogs.com.br
