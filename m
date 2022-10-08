From: "Kevin P. Fleming" <kevin@km6g.us>
Subject: Reliably flushing individual tables in nftables
Date: Sat, 8 Oct 2022 09:04:04 -0400
Message-ID: <CAE+Udoq40XMVyx34hiEjLzVVitJC8ZcsR19aMawNYPZP4NRJVg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=km6g.us; s=google;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BdTLWC2Aok34NfOh+R+GHU62NJZHg/512T/L5Cp5iVQ=;
        b=ODXIbTeoQKH5inimC3w2aeFxvr6LJ5HtJAuqjfxH/5pWKN89SsAJW+gBnwklPoRJX+
         IRlH3CwRvokDBvItfhSLNi8ZYuA03tPBBYFDtRAwR//zEYgtbwIu5HjC+a64uc05GD7b
         nZSr0BaSkwBjQt8PhDh9PPrZngi+XBuir3nXzAdKvIoG3+uvYN2eINODlhgszdZStTPW
         vD5fZU6dbYY1fsqFl0UQpZeAo+IlAVP0S3rkTmPjaMjkbHvFWBZ4/wHS7yL/+JnrkptN
         z4EETpAImkrZhTVVo/Djx0pDQ7/0rmoITsDhCkF6JQG6W868oa82PgFgMpM9h2t/afjT
         4Qdg==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On my firewall machines the nft ruleset contains tables I created
(using a systemd unit similar to Debian's nftables.service unit) and
also tables created by Tailscale.

When reloading my own rules, I'd like to be able to use 'nft --check'
to validate the candidate rules before attempting to apply them, in
case a failed application would leave the firewall more open than it
should be. However, I can't do that at the moment because '--check'
assumes that the commands supplied to it are being applied to an
'empty' environment, or something similar to that.

Normally this would be solved by including 'flush ruleset' in the
rules file passed to '--check', but I can't do that because it would
flush the Tailscale tables too.

I've tried using 'flush table <table>' commands in the rules file, and
that works as long as the rules have been previously loaded (in tables
with the same names). It fails at system startup though, because 'nft
flush table <table>' fails with an error if the named table does not
exist.

I've got an ugly workaround at the moment but I'd like to avoid that.
I think the simplest solution here would be to enhance 'nft flush
table <table>' to not report an error if the table does not exist,
since in the end that was almost the same goal as the command itself.
Does this seem reasonable?
