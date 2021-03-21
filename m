From: Frank Wunderlich <frank-w@public-files.de>
Subject: Aw: hw flow offload - nft crosscompile
Date: Sun, 21 Mar 2021 12:58:33 +0100
Message-ID: <trinity-48a4e364-4207-4305-9d25-7ce61a6b167b-1616327912998@3c-app-gmx-bap32>
References: <trinity-69642984-5c45-4c9a-ab31-b7585e0351b9-1616260101092@3c-app-gmx-bs65>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1616327913;
        bh=mOE5/oVGquHyT7+mPJuEwlP5xQNQab5gIR/7UTvdB0o=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=QLXE2N9komWEw71pkY6T+tDjfI4BW52LPZ3dkBpijDlidd5fyb/JEne0NbaHAeeQp
         FqllcuaYn/hwHGLk3Hd8waXH60qMTMshQHVOa/ruSuTRYBbMzp0P6qMkPhby27RgZk
         Ry4oPzHz44dz12H/tTlkPFldoveAOqgQ+Vl9W1R8=
In-Reply-To: <trinity-69642984-5c45-4c9a-ab31-b7585e0351b9-1616260101092@3c-app-gmx-bs65>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Wunderlich <frank-w@public-files.de>
Cc: netfilter@vger.kernel.org

Hi,

i got nftables compiled

- on native it looks like my PKG_CONFIG_PATH / LDFLAGS were not used

this is the fixed version:

./configure --enable-static \
        --prefix="$PWD/install" \
        PKG_CONFIG_PATH="${LIBNFTNL_PATH}/install/lib/pkgconfig" \
        LDFLAGS="-L${LIBNFTNL_PATH}/install/lib/"

- on crosscompile it looks like the addditional vars breaking linking process

this is the fixed configure-line:

BASE="$(pwd)/..";
./configure --host=arm-linux-gnueabihf --prefix=$(pwd)/install PKG_CONFIG_PATH="$BASE/libnftnl/install/lib/pkgconfig:$BASE/libmnl/install/lib/pkgconfig" --with-mini-gmp --without-cli

(have not yet tested the crosscompiled on to find out it works or not, maybe broken because of --without-cli)

regarding the "flags offload" in flowtable, i made a basic patch to parser reusing the flags_spec from chain (flowtable seems like only a "renamed" chain). I'm not sure if it is enough, but nft-command now accepts the flags inside the flowtable

diff --git a/src/parser_bison.y b/src/parser_bison.y
index 08a2599e..e5607cf7 100644
--- a/src/parser_bison.y
+++ b/src/parser_bison.y
@@ -1993,6 +1993,7 @@ flowtable_block_alloc	:	/* empty */
 flowtable_block		:	/* empty */	{ $$ = $<flowtable>-1; }
 			|	flowtable_block	common_block
 			|	flowtable_block	stmt_separator
+			|	flowtable_block	flags_spec	stmt_separator
 			|	flowtable_block	HOOK		STRING	prio_spec	stmt_separator
 			{
 				$$->hook.loc = @3;

regards Frank
