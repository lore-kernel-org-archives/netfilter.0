From: Nathan Wagner <nw@hydaspes.if.org>
Subject: nft list empty
Date: Tue, 26 Oct 2021 19:28:00 +0000
Message-ID: <YXhWwPas9vnN2XDi@granicus.if.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

For some reason, 'nft list ...' doesn't seem to print anything out.
A nft create table seems to create the table, but other than an
error if I try to create it again, I don't have any way to tell.

I am probably missing something, but I have looked around and
don't see what it could be.  I worked up a script to reproduce
the issue, the output of which is below.

What is especially puzzling is that a 'list ruleset' within the same
nft process shows output, so it's like nft just isn't committing the
changes for some reason.  Except that doing two creates in a row
generates an error that I interpret to mean that the table already
exists.  This also implies that the table create persisted across
separate nft processes.

Finally and separately, I tried doing an 'echo list ruleset | nft -f -'
and it errors out with a missing /dev/stdin.  Ok, my /dev filesystem is
probably broken, but why is it trying to open /dev/stdin in the first
place instead of just reading from fd 0?  I imagine that somewhere
there's the equivalent of an "if filename = '-' then filename =
'/dev/stdin' and then it goes through the same process it uses for named
files.  I'd do this the other way around.

+ uname -r
4.15.10-2-zoranix
+ lsmod
+ grep nf
nft_set_rbtree         16384  0
nft_set_hash           24576  0
nft_set_bitmap         16384  0
nft_reject             16384  0
nft_counter            16384  0
nf_tables_inet         16384  0
nf_tables_ipv6         16384  1 nf_tables_inet
nf_tables_ipv4         16384  5 nf_tables_inet
nf_tables              94208  8 nft_set_bitmap,nft_reject,nft_set_hash,nf_tables_ipv6,nf_tables_ipv4,nft_set_rbtree,nft_counter,nf_tables_inet
configs                45056  0
+ nft flush ruleset
+ nft list ruleset
+ nft create table ip filter
+ nft list ruleset
+ nft create table ip filter
Error: Could not process rule: File exists
create table ip filter
^^^^^^^^^^^^^^^^^^^^^^^
+ cat new/bare
#!/usr/sbin/nft -f

flush ruleset

table ip filter {
   chain input { type filter hook input priority 0; policy accept; }
   chain forward { type filter hook forward priority 0; policy accept; }
   chain output { type filter hook output priority 0; policy accept; }
}

list ruleset
+ /usr/sbin/nft -f new/bare
table ip filter {
	chain input {
		type filter hook input priority filter; policy accept;
	}

	chain forward {
		type filter hook forward priority filter; policy accept;
	}

	chain output {
		type filter hook output priority filter; policy accept;
	}
}
+ nft list ruleset
+ echo flush ruleset
+ /usr/sbin/nft -f -
internal:0:0-0: Error: Could not open file "/dev/stdin": No such file or directory

-- 
nw
