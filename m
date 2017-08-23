From: J Doe <general@nativemethods.com>
Subject: Stateful objects and nft version
Date: Wed, 23 Aug 2017 13:42:52 -0400
Message-ID: <67518BA9-3A7F-4F93-A64F-80FFA3AD970F@nativemethods.com>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I have a question regarding the nftables wiki.  Under the "Stateful objects" section [1], it states that "nft v0.8 nftables supports stateful objects".  When I checked out nftables from Git and built it this week, however, I had an nft version of 0.7.

$ nft -v
nftables v0.7 (Scrooge McDuck)

Am I correct that this feature is therefore forthcoming at this time ?

Thanks,

- J

Sources:
[1]  wiki.nftables.org/wiki-nftables/index.php/Stateful_objects

