From: Anton Rieger <rieger@jikken.de>
Subject: Intermix ip,ip6 saddr
Date: Wed, 25 Sep 2019 13:54:52 +0200
Message-ID: <20190925115451.ozhdsoykkkmdxnch@nisshoku>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=jikken.de;
        s=Mv0BmWWr5KBeokdR; t=1569412495;
        bh=C4q+BZTe1ZMkj/1fPBk+Fo1emD6FCNXyY5o7XhDirJA=;
        h=Date:From:To:Subject;
        b=t9Pj03E3LIP+u5+/s73yV0Ox5kzRdV9KQ+HunXf560dZbyWU9H5EK7bnaAqFBdeab
         FBrACzHfH8d1ui5onAOTgoC9JQ40kT4alhdlmmyt/ImjNXZHv4nVyvjoFE+pKJ7Wp8
         24kXpOwYAbF3QzdilgLhLhHZc92O9505yhX1WltM=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi there,

I'm trying to figure out the best way to apply a rule on a set of IP and IPv4 ranges.
My current workaround is to do the following:

RULE jump customnet

chain customnet {
  ip saddr {192.0.2.0/24, 198.51.100.0/24} drop
  ip6 saddr {2001:DB8:4::/48, 2001:DB8:7::/48} drop
}


I think it might be possible to do this somehow with maps and meta nfproto expressions.

BTW:
It would be nice to have an ip4 alias to better match ip6/ip rules.
Also resetting the default address family might be useful.
For example I'm using more ip6 and inet than ip.

Thank you,
Anton
