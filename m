From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Unable to create a chain called "trace"
Date: Fri, 12 Feb 2021 18:09:21 +0100
Message-ID: <20210212170921.GA1119@salvia>
References: <CANf9dFMJN5ZsihtygUnEWB_9T=WLbEHrZY1a5mTqLgN7J39D5w@mail.gmail.com>
 <20210208154915.GF16570@breakpoint.cc>
 <20210208164750.GM3158@orbyte.nwl.cc>
 <20210208171444.GH16570@breakpoint.cc>
 <20210209135625.GN3158@orbyte.nwl.cc>
 <20210212000507.GD2766@breakpoint.cc>
 <20210212114042.GZ3158@orbyte.nwl.cc>
 <20210212122007.GE2766@breakpoint.cc>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="C7zPtVaVf+AK4Oqc"
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20210212122007.GE2766@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
To: Florian Westphal <fw@strlen.de>
Cc: Phil Sutter <phil@nwl.cc>, Martin Gignac <martin.gignac@gmail.com>, netfilter@vger.kernel.org, netfilter-devel <netfilter-devel@vger.kernel.org>


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Feb 12, 2021 at 01:20:07PM +0100, Florian Westphal wrote:
> Phil Sutter <phil@nwl.cc> wrote:
> > I didn't find a better way to conditionally parse two following args as
> > strings instead of just a single one. Basically I miss an explicit end
> > condition from which to call BEGIN(0).
> 
> Yes, thats part of the problem.
> 
> > > Seems we need allow "{" for "*" and then count the {} nests so
> > > we can pop off a scanner state stack once we make it back to the
> > > same } level that we had at the last state switch.
> > 
> > What is the problem?
> 
> Detect when we need to exit the current start condition.
> 
> We may not even be able to do BEGIN(0) if we have multiple, nested
> start conditionals. flex supports start condition stacks, but that
> still leaves the exit/closure issue.
> 
> Example:
> 
> table chain {
>  chain bla {  /* should start to recognize rules, but
> 		 we did not see 'rule' keyword */
> 	ip saddr { ... } /* can't exit rule start condition on } ... */
> 	ip daddr { ... }
>  }  /* should disable rule keywords again */
> 
>  chain dynamic { /* so 'dynamic' is a string here ... */
>  }
> }
> 
> I don't see a solution, perhaps add dummy bison rule(s)
> to explicitly signal closure of e.g. a rule context?

It should also be possible to add an explicit rule to allow for
keywords to be used as table/chain/... identifier.

It should be possible to add a test script in the infrastructure to
create table/chain/... using keywords, to make sure this does not
break.

It's not nice, but it's simple and we don't mingle with flex.

I have attached an example patchset (see patch 2/2), it's incomplete.
I could also have a look at adding such regression test.

--C7zPtVaVf+AK4Oqc
Content-Type: text/x-diff; charset=utf-8
Content-Disposition: attachment; filename="0001-parser_bison-rename-chain_identifier-to-chain_block_.patch"

From 84ee11474385fe67f551486c9bbcc94e387ba927 Mon Sep 17 00:00:00 2001
From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Fri, 12 Feb 2021 17:59:29 +0100
Subject: [PATCH 1/2] parser_bison: rename chain_identifier to
 chain_block_identifier

Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
---
 src/parser_bison.y | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/src/parser_bison.y b/src/parser_bison.y
index 11e899ff2f20..825f134c33ff 100644
--- a/src/parser_bison.y
+++ b/src/parser_bison.y
@@ -588,8 +588,8 @@ int nft_lex(void *, void *, void *);
 %type <cmd>			base_cmd add_cmd replace_cmd create_cmd insert_cmd delete_cmd get_cmd list_cmd reset_cmd flush_cmd rename_cmd export_cmd monitor_cmd describe_cmd import_cmd
 %destructor { cmd_free($$); }	base_cmd add_cmd replace_cmd create_cmd insert_cmd delete_cmd get_cmd list_cmd reset_cmd flush_cmd rename_cmd export_cmd monitor_cmd describe_cmd import_cmd
 
