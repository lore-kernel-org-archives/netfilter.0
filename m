From: "Mihamina Rakotomandimby (R12y)" <mihamina@lab.vectoris.fr>
Subject: mask 10 -> 29
Date: Wed, 15 Apr 2009 18:59:11 +0300
Message-ID: <49E6044F.5070305@lab.vectoris.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,
I have this kind of shell script in order to set something on a bunch of IP 
addresses:

for ACCEPTED_MACHINE in \
     192.168.0.10 \
     192.168.0.11 \
     192.168.0.12 \
     192.168.0.13 \
     192.168.0.14 \
     192.168.0.15 \
     192.168.0.16 \
     192.168.0.17 \
     192.168.0.18 \
     192.168.0.19 \
     192.168.0.20 \
     192.168.0.21 \
     192.168.0.22 \
     192.168.0.23 \
     192.168.0.24 \
     192.168.0.25 \
     192.168.0.26 \
     192.168.0.27 \
     192.168.0.28 \
     192.168.0.29
do
$IPTABLES [...]
done


How could I use a mask such as 192.168.0.0/NN to exactly match the list?
Thank you.

-- 
                              Chef de projet chez Vectoris
                                  Phone: +261 33 11 207 36
System: xUbuntu 8.10 with almost all from package install
    http://www.google.com/search?q=mihamina+rakotomandimby
