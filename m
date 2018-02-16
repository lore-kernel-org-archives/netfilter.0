From: "Philip Prindeville" <philipp@redfish-solutions.com>
Subject: [PATCH v1 1/1] geoip: store database in network byte order
Date: Fri, 16 Feb 2018 08:29:14 -0700
Message-ID: <20180216152914.12187-1-philipp@redfish-solutions.com>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: Philip Prindeville <philipp@redfish-solutions.com>

From: Philip Prindeville <philipp@redfish-solutions.com>

This allows a single database to be built and distributed as a
package that's accepted by both big- and little-endian hosts.

Signed-off-by: Philip Prindeville <philipp@redfish-solutions.com>
---
 extensions/libxt_geoip.c | 77 +++++++++++++++++++++++++++++++++++------
 geoip/xt_geoip_build     | 89 ++++++++----------------------------------------
 2 files changed, 82 insertions(+), 84 deletions(-)

diff --git a/extensions/libxt_geoip.c b/extensions/libxt_geoip.c
index ecc78014a097bc352560bd62aa6a2066e34619f3..44e2dfd4c16be360aa493d965a52ea419706e1df 100644
--- a/extensions/libxt_geoip.c
+++ b/extensions/libxt_geoip.c
@@ -49,6 +49,46 @@ static struct option geoip_opts[] = {
 	{NULL},
 };
 
