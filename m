From: "marcos" <info@sisint.com.ar>
Subject: SIP services
Date: Tue, 3 Jun 2008 11:37:48 -0300
Message-ID: <004401c8c587$72878500$6e00a8c0@wrh92000>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi list memembers,  i need to conect a  sip-pabx  micronet  sp5211 to inet ,
it is behind  a  linux box with 2 networks cards , the former eth0  access
to internet  , the  second  eth1 connects to lan, i am trying to use dnat to
accept sip connection from internet  ,  but DNAT doesn't work, using iptraf
i see the packets  arrive from internet with the right ip addrerss  from the
client  that treat to conect, but the registration process fail  ,  on the
same box i am using  dnat redirecting the port 8008 from the public side to
PABX ip - port  80 in the lan , and the remote administration for the pabx
work fine ,
o other  hand  in  same box i have several domains  working  under
apache/php/mysql and work fine , too, there some bug about  DNATing SIPs
connections???
the have a  old di stribution Red  HAT 9.0   iptables 1.2.7a

i am thinking to add a  new   interface eth2  and  bridge it with etho,

could helpme anyone.
Thanks a lot
 marcos


