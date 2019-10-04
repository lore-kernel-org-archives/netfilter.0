From: Matt <matt-nft@mailtower.de>
Subject: Cannot add ip6 elements to a named set
Date: Fri, 04 Oct 2019 16:55:10 +0200
Message-ID: <b99d882d69f5e152919339c65ac26163@mailtower.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 mailtower.de x94EtA9k024530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailtower.de; s=mail;
        t=1570200910; bh=013jIvh+LqB/9jBWh7jSGdfWlzox5XDvXS/CkvoBDPc=;
        h=Date:From:To:Subject:From;
        b=NqfyBU42bNpIzBmEdoUmuAKhMZcm95ueL6zZrTOJKozqrqQFPF1p4a4JbcaAkU+SD
         /MGLx/J0ugPewE+g0eJ8nvk4SPGO6x4IVnE7mWSXJbsIFT4nD+FIgNSjW/6doNUuK1
         wuGXMT0eyWyX/ABQ5JuSYbKIw6DtJDo74/lwUrPY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org, netfilter-owner@vger.kernel.org

Dear nft team,
with ip4 i can create my set and add elements no problem, sample:

table ip filter_v4 {
    set my_drop {
      type ipv4_addr;
      flags timeout
    }
  ...
  ...
}
Then adding a element to it, works all good:
# nft add set filter_v4 my_drop \{type ipv4_addr \; flags timeout \; 
elements=\{192.168.1.1 timeout 60s\} \;\}


But I would like to do the same with ip6:

table ip6 filter_v6 {
    set my_drop {
      type ipv6_addr;
      flags timeout
    }
  ...
  ...
}

However, doing the same with ipv6 doesn't work for me:
#nft add set filter_v6 my_drop \{type ipv6_addr \; flags timeout \; 
elements=\{fda5:2c8a:af4c:a95e::64 timeout 60s\} \;\}

Returns
Error: Could not process rule: No such file or directory
add set filter_v6 my_drop {type ipv6_addr ; flags timeout ; 
elements={fda5:2c8a:af4c:a95e::64 timeout 60s} ;}
         ^^^^^^^^^


Any idea whats wrong?
Thx
Matt


