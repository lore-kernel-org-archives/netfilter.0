From: Zheng konia <konianet@gmail.com>
Subject: nft list ruleset miss nat config information
Date: Wed, 31 May 2017 16:13:15 +0800
Message-ID: <CAG1z+7_yU2Br2eu3h3-+oTseUnKpcCfrj+rkYQpBU+QGVsnkMQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=uS7QWNrRZK3Y6WYAbcW0HIOxt0lLUJiqnjJ2zdnYB14=;
        b=pTmNlwScDp+Y2k0DXTfLkXmAxAeYCxDgz7dpObFu+beIdbKLq/OU5f3kAH4PyINzbe
         St0vBzc7n38MknPg6JchuqyR1tjhtDujeYuss9nGHwp/BQJ5Je1OGg+cK+PUMjAZ1rwF
         NBDoFcgx1hNBfk41X5B5zHGOEV/H9R5Zz+cukDXKatJVYPwdNLv75Mw61PZPKmtotF7U
         0TwwV15vp06heDjOgAsX+lJAY5AjvguL7gJtw/Vg5forbg16B4YruzswOcu6MXFk/HLI
         zs2uo6KkLbqIsmwuauafGBdD1d6lvTXuStlEc970OPbfd+ZDlvqDhYvL8rM4dM30Im1z
         KeIQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Hi,
      Refer to the wiki from this
https://wiki.nftables.org/wiki-nftables/index.php/Multiple_NATs_using_nftables_maps

     I configured the my server's nftables like this

% nft add rule nat prerouting dnat \
      tcp dport map { 1000 : 1.1.1.1, 2000 : 2.2.2.2, 3000 : 3.3.3.3} \
      : tcp dport map { 1000 : 1234, 2000 : 2345, 3000 : 3456 }


However, when I try nft list ruleset, I can't get the destination ip
addr, like 1.1.1.1 or 2.2.2.2

table ip nat {
      chain postrouting {
             type nat hook postrouting priority 100; policy accept;
}

chain prerouting {
           type nat hook prerouting priority 100; policy accept;
           dnat to :tcp dport map { 2000 : 2345, 3000 : 3456, 1000 : 1234}
   }
}


Only `2000 : 2345, 3000 : 3456, 1000 : 1234`. The detail of nat config
is missing. Not sure it is a bug or there are some command line
parameter needed to get all information.
