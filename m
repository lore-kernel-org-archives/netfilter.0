From: Daniel <tech@tootai.net>
Subject: Error: conflicting intervals specified - Bullseye 0.9.8
Date: Wed, 8 Sep 2021 11:33:02 +0200
Message-ID: <ab060c71-e640-a67e-347f-60cd1d800932@tootai.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1631093583; bh=3NRqRJYier9+Xx8OJqf0cxxYOP3zGVu2bDvZ7gj09ws=;
        h=To:From:Subject:Date:From;
        b=oogL3oMOJmSmDa7QBJDpvsg6tLERn0jrMoDIulbSKFzQOVOqm0SFKxJd6qOgAORJS
         ngRo46T7oq4vT+pikGNLhMKDBLyK3w5Lu+zRSLoFMblviRLehZRU2U8uwvD8FGjdHu
         sANN0qGzNjaUmPZQc+2gTxJ1U5Hm/O0ZUEbrgTVU=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1631093583; bh=3NRqRJYier9+Xx8OJqf0cxxYOP3zGVu2bDvZ7gj09ws=;
        h=To:From:Subject:Date:From;
        b=oogL3oMOJmSmDa7QBJDpvsg6tLERn0jrMoDIulbSKFzQOVOqm0SFKxJd6qOgAORJS
         ngRo46T7oq4vT+pikGNLhMKDBLyK3w5Lu+zRSLoFMblviRLehZRU2U8uwvD8FGjdHu
         sANN0qGzNjaUmPZQc+2gTxJ1U5Hm/O0ZUEbrgTVU=
Content-Language: fr-FR
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter list <netfilter@vger.kernel.org>

Hi,

I get the following error with the above nft version, lan being the 
interface name:

add element ip6 nat fwdtoip_tcp.lan { 1-65534 : 2001:db8:27b:10:ff9b::, 
1-65534 : 2001:db8:27b:ff9b::c0a8:ad1}

with

add map ipv6_addr nat fwdtoip_tcp.lan { type inet_service : ipv6_addr\; 
flags interval\; }

What's wrong here ? My goal being to redirect all (or range ports) 
external traffic to another server.

Thanks for any hint
-- 
Daniel
