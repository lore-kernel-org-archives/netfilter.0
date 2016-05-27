From: Bernhard Thaler <bernhard.thaler@wvnet.at>
Subject: Re: set route LSRR/SSRR option by iptables or nftables
Date: Sat, 28 May 2016 00:46:35 +0200
Message-ID: <5748CE4B.60804@wvnet.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: CAP8bwDWMZ5fkxuX1T5rF-Xbe4Zn8gU0kUWqz93c=5otN2woXag@mail.gmail.com
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: zh99998@gmail.com
Cc: netfilter@vger.kernel.org

depending on your setup/requirements, you could use NFQUEUE and e.g.
python nfqueue bindings and scapy to add source routing ip options

-> use NFQUEUE target in OUTPUT or POSTROUTING chain to send packets of
your choosing to a queue
-> write a python program
-> use nfqueue bindings to receive packets from queue
(https://www.wzdftpd.net/blog/nfqueue-bindings.html)
-> use scapy (http://www.secdev.org/projects/scapy/) to add IP Options
and LSRR/SSRR and update the packet

have a look here for some examples:
-> https://5d4a.wordpress.com/2011/08/25/having-fun-with-nfqueue-and-scapy/
-> http://allievi.sssup.it/techblog/archives/631
