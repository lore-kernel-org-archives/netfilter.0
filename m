From: osu <osu@retemp.ru>
Subject: Iptables + quota patch
Date: Thu, 16 Oct 2008 10:15:25 +0400
Message-ID: <48F6DBFD.8010101@retemp.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi!
We are temporary using quota patch to account out traffic.
But the reply from iptables is somewhere strange, for example, i 
consequently ask for current rule, and receive different --quota state,
it jumps from 23964119 bytes to 28167287 and back in undefined order, 
however in the left column the ammount of sended bytes remains constant.
pastor@UProxy:/root/firewall$ sudo iptables-save -c | grep 130.84
[11332:7111480] -A OUTPUT -s 130.130.130.57/32 -d 130.130.130.84/32 -m 
quota --quota 23964119 -j ACCEPT
pastor@UProxy:/root/firewall$ sudo iptables-save -c | grep 130.84
[11332:7111480] -A OUTPUT -s 130.130.130.57/32 -d 130.130.130.84/32 -m 
quota --quota 28167287 -j ACCEPT
pastor@UProxy:/root/firewall$ sudo iptables-save -c | grep 130.84
[11332:7111480] -A OUTPUT -s 130.130.130.57/32 -d 130.130.130.84/32 -m 
quota --quota 28167287 -j ACCEPT
pastor@UProxy:/root/firewall$ sudo iptables-save -c | grep 130.84
[11332:7111480] -A OUTPUT -s 130.130.130.57/32 -d 130.130.130.84/32 -m 
quota --quota 28167287 -j ACCEPT
pastor@UProxy:/root/firewall$ sudo iptables-save -c | grep 130.84
[11332:7111480] -A OUTPUT -s 130.130.130.57/32 -d 130.130.130.84/32 -m 
quota --quota 23964119 -j ACCEPT
pastor@UProxy:/root/firewall$ sudo iptables-save -c | grep 130.84
[11332:7111480] -A OUTPUT -s 130.130.130.57/32 -d 130.130.130.84/32 -m 
quota --quota 28167287 -j ACCEPT
pastor@UProxy:/root/firewall$ sudo iptables-save -c | grep 130.84
[11332:7111480] -A OUTPUT -s 130.130.130.57/32 -d 130.130.130.84/32 -m 
quota --quota 23964119 -j ACCEPT
pastor@UProxy:/root/firewall$ sudo iptables-save -c | grep 130.84
[11332:7111480] -A OUTPUT -s 130.130.130.57/32 -d 130.130.130.84/32 -m 
quota --quota 28167287 -j ACCEPT
pastor@UProxy:/root/firewall$ sudo iptables-save -c | grep 130.84
[11332:7111480] -A OUTPUT -s 130.130.130.57/32 -d 130.130.130.84/32 -m 
quota --quota 28167287 -j ACCEPT

PS please don't pay attention to subnets and sorry for my english
p.f.
