From: hdemir <hdemir@metu.edu.tr>
Subject: How to get conntrack statics from proc system?
Date: Wed, 24 Jan 2018 16:27:20 +0300
Message-ID: <da49e7e6-14ae-5aca-a8f1-118fbcae6df9@metu.edu.tr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I have numa enabled system and want to get conntrack statistics. I have
tried "/proc/net/stat/nf_conntrack" file. It gaves stats for each cpu
but NEW column is always zero. "conntrack -S" also gave 0 (probably
reads from there). What can I do to get these statistics.

# conntrack -S
cpu=0   	found=0 invalid=0 ignore=281 insert=0 insert_failed=0 drop=0
early_drop=0 error=0 search_restart=22
cpu=1   	found=0 invalid=0 ignore=193 insert=0 insert_failed=0 drop=0
early_drop=0 error=0 search_restart=2
cpu=2   	found=0 invalid=0 ignore=203 insert=0 insert_failed=0 drop=0
early_drop=0 error=0 search_restart=0
cpu=3   	found=0 invalid=0 ignore=128 insert=0 insert_failed=0 drop=0
early_drop=0 error=0 search_restart=0
cpu=4   	found=0 invalid=0 ignore=43 insert=0 insert_failed=0 drop=0
early_drop=0 error=0 search_restart=0


# lnstat -f nf_conntrack
nf_connt|nf_connt|nf_connt|nf_connt|nf_connt|nf_connt|nf_connt|nf_connt|nf_connt|nf_connt|nf_connt|nf_connt|nf_connt|nf_connt|nf_connt|nf_connt|nf_connt|
 entries|searched|   found|     new| invalid|  ignore|  delete|delete_l|
 insert|insert_f|
drop|early_dr|icmp_err|expect_n|expect_c|expect_d|search_r|
        |        |        |        |        |        |        |     ist|
       |   ailed|        |      op|      or|      ew|   reate|   elete|
estart|
  441055|       0|       0|       0|103537732| 1337766|       0|
0|       0|     266|       0|       0| 2416315|       0|       0|
0| 2041986|


# uname -a
Linux  4.9.76 #1 SMP Thu Jan 11 08:56:03 +03 2018 x86_64 GNU/Linux


I have a python script to read from "conntrack -S" giving wrong values
because of that.


Thanks.

Husnu Demir


