From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Failing to construct a 'set' for TCP Flag filtering.
Date: Wed, 2 Sep 2020 19:51:33 +0200
Message-ID: <20200902175133.GA5283@salvia>
References: <S1728814AbgIBQSI/20200902161835Z+839@vger.kernel.org>
 <4c39e878-8c4d-24a8-543e-206e1ca0a458@gmch.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="UugvWAfsgieZRqgk"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4c39e878-8c4d-24a8-543e-206e1ca0a458@gmch.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Chris Hall <netfilter@gmch.uk>
Cc: netfilter@vger.kernel.org


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Sep 02, 2020 at 05:44:11PM +0100, Chris Hall wrote:
> 
> I have constructed the file 'tryx' containing:
> 
> #---------------------------------------------------
> flush ruleset
> add table ip MAIN
> 
> add set ip MAIN tcp_good_flags { type tcp_flag ; flags constant ; \
> elements = {                  \
>   ( 0 | 0 | 0 |ack| 0 | 0 ),  \
>   ( 0 | 0 | 0 |ack| 0 |urg),  \
>   ( 0 | 0 | 0 |ack|psh| 0 ),  \
>   ( 0 | 0 | 0 |ack|psh|urg),  \
>   ( 0 | 0 |rst| 0 | 0 | 0 ),  \
>   ( 0 | 0 |rst|ack| 0 | 0 ),  \
>   ( 0 | 0 |rst|ack| 0 |urg),  \
>   ( 0 | 0 |rst|ack|psh| 0 ),  \
>   ( 0 | 0 |rst|ack|psh|urg),  \
>   ( 0 |syn| 0 | 0 | 0 | 0 ),  \
>   ( 0 |syn| 0 |ack| 0 | 0 ),  \
>   ( 0 |syn| 0 |ack| 0 |urg),  \
>   ( 0 |syn| 0 |ack|psh| 0 ),  \
>   ( 0 |syn| 0 |ack|psh|urg),  \
>   (fin| 0 | 0 |ack| 0 | 0 ),  \
>   (fin| 0 | 0 |ack| 0 |urg),  \
>   (fin| 0 | 0 |ack|psh| 0 ),  \
>   (fin| 0 | 0 |ack|psh|urg)   \
> } ; }
> 
> list ruleset
> #---------------------------------------------------
> 
> With a view to using this to filter out invalid combinations of TCP flags.
> 
> When I give that to nft I get:
> 
> # nft -f tryx
> table ip MAIN {
>         set tcp_good_flags {
>                 type tcp_flag
>                 flags constant
>                 elements = { ack, 0x30, 0x18, 0x38, rst,
>                              0x14, 0x34, 0x1c, 0x3c, syn,
>                              0x12, 0x32, 0x1a, 0x3a, 0x11,
>                              0x31, 0x19, 0x39 }
>         }
> }
> 
> ...which suggests that all is well so far... but it isn't.  And if I try to
> check the state of the ruleset again:
> 
> # nft list ruleset
> BUG: Unknown expression binop
> nft: mergesort.c:47: expr_msort_cmp: Assertion `0' failed.
> Aborted (core dumped)
> 
> Indeed, nothing seems to work until I 'flush ruleset' again !
> 
> Am I asking for the impossible here ?

It's a bug, I'll apply this patch to git.


--UugvWAfsgieZRqgk
Content-Type: text/x-diff; charset=utf-8
Content-Disposition: attachment; filename="x.patch"

diff --git a/src/mergesort.c b/src/mergesort.c
index 02094b486aeb..4d5bdbd414db 100644
--- a/src/mergesort.c
+++ b/src/mergesort.c
@@ -44,7 +44,15 @@ static int expr_msort_cmp(const struct expr *e1, const struct expr *e2)
 	case EXPR_MAPPING:
 		return expr_msort_cmp(e1->left, e2->left);
 	case EXPR_BINOP:
-		return expr_msort_cmp(e1->left, e2->left);
+		switch (e2->etype) {
+		case EXPR_VALUE:
+			return expr_msort_cmp(e1->left, e2);
+		case EXPR_BINOP:
+			return expr_msort_cmp(e1->left, e2->left);
+		default:
+			break;
+		}
+		/* fall through */
 	default:
 		BUG("Unknown expression %s\n", expr_name(e1));
 	}

--UugvWAfsgieZRqgk--
