From: Jonathan Johnson <ecybernard@gmail.com>
Subject: errors found in nftable docs on wiki
Date: Sat, 28 Jun 2014 14:13:35 -0500
Message-ID: <CALLvB8LPbBQpGD-QAmPW3L9GT6CYZ2TAMh+E9koYBq7OWBUCkw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=7mkv0pyqaZ9UBSAwKf4ClfLpjOIHTsWNf/epAKVIwCE=;
        b=Qha4SqBuiJGPmb94GeGu31kf4bkImSOPJlDgvood8rlSKEn0F6TlBNmSH0Pe1PPn4F
         /Ai5/o5986LBE0Bw8UGTiew9hQJQlpgGFYgY4DhhvhLXvTYmCxdeQ/lHzAzu9GB8Uaub
         UCuLHavfjQlFoo79paf52nanOkO/yTqcNFxANTam2sQgTL8li1NxGL0tdooZQERQtu5g
         0+5v6T4HRNRn6h+6tk3VIxn5jHdtjDu+41Jzek6O0GJwVfy62+h5L1JUtWGNfgqJHUzV
         ZhtJZgoQMmK9IOCd3tcAJBcLHlgvWBtb3gipvkMplLMbggp9QQlkRmlhZoZ9cnAzR+8V
         tNHA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

http://wiki.nftables.org/wiki-nftables/index.php/Sets

States this works and it does not.


nft add set filter blackhole { type ipv4_address\;}

after reviewing the source code I discovered this is correct:


nft add set filter blackhole { type ipv4_addr\;}


after using the correct syntax I get this error, which I have not
troubleshooted.


I modprobed all the modules starting with nft* one at a time.


<cmdline>:1:26-42: Error: Could not add set: No such file or directory

Jonathan
