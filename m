From: carlopmart <carlopmart@gmail.com>
Subject: Using source nat to discriminate traffic
Date: Tue, 26 Apr 2011 11:07:12 +0200
Message-ID: <4DB68B40.2030806@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :subject:content-type:content-transfer-encoding;
        bh=LwVx/XxyQUGtcO4yZXK+ddkuKME3Y9sOakbgylqpklk=;
        b=ig6H9UlpczBJIw2JZUUGZ4cy7pewvUmHiuMsmnBq4sWuVky7dGmZJnV6u4qUIrimTa
         nk9iZZBpztw9HNpj2D/Y/sl4x6/cL4Qd9bpPU79PRK5AxIgPUlGZtca46IX2EQv21jMA
         btmFU1bBCLIUtmG59N68KVFT2m/3rp9GRXA+I=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi all,

  I have a problem using source nat rules to discriminate traffic on one 
host. This host has several ip aliases assigned to provide several 
services. Problem starts with mysql client. This host needs to access to 
another host that acts as MySQL server. This MySQL server has some acls 
configured to access databases, in this manner:

  - BBDD_1 can only be accessed by ip address 172.21.2.2.
  - BBDD_2 can only be accessed by ip address 172.21.2.3

  Both ip address, 172.21.2.2 and 172.21.2.3, are assigned to the first 
host that acts as a mysql client. Latest release of mysql client 
contains an option to pass --bind-ip-address, but my mysql client 
version not (and I can't do an upgrade due to a tecnical specifications).

  Then, I need to discrimanate traffic on mysql host client when it 
tries to access to mysql server. I have found a partial solution putting 
this iptables rule:

  iptables -t nat -A POSTROUTING -o eth1 -d 172.17.3.3 -p tcp --dport 
3306 -j SNAT --to-source 172.21.2.2

  This rule works ok when mysql client tries to access to BBDD_1, but 
not when it tries to access to BBDD_2 because connects with 172.21.2.2 
ip address and mysql host denies traffic.

  Another point: mysql client host principal ip address is 172.21.2.1, 
and I can't change it.

  How can I resolve this?? Is it possible??

-- 
CL Martinez
carlopmart {at} gmail {d0t} com

