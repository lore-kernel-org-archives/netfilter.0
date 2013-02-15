From: John Corps <envoys@gmail.com>
Subject: Redirecting DNS Not Working
Date: Fri, 15 Feb 2013 11:24:15 -0500
Message-ID: <CAFURDX-tc6+LgpcUhAeOE3i2=uh=bjjVaCHTGvZbO_Ty2+zV_A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=9v403BmvrqxyEYt8u9sU7bKB493yDAjGxe4xKoS9DXA=;
        b=BRMG3/LVvjThf3g9rvYe3Vanp8ZjVyKOgXu3PfLnV3X6KGvwuN+miDUluz6vrzhcCz
         OnaMt2o81uK95BlROUl/UhnPUp0NXwcdpMfqLoS956J8ssy6q2z6IAcig2GcEGgbx7sU
         BFvTr6hvSNQleoR+w5BK58p272oysxoBSeUCgGWANYKdp+1+dNj2ej1y24CxjvmQgb8x
         FHRDegbtZdd+VaAAcfa7K7S48IBA7oAyG4uFdTdJ62ti6xmUGdbBz/+FzaGHM/BjyZz6
         CFhtvzAjb9MLmbPctCigge1UNlAMsc8mA56rhZigsPnWp9XiNzutiwddtLilBDR+CczG
         X2fQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello All,

I am having issues with redirecting DNS requests to the internal dns
server. I have a very simple setup, if someone is put into vlan 1000
then they do not get internet access at all. If they keep the DNS
server assigned by DHCP, which is the IP of the gateway in vlan 1000,
every request they make to a website is resolved to this IP and served
up the webpage stating no internet is available. If they are clever
enough to set there own DNS servers, when they open a browser, they do
not get anything at all, just page can't be displayed. I have not done
anything with iptables yet as the internal dns server is just
resolving everything to the local IP address. What I want to do is if
they set there own DNS, redirect them anyways back to the internal
DNS. Here are the only 2 rules I have tried but they do not work at
all, maybe i am missing something? Any help would be greatly
appreciated!

iptables -t nat -A PREROUTING -s 192.168.1.0/24 -p tcp -m tcp --dport
53 -j REDIRECT --to-ports 53
iptables -t nat -A PREROUTING -s 192.168.1.0/24 -p udp -m udp --dport
53 -j REDIRECT --to-ports 53
