From: Thomas Delrue <delrue.thomas@gmail.com>
Subject: Behavior of iptables-save and iptables-restore when run concurrently
Date: Sat, 29 Aug 2015 15:22:14 -0400
Message-ID: <55E20666.9060802@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:subject:to:message-id:date:user-agent:mime-version
         :content-type:content-transfer-encoding;
        bh=xbul7fswivF6rUWJeaoZgFkIGq3AUI7SUDj198ylFHw=;
        b=uC7bLQZXL7xKaRI5gaPJipJQEqOEGSYdTGT10bkztPyNMKpR6rPxA1ArA9eAnUaHSE
         tPtpgtWNQptdRIzFasy065fdJesmvOXvLdt91EcUsIbuj1iRlc3jdQunXBRg/ZLodSYo
         VV2KyKsTu//mjCKGtpq/SCKirNh4B1LjWRB1J+k/XLNU5aYzg4av/Bgu7omoS1egl2N5
         fT0g9jae+TqCtsrNhmLX6DsXgSI7+piBEfEJ5MclV5XLkosi6aoAgZNImMDor8vmkw4c
         yKzP03wYtTcfyQhtqXUcpDROzHxd2h2M0B028rqhOYKqbUOGQbt5g7U/5M/lD6rHaNWa
         g1vw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Hello,

I have a bit of a weird question about the behavior of iptables-save and
iptables-restore when run at the same time.

Let's say that I have a situation like this:
- - My rules contain chains called FOO, BAR and BAZ which each contain a
bunch of goodies.
- - I don't want to change what FOO or BAZ look like
- - But, occasionally, I want to regenerate what the BAR chain should look
like, as in: I want to completely rewrite the entire BAR chain from
scratch. This is done by a program at certain intervals.

What I'd like to do is do a popen("iptables-save", "r") and as I read
the contents from it, I was thinking of directly piping it into
iptables-restore (using popen("iptables-restore", w"))
I happily write whatever is coming from the iptables-save pipe into the
pipe for iptables-restore and as soon as I encounter the starting point
for my 'BAR' chain, instead of writing the content of the BAR chain
coming from the iptables-save pipe, I write my new (full) content for
what BAR should look like.
Then I let iptables-save continue until it sees the end of the (old) BAR
chain data after which I just happily continue to pipe what is coming
from the iptables-save pipe into the iptables-restore pipe thus
preserving what was there originally for everything except for my BAR
chain which now contains the new information.

My questions are the following:
- - Will this work? Will iptables-restore wait to apply the incoming data
until it has seen everything or will it apply it as it comes in and
influence what is coming in through my other pipe from -save?
- - At what point does the incoming data get applied? Does it occur upon
my call to pclose(iptables_restore_pipe)?

I seem to recall someone mentioning that iptables-restore was atomic, so
I would guess that it would wait with applying until it sees an EOF
(pclose?) but I wanted to double check.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCgAGBQJV4gZmAAoJEKosl9oIs/pOjhkP/iMe7siZnzGUi3aAtTFHdMIt
B2NowRoAiWCuaSZP5WMVBR4fvq0pILS8L5Zox0vd5BX6Q1k0VCS0ABfI0UX+A7Tk
+9KECB8yjFiu1Vv4AV2K4Jvy7ACBUGuV8ZhtH4zinNJ1KhwkhGLJ8JRuPajoC++K
Y1ODNt6/+7W5/reRdBAB3XobAa5Zso7f+MDvvkFo2a6MCxp4bnri9y9tmym6rZlB
Z3h0SxV5C+fDabV4u9TftqJSuDXiaEMTgT5DkRTRMPfLw3OL+aDSYAU6vyJ8hFXh
B6I1/4wnvmgg3los6UHFKaoDa1kp/TArgypwkIYJRCOZvn+05unvvqC27iZNHnr7
C8BqVb6W2TWKnAgwaiSP2bvWO0jV9R48pX7Glyn9cXAtYA4WSgzWugSC14+ZTk69
TVD18GKe/Dr+UDoqNFWI2+0N9jl57S1LyhLbbX35gVqMbwovyEK60vGlUWs/10G6
3qfHl9huhglpV3oNdwK9nnTNDgSTug5gHR7JiDVgfdz0cS/6TdWvAIFPPJPH5+is
gjxiUqxkialR9CsaBWYbEQ8zlaUWq0+3vvFvXKjloKDmDG3HaTM86FwGy3rOfp1k
IDsTgKIIOXkUqZRD8LWexMokbcv+qqv2Fg+3KLd3eWK7erqFfGKNcfIJTNKEei8H
eEDWTakdqzyABo1zDlEg
=bFl+
-----END PGP SIGNATURE-----