-%type <handle>			table_spec tableid_spec chain_spec chainid_spec flowtable_spec chain_identifier ruleid_spec handle_spec position_spec rule_position ruleset_spec index_spec
-%destructor { handle_free(&$$); } table_spec tableid_spec chain_spec chainid_spec flowtable_spec chain_identifier ruleid_spec handle_spec position_spec rule_position ruleset_spec index_spec
+%type <handle>			table_spec tableid_spec chain_spec chainid_spec flowtable_spec chain_block_identifier ruleid_spec handle_spec position_spec rule_position ruleset_spec index_spec
+%destructor { handle_free(&$$); } table_spec tableid_spec chain_spec chainid_spec flowtable_spec chain_block_identifier ruleid_spec handle_spec position_spec rule_position ruleset_spec index_spec
 %type <handle>			set_spec setid_spec set_identifier flowtableid_spec flowtable_identifier obj_spec objid_spec obj_identifier
 %destructor { handle_free(&$$); } set_spec setid_spec set_identifier flowtableid_spec obj_spec objid_spec obj_identifier
 %type <val>			family_spec family_spec_explicit
@@ -1576,7 +1576,7 @@ table_block		:	/* empty */	{ $$ = $<table>-1; }
 			|	table_block	common_block
 			|	table_block	stmt_separator
 			|	table_block	table_options	stmt_separator
-			|	table_block	CHAIN		chain_identifier
+			|	table_block	CHAIN		chain_block_identifier
 					chain_block_alloc	'{' 	chain_block	'}'
 					stmt_separator
 			{
@@ -2463,7 +2463,7 @@ chainid_spec 		: 	table_spec 	HANDLE NUM
 			}
 			;
 
-chain_identifier	:	identifier
+chain_block_identifier	:	identifier
 			{
 				memset(&$$, 0, sizeof($$));
 				$$.chain.name		= $1;
-- 
2.20.1


--C7zPtVaVf+AK4Oqc
Content-Type: text/x-diff; charset=utf-8
Content-Disposition: attachment; filename="0002-parser_bison-allow-for-keywords-to-be-used-as-table-.patch"

From f77efb5f662d24c03bf2ef5fd0bca0345dd3054c Mon Sep 17 00:00:00 2001
From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Fri, 12 Feb 2021 18:02:04 +0100
Subject: [PATCH 2/2] parser_bison: allow for keywords to be used as table and
 chain identifiers

Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
---
 src/parser_bison.y | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/src/parser_bison.y b/src/parser_bison.y
index 825f134c33ff..9937bd511c6e 100644
--- a/src/parser_bison.y
+++ b/src/parser_bison.y
@@ -574,8 +574,8 @@ int nft_lex(void *, void *, void *);
 %token IN			"in"
 %token OUT			"out"
 
-%type <string>			identifier type_identifier string comment_spec
-%destructor { xfree($$); }	identifier type_identifier string comment_spec
+%type <string>			identifier type_identifier string comment_spec table_identifier chain_identifier keyword_identifier
+%destructor { xfree($$); }	identifier type_identifier string comment_spec table_identifier chain_identifier keyword_identifier
 
 %type <val>			time_spec quota_used
 
@@ -2429,7 +2429,14 @@ family_spec_explicit	:	IP		{ $$ = NFPROTO_IPV4; }
 			|	NETDEV		{ $$ = NFPROTO_NETDEV; }
 			;
 
-table_spec		:	family_spec	identifier
+keyword_identifier	:	DYNAMIC		{ $$ = xstrdup("dynamic"); }
+			;
+
+table_identifier	:	STRING
+			|	keyword_identifier
+			;
+
+table_spec		:	family_spec	table_identifier
 			{
 				memset(&$$, 0, sizeof($$));
 				$$.family	= $1;
@@ -2447,7 +2454,7 @@ tableid_spec 		: 	family_spec 	HANDLE NUM
 			}
 			;
 
-chain_spec		:	table_spec	identifier
+chain_spec		:	table_spec	chain_identifier
 			{
 				$$		= $1;
 				$$.chain.name	= $2;
@@ -2463,7 +2470,11 @@ chainid_spec 		: 	table_spec 	HANDLE NUM
 			}
 			;
 
-chain_block_identifier	:	identifier
+chain_identifier	:	STRING
+			|	keyword_identifier
+			;
+
+chain_block_identifier	:	chain_identifier
 			{
 				memset(&$$, 0, sizeof($$));
 				$$.chain.name		= $1;
-- 
2.20.1


--C7zPtVaVf+AK4Oqc--
