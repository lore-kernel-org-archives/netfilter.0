From: Ted Roo <reject5514@gmail.com>
Subject: NAT statements in nft command documentation are misleading
Date: Sat, 28 Sep 2019 13:33:27 +0900
Message-ID: <CAFLRT63jBvUFkbUrZpd3iZSWHjAzgQ9ULdnwQ4Q8JQWNQGU6Xg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=Sw+ZZuorDN0LCkIQ8u5P3oonXIEXQpw4ZPJZzt/6Mh4=;
        b=HREJK9rDLMb5WYGplXU3C1OC64sI8WAXeRg9X+AY/KMpBpbI66qHpWs/2Qw085Xm7g
         pUkPAl8eejFfvv5tVtK0pazt8T+hpKmv4VFOcnLzT8dfkWEdq9qim+GsPbv567npyChP
         wgcXIPrKgP+TrDQWb8LDFTvyYOsC49ac1cH0QVxctAXD7sAn5iH/YgEY/9x6MRX2arsu
         66jzpX4pP2m8DPBqq8DKoUznHYYU+1UDkEh39Mjrpig0ljnkr7IvQ4nqatp1xdoN59Fg
         3vliU1Wpc1Yb4OxDawFSt3A2som5IvYZP8lxGpyDKqIw11Rc0VLHzQFaaLKYmXvFNaKY
         a2pw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,
I think the nat statements in the documentation can mislead the usage.
NAT STATEMENTS section in the documentation is like this,
           snat to address [:port] [PRF_FLAGS]
           snat to address - address [:port - port] [PRF_FLAGS]
           snat to { ip | ip6 } address - address [:port - port] [PR_FLAGS]
           dnat to address [:port] [PRF_FLAGS]
           dnat to address [:port - port] [PR_FLAGS]
           dnat to { ip | ip6 } address [:port - port] [PR_FLAGS]
           masquerade to [:port] [PRF_FLAGS]
           masquerade to [:port - port] [PRF_FLAGS]
           redirect to [:port] [PRF_FLAGS]
           redirect to [:port - port] [PRF_FLAGS]

It can misunderstand that you must append "to"  string to use the snat, dnat,
masquerade and redirect statements, even though it may not be used.
e.g.,
% nft add rule nat postrouting masquerade
% nft add rule nat prerouting redirect

I think the document should be revised. What do you think?
