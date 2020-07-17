From: Andreas Hoefler <andreas.hoefler@hitachi-powergrids.com>
Subject: RE: not able to set ct state rule
Date: Fri, 17 Jul 2020 11:49:39 +0000
Message-ID: <VI1PR06MB46392D3C591CA910427A901CC57C0@VI1PR06MB4639.eurprd06.prod.outlook.com>
References: <VI1PR06MB4639985A43150F379C316E14C57C0@VI1PR06MB4639.eurprd06.prod.outlook.com>
 <20200717113408.GT32005@breakpoint.cc>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hitachi-powergrids.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOmgqNDLRzNZcLW71CqNtmzUj94utCai1AKYiKpin6A=;
 b=SJhmlSa3H3F+Yb6/u+U3VjJyiPZh0InnrbLmO/o70OAdf9QoWYuLkEfG8s8xLSYF4ViywAj1myl2Mlf89S3JLq0qfswq9uy+66wPSUTi68GMofP3GaCvId9Hio3MIZ4QmhzHhbpkO1PYTT80NcCsKEgnpU30EyDWoAoW6cJPYHw=
In-Reply-To: <20200717113408.GT32005@breakpoint.cc>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Florian Westphal <fw@strlen.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi Florian

Hi

First of all thx for the quick reply.

#modinfo nft_ct
modinfo: ERROR: Module nft_ct not found.

Looks like all the modules are not present.
modprobe nft_ct
modprobe: FATAL: Module nft_ct not found in directory /lib/modules/4.19.94-=
rt39-g7028856b05

BR
Andy

Andreas Hoefler <andreas.hoefler@hitachi-powergrids.com> wrote:
> Hi
>
> I am trying to set up a basic connection tracking rule:
> #nft list ruleset
> table ip filter {
>         chain input {
>                 type filter hook input priority 0; policy accept;
>         }
> }
> # nft add rule filter input ct state established accept
> Error: Could not process rule: No such file or directory add rule=20
> filter input ct state established accept=20
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

works for me on 5.6.18.

> cat /proc/config.gz | gunzip | grep NFT # CONFIG_NFT_NUMGEN is not set=20
> CONFIG_NFT_CT=3Dm

Does "modinfo nft_ct" work?
If its does, is that module loaded?
If not, try to load it manually.

If that makes the rule add work, then module autoloading is broken on your =
system for some reason.
