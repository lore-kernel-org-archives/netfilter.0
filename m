From: Alexander Helmer <a.helmer@internett.de>
Subject: "nft --check" not warning about missing statement in rule
Date: Mon, 16 May 2022 07:50:08 +0000
Message-ID: <C928E2C92BFA9E4DA6068EBF01B2EC27A6DE31E9@tt-05.im.internett.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=internett.de; s=20200219; h=MIME-Version:Content-Transfer-Encoding:
        Content-Type:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=yCU693Oj90fSHEwWnjxNJ/fp3AVM/W5fAh5/THjLNyI=; b=j0OaT0Rlh9/anuTQPJIjb+KEpW
        SSFJ2mMFdlRYIaf1iIuEPLmfNOai9Ay3dEEDds9NDyyz42rAG/jbE4AhQ6U2Cb7pwwoOp0MjQo9Y8
        UDakO4e2uZUT1lDFUCJ+C+HADlQtaNAXqN/VjfMVnW+ENPGhgM5R4Ufy1s3w+cKTAe4k=;
Content-Language: de-DE
List-ID: <netfilter.vger.kernel.org>
To: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

Hi everyone!

I got my first nftables-based firewall in production after many years with =
iptables. I opted to use a nft-script to manage the ruleset.=20
A small bash wrapper does some checks first and then loads the new ruleset.

One of those checks is a syntax-check with:
	"nft -c -f #path-to-ruleset-file#"

For better readability I used newlines in some rules. Unfortunately at two =
places in the 2k lines script I failed to put a '\' at the end of a line wh=
ich caused nftables to create two seperate rules instead of one.
I do not understand how nftables interpreted the rules and why nft -c did n=
ot throw an error.

Both rules looked something like this (forward chain, drop policy):

ip saddr { xxxxx } \
	ip daddr { yyyyy }  		< missing \ here
	ct state new accept;


Nftables created the rules like this:

1. ip saddr { xxxxx } ip daddr { yyyyy }
2. ct state new accept


I guess I do not have to tell u why this was catastrophic.=20

I do not understand why the first rule has is a valid rule since it does no=
t contain a statement.
"nft -c" usually found other issues in the script and even in other include=
d script-files (although the line numbers where never correct) so I assume =
it can check nft-scripts.

Is my understanding of the syntax wrong? Does a nftables rule not need a st=
atement? If so is no statement equal to the statement "continue"?
Or is nft -c not checking this case?

kind regards

Alexander
