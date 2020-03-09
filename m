From: =?UTF-8?Q?Lars_Nood=c3=a9n?= <lars.nooden@gmx.com>
Subject: Re: Found extra tables in nft ruleset
Date: Mon, 9 Mar 2020 18:31:39 +0200
Message-ID: <951a2bbe-f3b8-7f2a-4cdf-4ab4eac53db5@gmx.com>
References: <bd9702b2-0c75-96ba-24b8-b8ad05c50813@gmx.com>
 <20200306130800.GN979@breakpoint.cc>
 <06e0616d-1f87-5c2d-040b-4f9b58b9cd57@gmx.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1583771500;
        bh=Catn5g9A9TYEdETdND73q7szz1ii9QV+oXDGpbihIlg=;
        h=X-UI-Sender-Class:From:To:References:Subject:Date:In-Reply-To;
        b=TuKQEjKSsyA88xi7myj3TQD4UOypbPyiXDBN99/QPV99Oro+BptImdmWmcxN3gz5Q
         CkVuN3vp3O3ZBanaorXXqYLSbRt9d7hObIH2iSY2M3tCzHliQkCJM5d3x6osfwkCen
         orIrlhsp+Z6qTa3ZEzI2SBfQBbaKYaMCupm1HtV4=
In-Reply-To: <06e0616d-1f87-5c2d-040b-4f9b58b9cd57@gmx.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Netfilter Users List <netfilter@vger.kernel.org>

Using 'nft monitor' solved that: It appears that the extra tables were
added by iptables, which is in Raspbian Buster by default in the package
of the same name:

$ grep -i pretty /etc/os-release
PRETTY_NAME="Raspbian GNU/Linux 10 (buster)"

$ apt-cache policy iptables | head -n 3
iptables:
  Installed: 1.8.2-4
  Candidate: 1.8.2-4

iptables interferes with nft.  Uninstalling it package leaves nftables
alone to create new tables without getting extra, unasked for tables.

$ sudo nft add table ip foobar

$ sudo nft list ruleset
table ip foobar {
}

All set.  Thanks.

/Lars
