From: Srinath Mantripragada <srinathm@terra.com.br>
Subject: 3 outside networks
Date: Mon, 17 Jun 2002 11:34:59 -0300
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D0DF393.6050203@terra.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.samba.org

Hi,

I need some help with iptables and SNAT.


I have one inside net 172.16.0.0/24  and 3 outside nets  10.28.0.0/16 ,
   172.18.0.0/24 and Internet.
The 3 nets are routed by one router that i do not have control.

I have valid internet Addresses and i want to use NAT with one of them
but not for 10.28 and 172.18 networks.


i tried this:

iptables -t nat -I POSTROUTING -o eth1 -d ! 10.28.0.0/16 -j SNAT --to
MY.VALID.ADDR
iptables -t nat -I POSTROUTING -o eth1 -d ! 172.18.0.0/24 -j SNAT
--to MY.VALID.ADDR


I guess that i need something like :   "-d  ! 10.28.0.0/16  OR ! 
172.18.0.0./24"
but i dont  know how  to do that.


Can someone helpme ?


Thanks










