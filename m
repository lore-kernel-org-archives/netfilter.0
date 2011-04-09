From: Clemens Eisserer <linuxhippy@gmail.com>
Subject: Howto get ulog-prefix with ulogd-1.24 + sqlite3 backend?
Date: Sat, 9 Apr 2011 14:13:02 +0200
Message-ID: <BANLkTingf+1nKHejX9XHcyep0DOHA__ghw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=NuDziwxiP4UvT0AFnV+3njJBFHf/2slkHK7S3ToKyKU=;
        b=v6e65ofy5PrsdA0W2aQ0woSdijKxcltiYfRmsxqPojBf5lV1kWTJQeBnaO3Tk9f+9G
         j2rjGIVjP2hXcbQSxFiAp/pGP0Mm9a8KrMfsqsmSPdAHnVkG+I0p30RYyAbVS5Anfqg/
         322Qp97W8bIXehpuzCYoySlIG4CeSzQRirH+k=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

We try to use ulog for traffic accounting in an university project.

First we tried ulogd-2.0beta4 + pgsql backend, but even under moderate
load the database couldn't keep pace with the amount of requests.
I thought about using ulog2 with sqlite, however in TODO theres an
entry about making ulogd2 compatible with squlite, so I guessed sqlite
is not yet supported with ulogd2?

Then we switched back to ulog-1.24 + squlite3, which works perfectly.
It can handle 100mbit/s torrent traffic at about ~50% CPU load.
However in sqlite's ulog table, the ulog-prefix is not stored. Is
there any way to get it stored - to be able to track which rule caused
the log enrty?

Also, conntrack is supported in ulogd2. Is this also true for
ulogd1.2? I couldn't find specific docs about that.


Thank you in advance, Clemens
