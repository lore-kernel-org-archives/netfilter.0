From: Alex Xu <alex_y_xu@yahoo.ca>
Subject: ulogd's SQLITE3 "buffer" option
Date: Tue, 29 Dec 2015 18:38:31 -0500
Message-ID: <20151229183831.0ff29890@alex-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048; t=1451432315; bh=+jmkkYAZAYTI2Gm61GQqKymVKzm/Pt7W2r9nthLTuh4=; h=Date:From:To:Subject:From:Subject; b=jBSOy4/n+ma1mbVbGmTWnyOlHSNmeaxEVvv7UnL5Q3X+yaCE1bUCK+L+JHjrGetByIFeHtolK/f8Irjs3VaERZJDtbii1JDVNPOLAVVmKPi0dd4zI946+XXcpaaVoQgy8KIvx2U+fagFOHxCl07aj+OlmGHmBegUDl1d8uO5HlbdULxgtqDJ0SqgTKRLErqxGYW2mACHBMoMeGwfkqK9u4UVTaIU0mD2TSyyar+nX+QOQK8LhJO+u5cm5FytXjJZblYUZX/C3Navc91xKv6t1fy4rI4ZEiKR2btXKD7xgACefzqixsC5K10tM0GaUPJchjU9niJ+J+DOoZn2vEbsPQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I was attempting to configure sqlite3 output in ulogd and could not
determine the function of the "buffer" configuration option.

$ grep buffer output/sqlite3/ulogd_output_sqlite3.c
        int buffer_size;
        int buffer_curr;
                        .key = "buffer",
#define buffer_ce(pi)   (pi)->config_kset->ces[2].u.value
                priv->buffer_curr++;
        /* initialize our buffer size and counter */
        priv->buffer_size = buffer_ce(pi);
        priv->buffer_curr = 0;
$ grep -rF buffer_curr .
output/sqlite3/ulogd_output_SQLITE3.c:  int buffer_curr;
output/sqlite3/ulogd_output_SQLITE3.c:          priv->buffer_curr++;
output/sqlite3/ulogd_output_SQLITE3.c:  priv->buffer_curr = 0;

Now, it is quite likely that I am missing something, but it would
appear that buffer_curr is never actually *read*, only *written*,
and it's a basic fact of programming that a variable can have no effect
if it is never read from. [citation needed]

It would appear that the original code in ulogd-1.x employed a 'buffer'
which was actually a counter for when to tell sqlite to sync to disk.
When the code was rewritten by "Holger" and committed by Pablo Neira
Ayuso (8f7bb61), the syncing part was removed but the buffer variable
was simply renamed.

Nobody noticed because one fsync every few seconds is tiny.

Therefore, I think we should remove the "buffer" option entirely.

Thoughts? I will send a patch if there are no objections.

Please CC me on replies.
