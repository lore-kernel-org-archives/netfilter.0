From: Fatih USTA <fatihusta86@gmail.com>
Subject: per source bandwidth limit with hashlimit
Date: Tue, 7 Mar 2017 15:47:04 +0300
Message-ID: <15d4f6da-0004-e2d3-5380-11fb2131ba48@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=TyPFw/ajOzclDjmGUM/trvdz0+wset46TM9kStRZGz8=;
        b=ICZB7GX9WDBxE0yTjj1luqhNUmosuBk3jQNMW+1GJwHYbJW2Z0Z3Hf6f20zNhTVsbj
         ZDKhI6+7zp9zJ8TUOxVs59gwQYlnpw+OrFI0v3/PKht8sITVUc18rGdDDKoxmWatMxWO
         j7hE6XW/Lj1aoou5jwP19CDiGLQfkhfnqqrFaV0QUGfdSIlVwFZjJDsWNJiLsj5wuejl
         vQphA/RSpEs4qxYq/7ISy4nkP19qkWMmD7BDHQJVQMvFJIFK1qGotrG/XOPurL9Navsl
         bpkvgxbNr/765bmNBNvlPrAjuREm/JrVeUDytEYieoSqvoZLRGDos81fsEkkmdh1z9yL
         5TuQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi

I tried to use hashlimit to limit the bandwidth, for each ip address on 
the 192.168.59.0/24 network. But did not work specified network address 
or protocol.

[~]# uname -r
4.4.0-64-generic

[~]# iptables -V
iptables v1.6.0

[~]# lsmod | grep -i hashlimit
xt_hashlimit           20480  2
x_tables               36864  6 
ip_tables,xt_tcpudp,xt_nat,xt_hashlimit,iptable_filter,iptable_mangle



This command working. With tcp protocol

iptables -t mangle -I PREROUTING -m tcp -p tcp -m hashlimit 
--hashlimit-above 50kb/sec --hashlimit-burst 50kb --hashlimit-mode srcip 
--hashlimit-name persource -j DROP
iptables -t mangle -A PREROUTING -j RETURN


This commands not working.

without tcp protocol

iptables -t mangle -I PREROUTING -m hashlimit --hashlimit-above 50kb/sec 
--hashlimit-burst 50kb --hashlimit-mode srcip --hashlimit-name persource 
-j DROP
iptables -t mangle -A PREROUTING -j RETURN

or with udp protocol

iptables -t mangle -I PREROUTING -m udp -p udp  -m hashlimit 
--hashlimit-above 50kb/sec --hashlimit-burst 50kb --hashlimit-mode srcip 
--hashlimit-name persource -j DROP
iptables -t mangle -A PREROUTING -j RETURN

or not working with source network

iptables -t mangle -I PREROUTING -s 192.168.59.0/24 -p tcp -m tcp -m 
hashlimit --hashlimit-above 50kb/sec --hashlimit-burst 50kb 
--hashlimit-mode srcip --hashlimit-name persource -j DROP
iptables -t mangle -A PREROUTING -j RETURN

and with hashlimit-srcmask

iptables -t mangle -I PREROUTING -s 192.168.59.0/24 -p tcp -m tcp -m 
hashlimit --hashlimit-srcmask 32 --hashlimit-above 50kb/sec 
--hashlimit-burst 50kb --hashlimit-mode srcip --hashlimit-name persource 
-j DROP
iptables -t mangle -A PREROUTING -j RETURN


Do you have any idea this case?

Thanks.


-- 
Fatih USTA

