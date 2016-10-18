From: Florian Westphal <fw@strlen.de>
Subject: Re: IPSec, masquerade and dnat with nftables
Date: Tue, 18 Oct 2016 10:59:57 +0200
Message-ID: <20161018085957.GC29405@breakpoint.cc>
References: <8737l9mu0c.fsf@ilexius.de>
 <20161017194405.GH24375@salvia>
 <ad567cf1-6c48-d367-1b99-9973bf08319b@familie-kuntze.de>
 <20161017201149.GB7690@salvia>
 <324a4f79-5207-6517-3cc0-49a6c2323bb0@familie-kuntze.de>
 <20161017202712.GA8529@salvia>
 <83a41f9a-608e-8c46-59b7-5a2b5af8032d@familie-kuntze.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <83a41f9a-608e-8c46-59b7-5a2b5af8032d@familie-kuntze.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Noel Kuntze <noel@familie-kuntze.de>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Thomas Bach <t.bach@ilexius.de>, netfilter@vger.kernel.org, fw@strlen.de

Noel Kuntze <noel@familie-kuntze.de> wrote:
> On 17.10.2016 22:27, Pablo Neira Ayuso wrote:
[..]

> > Allowing to match if the packet is protected/unprotected in a
> > true/false fashion.
>
> Well, I am active in the strongSwan community, so I believe I've seen all the
> use cases there are and I've seen uses of every option, except "--next" and "--strict".
> But I think there are probably use cases where they are used as well.

Ok.  I still believe that 'meta secpath' makes sense as a more simple
alternative, I think most users are just interested in 'was this packet
ipsec protected' rather than doing the full policy option dance.

Wrt. -m policy in nftables, we have two different cases:

1. Check if a given daddr/saddr/spi etc is listed in *any* of the policies.
2. Check if a given policy contains the exact spi/daddr/saddr.

As first rfc, what about the below syntax?

It adds one expression (to load a given policy element into a register)
and one statement (to search policies for a given number/address).

add rule filter input xfrm policy direction original 0 spi eq 1

would take input policies, grab first one (policy[0]), get its spi and
place it into a register (i.e., the 'eq 1' is not part of the xfrm
expression, only 'spi' is passed as key so we know what to look for).

Chaining these would allow the strict mode matching, but as you might
imagine it would be quite bloated to do exact matching :-/

Statement would look like this:
add rule filter input xfrm policy direction original spi 1

... it would search all input policies for spi 1.
(i.e., 1 is passed as immediate value to the xfrm expression).

Thoughts?
Does anyone see a -m policy case that we could not cover with this?

diff --git a/src/parser_bison.y b/src/parser_bison.y
--- a/src/parser_bison.y
+++ b/src/parser_bison.y
@@ -420,6 +420,10 @@ static void location_update(struct location *loc, struct location *rhs, int n)
 %token XML			"xml"
 %token JSON			"json"
 
+%token XFRM			"xfrm"
+%token MODE			"mode"
+%token REQID			"reqid"
+
 %type <string>			identifier type_identifier string comment_spec
 %destructor { xfree($$); }	identifier type_identifier string comment_spec
 
@@ -600,6 +604,12 @@ static void location_update(struct location *loc, struct location *rhs, int n)
 %destructor { xfree($$); }	monitor_event
 %type <val>			monitor_object	monitor_format
 
+%type <val>			policy_type
+%type <expr>			policy_expr
+%type <stmt>			policy_stmt
+%destructor { expr_free($$); }	policy_expr
+%destructor { stmt_free($$); }	policy_stmt
+
 %%
 
 input			:	/* empty */
@@ -1396,6 +1406,7 @@ stmt			:	verdict_stmt
 			|	dup_stmt
 			|	fwd_stmt
 			|	set_stmt
+			|	policy_stmt
 			;
 
 verdict_stmt		:	verdict_expr
@@ -1983,6 +1994,7 @@ primary_expr		:	symbol_expr			{ $$ = $1; }
 			|	ct_expr				{ $$ = $1; }
 			|	numgen_expr			{ $$ = $1; }
 			|	hash_expr			{ $$ = $1; }
+			|	policy_expr			{ $$ = $1; }
 			|	'('	basic_expr	')'	{ $$ = $2; }
 			;
 
@@ -2480,6 +2492,49 @@ numgen_expr		:	NUMGEN	numgen_type	MOD	NUM
 			}
 			;
 
+policy_expr		:	XFRM	POLICY	DIRECTION	STRING	NUM	policy_type
+			{
+				struct error_record *erec;
+				int8_t direction;
+
+				erec = ct_dir_parse(&@$, $4, &direction);
+				if (erec != NULL) {
+					erec_queue(erec, state->msgs);
+					YYERROR;
+				}
+#if 0
+				$5 = which policy header in pol[] array
+				$6: what elem of policy 'header'
+#endif
+				$$ = meta_expr_alloc(&@$, 1);
+			}
+			;
+
+policy_stmt		: XFRM	POLICY	DIRECTION	STRING		policy_type	integer_expr
+			{
+				struct error_record *erec;
+				int8_t direction;
+
+				erec = ct_dir_parse(&@$, $4, &direction);
+				if (erec != NULL) {
+					erec_queue(erec, state->msgs);
+					YYERROR;
+				}
+#if 0
+				$5: what elem of policy 'header' to check against
+#endif
+				$$ = meta_stmt_alloc(&@$, 2, $6);
+			}
+			;
+
+policy_type		:	SPI	{ $$ = 1; }
+			|	REQID   { $$ = 2; }
+			|	PROTOCOL { $$ = 3; }
+			|	MODE  { $$ = 4; }
+			|	SADDR { $$ = 5; }
+			|	DADDR { $$ = 6; }
+			;
+
 hash_expr		:	JHASH	expr	MOD	NUM	SEED	NUM
 			{
 				$$ = hash_expr_alloc(&@$, $4, $6);
diff --git a/src/scanner.l b/src/scanner.l
index 8b5a383bd095..c18003459a12 100644
--- a/src/scanner.l
+++ b/src/scanner.l
@@ -480,6 +480,11 @@ addrstring	({macaddr}|{ip4addr}|{ip6addr})
 "xml"			{ return XML; }
 "json"			{ return JSON; }
 
+
+"mode"			{ return MODE; }
+"reqid"			{ return REQID; }
+"xfrm"			{ return XFRM; }
+
 {addrstring}		{
 				yylval->string = xstrdup(yytext);
 				return STRING;
