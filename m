From: Bernd Naumann <bena@spreadshirt.net>
Subject: nft set elements: Comment not available for elements?
Date: Tue, 24 Sep 2019 17:58:32 +0200
Message-ID: <59dc7b2f-f771-2552-d7ef-4504336f616a@spreadshirt.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spreadshirt.net;
        s=mail; t=1569340714; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:in-reply-to:
         references; bh=OJHurrDwOMyJCjKo2NQ2Ln8H0hSiEHJ289KVCutxrxI=;
        b=oqFyRflQcpy4wjmDCAxHGncAERY5BFp/hUxPtDRG0MZ+DtlaZ6fGdFm8jtuoqiwCY4GW+o
        CplQWmeff8TKDlOvN3l+Rcj4XhOjI5wHA/WGAfgRblnDxpZtKV5ruSJJGvtKRFDNRPdAlD
        xKdlK6mJhtrsDHLrid/OmgfD+LU55IM=
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi *,

I wonder why I can not give an element of a set a comment like with the 
old `ipset`, neither via the syntax  `set my-set {}` nor by `nft add 
element filter my-set`.

The man page does mention "comment" only for the whole set.

Is this a planed feature or how do others keep /notes/ on their set entries?

To my mind comes i.e. the use-case of a set with prefixes used by a CDN 
which gets updates, removals, or addons over time, and I want i.e. 
attach a ticket-id to each element.


Another "issue" I've encountered is the parsing of comments in a config 
file when using `#` within an "elements" block:

```
# This works just fine as expected:
         set net_docu {
                 type ipv4_addr
                 flags interval
                 elements = {
                         192.0.2.0/24,
                         198.51.100.0/24,
                         203.0.113.0/24
                 }
         }

# This does not work:
# "Remove" an entry by prefixing a line with a hash-sign

     set net_docu {
             type ipv4_addr
             flags interval
             elements = {
                     192.0.2.0/24,           # Documentation (TEST-NET-1)
#                   198.51.100.0/24,        # Documentation (TEST-NET-2)
                     203.0.113.0/24          # Documentation (TEST-NET-3)
             }
     }

root@buster:~# nft -f /etc/nftables.conf
/etc/nftables.conf:60:50-50: Error: syntax error, unexpected newline, 
expecting comma or '}'
#                       198.51.100.0/24,        # Documentation (TEST-NET-2)
 
     ^
/etc/nftables.conf:61:25-35: Error: syntax error, unexpected string
                         203.0.113.0/24          # Documentation 
(TEST-NET-3)
                                                      ^^^^^^^^^^^

# This how ever works
# Prefix a line containing an unwanted element with a comma, followed by 
a spaced hash-sign
     set net_docu {
         type ipv4_addr
         flags interval
         elements = {
             192.0.2.0/24,           # Documentation (TEST-NET-1)
, #         198.51.100.0/24,        # Documentation (TEST-NET-2)
             203.0.113.0/24          # Documentation (TEST-NET-3)
         }
```


I'm using Debian Buster 4.19.0-5-amd64 with nftables 0.9.0-2.

Thanks.
Bernd

PS: I've also not found any reference for "meta-sets" like with `ipset`: 
Create a bunch of sets, and group them in a set of type 'list:set'.
