From: "Wang, Lihua" <lwang2@gc.cuny.edu>
Subject: nftable rule for VRRP traffic
Date: Wed, 28 Oct 2020 15:34:34 +0000
Message-ID: <9e00cb7bb2e944c981e1a9a43278aa2c@wd5b.gc.cuny.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Dear NFTables community,

We are trying to migrate from firewalld to nftables in our planned upgrade from CentOS 7 to 8. 

We run keepalived on some of our servers and we need to migrate the firewall rule that allows vrrp in and out traffic to nftables format. I googled the topic, searched nftables documentations, and tested a number of possibilities but could not find the solution.

the firewalld rules for vrrp is: 

firewall-cmd --direct --permanent --add-rule ipv4 filter INPUT 0 --in-interface ens192 --destination 224.0.0.18 --protocol vrrp -j ACCEPT
firewall-cmd --direct --permanent --add-rule ipv4 filter OUTPUT 0 --out-interface ens192 --destination 224.0.0.18 --protocol vrrp -j ACCEPT

which are similar to ipables commands:

# iptables -I INPUT -i ens192 -d 224.0.0.0/8 -p vrrp -j ACCEPT
# iptables -I OUTPUT -o ens192 -d 224.0.0.0/8 -p vrrp -j ACCEPT

Could you please kindly advise what is the equivalent in nftable command or rule formate?

Thank you very much.

Regards,

Lihua Wang
Linux admin @ CUNY Graduate Center
