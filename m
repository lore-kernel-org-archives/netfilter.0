From: Edoardo Panfili <edoardo@aspix.it>
Subject: Can't see IP address for a redirection in nft list table output
Date: Sun, 19 Mar 2017 17:15:49 +0100
Message-ID: <8c8f6c53-7f9a-a74a-9c72-0cabf907f744@aspix.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=LsoQEA/UnmBVW438xYEsSunW8VhgceiDt7fjA0K7uJ4=;
        b=FMAsE7ry8CAmYOKJDZdT1EvKEL+LCdMYfR5Ff/MoMmR3uLMFa7YmhPvwJNjy1kovrU
         DPMsqTNQ/2RlytPHokWOiXBe69RO87HYHX4+vNhE2GL9xgbnqGND+7rCHm/gTWgABdw/
         jy700d1R+uSdRW/0vq2bjEtbXUsORH4m0DyLjz9pMgzVEQdc62S3UYojDahh0dgFrREl
         o3J7Qwjd08Oma8DDXKXNJfJzK8CAA7//HOFrUIsHAf/Z7U4DQyL8rEBXpUAdIHU/faJZ
         ZU/rJSgOlj+NSOaGHKlVVR6ZCkBLPqhg8FlXEHsWSptqP6sftYIApBZjj2s3KgLFIrMV
         TyMA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

I need to redirect incoming traffict to two different servers
and all works fine using the following commands:
-----
nft add table portForward
nft add chain portForward prerouting { type nat hook prerouting priority 
0 \; }
nft add chain portForward postrouting { type nat hook postrouting 
priority 100 \; }
nft add rule portForward prerouting dnat tcp dport map \
{ 8888 : 192.168.2.3} : tcp dport map { 8888 : 80 }
nft add rule portForward prerouting dnat tcp dport map \
{ 9999 : 192.168.2.4} : tcp dport map { 9999 : 8080 }
-----

but when I try to inspect the table using
# nft list table portForward
the output is:
-----
table ip portForward {
   chain prerouting {
     type nat hook prerouting priority 0; policy accept;
     dnat to :tcp dport map { 8888 : http}
     dnat to :tcp dport map { 9999 : http-alt}
   }

   chain postrouting {
     type nat hook postrouting priority 100; policy accept;
   }
}
-----
I can't see the IP of the two different servers and if I use it
as input for "nft -f" this is the output

x:4:26-53: Error: transport protocol mapping is only valid after 
transport protocol match
dnat to :tcp dport map { 8888 : http}
~~~~     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^

my environment is Debian Stretch with:
$ nft -v
nftables v0.7 (Scrooge McDuck)
$ uname -a
Linux elrond 4.9.0-2-686-pae #1 SMP Debian 4.9.13-1 (2017-02-27) i686 
GNU/Linux

the same happens using kernel 4.10 from experimental.

How can I obtain the differen IPs in the output of nft list table?

thank you
Edoardo
