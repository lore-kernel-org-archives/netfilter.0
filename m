From: my mail <amfpg@yahoo.com>
Subject: question about table filter, nat and mangle with chain default policy
Date: Sat, 11 Apr 2009 23:32:37 -0700 (PDT)
Message-ID: <549735.16160.qm@web46114.mail.sp1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1239517957; bh=cxG4WWNMv7hlttUuNBmZJ/L7eD2Tvgwx7dbkKXE9mlU=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type; b=euIbEmlnlxQ7k6urmTsJP6GjoglO0bX6kyFCU1sqmJR9DF0CMQ6e6I7Otgk4SeApkeDK8j4LJ+7jfREQ2jdsqlAQZ2yu9xsdvGR9EIcc1R5WTNKJkKt2n1HesORszoHvvWVrw07rticVXXA2RRMqqL9ARiaTqSKTjmvHoRdVnEw=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org


I have rule like this

----- rule iptables -----
# Remove any existing rules from all chains
$IPT --flush
$IPT -t nat --flush
$IPT -t mangle --flush
# Delete any user defined chains
$IPT -X
$IPT -t nat -X
$IPT -t mangle -X
# Reset default policy to ACCEPT
$IPT --policy INPUT ACCEPT
$IPT --policy OUTPUT ACCEPT
$IPT --policy FORWARD ACCEPT
$IPT -t nat --policy PREROUTING ACCEPT
$IPT -t nat --policy OUTPUT ACCEPT
$IPT -t nat --policy POSTROUTING ACCEPT
$IPT -t mangle --policy PREROUTING ACCEPT
$IPT -t mangle --policy INPUT ACCEPT
$IPT -t mangle --policy FORWARD ACCEPT
$IPT -t mangle --policy OUTPUT ACCEPT
$IPT -t mangle --policy POSTROUTING ACCEPT

# Unlimited traffic on the loopback interface
$IPT -A INPUT -i lo -j ACCEPT
$IPT -A OUTPUT -o lo -j ACCEPT

# Default policy to DROP
$IPT --policy INPUT DROP
$IPT --policy OUTPUT DROP
$IPT --policy FORWARD DROP
#$IPT -t nat --policy PREROUTING DROP
$IPT -t nat --policy OUTPUT DROP
#$IPT -t nat --policy POSTROUTING DROP
#$IPT -t mangle --policy PREROUTING DROP
#$IPT -t mangle --policy INPUT DROP
#$IPT -t mangle --policy FORWARD DROP
#$IPT -t mangle --policy OUTPUT DROP
#$IPT -t mangle --policy POSTROUTING DROP

# For SSH Connection into Firewall
$IPT -A INPUT -i $LAN_IF -p tcp --sport $SSH_PORTS -d $IPADDR --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
$IPT -A OUTPUT -o $LAN_IF -p tcp ! --syn -s $IPADDR --sport 22 --dport $SSH_PORTS -m state --state ESTABLISHED -j ACCEPT

---------- end rule --------------

this rule ok, because i can ssh-ing into this machine. But if i remove the # from default policy like this

# Default policy to DROP
$IPT --policy INPUT DROP
$IPT --policy OUTPUT DROP
$IPT --policy FORWARD DROP
$IPT -t nat --policy PREROUTING DROP
$IPT -t nat --policy OUTPUT DROP
$IPT -t nat --policy POSTROUTING DROP
$IPT -t mangle --policy PREROUTING DROP
$IPT -t mangle --policy INPUT DROP
$IPT -t mangle --policy FORWARD DROP
$IPT -t mangle --policy OUTPUT DROP
$IPT -t mangle --policy POSTROUTING DROP

i can't ssh-ing into this machine. so is the ssh using nat and mangle table to connect into this machine?
i litle bit confuse about this, why i can ssh-ing into this machine when i drop the nat and mangle table.

thx in advance for your help


      