+#if __BYTE_ORDER == _LITTLE_ENDIAN
+static inline void
+geoip_swap_le16(uint16_t *buf)
+{
+	unsigned char *p = (unsigned char *)buf;
+	uint16_t n;
+
+	n = p[0] + (p[1] << 8);
+
+	p[0] = (n >> 8) & 0xff;
+	p[1] = n & 0xff;
+}
+
+static void geoip_swap_in6(struct in6_addr *in6)
+{
+	geoip_swap_le16(&in6->s6_addr16[0]);
+	geoip_swap_le16(&in6->s6_addr16[1]);
+	geoip_swap_le16(&in6->s6_addr16[2]);
+	geoip_swap_le16(&in6->s6_addr16[3]);
+	geoip_swap_le16(&in6->s6_addr16[4]);
+	geoip_swap_le16(&in6->s6_addr16[5]);
+	geoip_swap_le16(&in6->s6_addr16[6]);
+	geoip_swap_le16(&in6->s6_addr16[7]);
+}
+
+static inline void
+geoip_swap_le32(uint32_t *buf)
+{
+	unsigned char *p = (unsigned char *)buf;
+	uint32_t n;
+
+	n = p[0] + (p[1] << 8) + (p[2] << 16) + (p[3] << 24);
+
+	p[0] = (n >> 24) & 0xff;
+	p[1] = (n >> 16) & 0xff;
+	p[2] = (n >> 8) & 0xff;
+	p[3] = n & 0xff;
+}
+#endif
+
 static void *
 geoip_get_subnets(const char *code, uint32_t *count, uint8_t nfproto)
 {
@@ -56,20 +96,15 @@ geoip_get_subnets(const char *code, uint32_t *count, uint8_t nfproto)
 	struct stat sb;
 	char buf[256];
 	int fd;
+#if __BYTE_ORDER == _LITTLE_ENDIAN
+	unsigned n;
+#endif
 
 	/* Use simple integer vector files */
 	if (nfproto == NFPROTO_IPV6) {
-#if __BYTE_ORDER == _BIG_ENDIAN
-		snprintf(buf, sizeof(buf), GEOIP_DB_DIR "/BE/%s.iv6", code);
-#else
-		snprintf(buf, sizeof(buf), GEOIP_DB_DIR "/LE/%s.iv6", code);
-#endif
+		snprintf(buf, sizeof(buf), GEOIP_DB_DIR "/%s.iv6", code);
 	} else {
-#if __BYTE_ORDER == _BIG_ENDIAN
-		snprintf(buf, sizeof(buf), GEOIP_DB_DIR "/BE/%s.iv4", code);
-#else
-		snprintf(buf, sizeof(buf), GEOIP_DB_DIR "/LE/%s.iv4", code);
-#endif
+		snprintf(buf, sizeof(buf), GEOIP_DB_DIR "/%s.iv4", code);
 	}
 
 	if ((fd = open(buf, O_RDONLY)) < 0) {
@@ -98,6 +133,28 @@ geoip_get_subnets(const char *code, uint32_t *count, uint8_t nfproto)
 		xtables_error(OTHER_PROBLEM, "geoip: insufficient memory");
 	read(fd, subnets, sb.st_size);
 	close(fd);
+
+#if __BYTE_ORDER == _LITTLE_ENDIAN
+	for (n = 0; n < *count; ++n) {
+		switch (nfproto) {
+		case NFPROTO_IPV6:
+			{
+				struct geoip_subnet6 *gs6 = &(((struct geoip_subnet6 *)subnets)[n]);
+				geoip_swap_in6(&gs6->begin);
+				geoip_swap_in6(&gs6->end);
+				break;
+			}
+		case NFPROTO_IPV4:
+			{
+				struct geoip_subnet4 *gs4 = &(((struct geoip_subnet4 *)subnets)[n]);
+				geoip_swap_le32(&gs4->begin);
+				geoip_swap_le32(&gs4->end);
+				break;
+			}
+		}
+	}
+#endif
+
 	return subnets;
 }
 
diff --git a/geoip/xt_geoip_build b/geoip/xt_geoip_build
index fdd9fe95efb61e369a3b57e457700f4504616f03..871c94befbd4f5d8ac9450ad8366c020b7abbd03 100755
--- a/geoip/xt_geoip_build
+++ b/geoip/xt_geoip_build
@@ -8,51 +8,22 @@ use IO::Handle;
 use Text::CSV_XS; # or trade for Text::CSV
 use strict;
 
-my $le32 = pack("V", 0x10000000);
-my $be32 = pack("N", 0x10000000);
-my $u32 = undef;
-
-sub wantBE { return !$u32 || $u32 eq $be32; }
-sub wantLE { return !$u32 || $u32 eq $le32; }
-
 my $csv = Text::CSV_XS->new({
 	allow_whitespace => 1,
 	binary => 1,
 	eol => $/,
 }); # or Text::CSV
 my $target_dir = ".";
-my $native_only = 0;
 
 &Getopt::Long::Configure(qw(bundling));
 &GetOptions(
 	"D=s" => \$target_dir,
-	"n"   => \$native_only,
 );
 
 if (!-d $target_dir) {
 	print STDERR "Target directory $target_dir does not exist.\n";
 	exit 1;
 }
-my @dbs = qw(LE BE);
-if ($native_only) {
-	$u32 = pack("L", 0x10000000);
-	if ($u32 eq $le32) {
-		@dbs = qw(LE);
-	} elsif ($u32 eq $be32) {
-		@dbs = qw(BE);
-	} else {
-		print STDERRR "Cannot determine endianness.\n";
-		exit 1;
-	}
-}
-
-foreach (@dbs) {
-	my $dir = "$target_dir/$_";
-	if (!-e $dir && !mkdir($dir)) {
-		print STDERR "Could not mkdir $dir: $!\n";
-		exit 1;
-	}
-}
 
 &dump(&collect());
 
@@ -96,61 +67,35 @@ sub dump
 sub dump_one
 {
 	my($iso_code, $country) = @_;
-	my($file, $fh_le, $fh_be);
+	my($file, $fh);
 
 	printf "%5u IPv6 ranges for %s %s\n",
 		scalar(@{$country->{pool_v6}}),
 		$iso_code, $country->{name};
 
-	if (wantLE) {
-		$file = "$target_dir/LE/".uc($iso_code).".iv6";
-		if (!open($fh_le, "> $file")) {
-			print STDERR "Error opening $file: $!\n";
-			exit 1;
-		}
-		foreach my $range (@{$country->{pool_v6}}) {
-			print $fh_le &ip6_swap($range->[0]), &ip6_swap($range->[1]);
-		}
-		close $fh_le;
+	$file = "$target_dir/".uc($iso_code).".iv6";
+	if (!open($fh, "> $file")) {
+		print STDERR "Error opening $file: $!\n";
+		exit 1;
 	}
-	if (wantBE) {
-		$file = "$target_dir/BE/".uc($iso_code).".iv6";
-		if (!open($fh_be, "> $file")) {
-			print STDERR "Error opening $file: $!\n";
-			exit 1;
-		}
-		foreach my $range (@{$country->{pool_v6}}) {
-			print $fh_be $range->[0], $range->[1];
-		}
-		close $fh_be;
+	foreach my $range (@{$country->{pool_v6}}) {
+		print $fh $range->[0], $range->[1];
 	}
+	close $fh;
 
 	printf "%5u IPv4 ranges for %s %s\n",
 		scalar(@{$country->{pool_v4}}),
 		$iso_code, $country->{name};
 
-	if (wantLE) {
-		$file = "$target_dir/LE/".uc($iso_code).".iv4";
-		if (!open($fh_le, "> $file")) {
-			print STDERR "Error opening $file: $!\n";
-			exit 1;
-		}
-		foreach my $range (@{$country->{pool_v4}}) {
-			print $fh_le pack("VV", $range->[0], $range->[1]);
-		}
-		close $fh_le;
+	$file = "$target_dir/".uc($iso_code).".iv4";
+	if (!open($fh, "> $file")) {
+		print STDERR "Error opening $file: $!\n";
+		exit 1;
 	}
-	if (wantBE) {
-		$file = "$target_dir/BE/".uc($iso_code).".iv4";
-		if (!open($fh_be, "> $file")) {
-			print STDERR "Error opening $file: $!\n";
-			exit 1;
-		}
-		foreach my $range (@{$country->{pool_v4}}) {
-			print $fh_be pack("NN", $range->[0], $range->[1]);
-		}
-		close $fh_be;
+	foreach my $range (@{$country->{pool_v4}}) {
+		print $fh pack("NN", $range->[0], $range->[1]);
 	}
+	close $fh;
 }
 
 sub ip6_pack
@@ -169,7 +114,3 @@ sub ip6_pack
 	return pack("n*", @addr);
 }
 
-sub ip6_swap
-{
-	return pack("V*", unpack("N*", shift @_));
-}
-- 
2.13.6

