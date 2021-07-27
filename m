From: Tom Yan <tom.ty89@gmail.com>
Subject: [nft] Regarding `tcp flags` (and a potential bug)
Date: Tue, 27 Jul 2021 19:18:55 +0800
Message-ID: <CAGnHSEkt4xLAO_T9KNw2xGjjvC4y=E0LjX-iAACUktuCy0J7gw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=1JX+ZuxpFYJrHa2C/X3TLcDrsbZOOIKz4FHeTxuU2/k=;
        b=kwk6OU2heV4rRnyasqjIsQ69eFLv9M2vvZ/jDt4lHvD3Fk+UiOn86sH7RCKRG8tfN9
         sNMwFlJOWbFA6scJNdLHO2aq0jKBABLAGIBl63VEefqDwZHaTUFvpg5Z46qqeT3b8NmN
         qncw1cg/2hufOVdC3Dl2I4FjX9eZmR9W+IhxCZEbx4ZJ5Qta5Fli0jQGTsc6hiDyigQF
         M682vwa6AajPtVVPtQSOagCd6yI0W3uk3xkKO63jBLaTSHNMOnIp+7VSaME16mKe8EE+
         7uckdGSvCJpWV2ps6cFQ/a6apUKsd69qg29yJq4zAo50CSg6CkpUJ8HUnPQf4wEunuEJ
         XocQ==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi all,

I'm a bit uncertain how `tcp flags` works exactly. I once thought `tcp
flags syn` checks whether "syn and only syn is set", but after tests,
it looks more like it checks only whether "syn is set" (and it appears
that the right expression for the former is `tcp flags == syn`):

# nft add rule meh tcp_flags 'tcp flags syn'
# nft add rule meh tcp_flags 'tcp flags ! syn'
# nft add rule meh tcp_flags 'tcp flags == syn'
# nft add rule meh tcp_flags 'tcp flags != syn'
# nft list table meh
table ip meh {
    chain tcp_flags {
        tcp flags syn
        tcp flags ! syn
        tcp flags == syn
        tcp flags != syn
    }
}

Then I test the above respectively with a flag mask:

# nft add rule meh tcp_flags 'tcp flags & (fin | syn | rst | ack) syn'
# nft add rule meh tcp_flags 'tcp flags & (fin | syn | rst | ack) ! syn'
# nft add rule meh tcp_flags 'tcp flags & (fin | syn | rst | ack) == syn'
# nft add rule meh tcp_flags 'tcp flags & (fin | syn | rst | ack) != syn'
# nft list table meh
table ip meh {
    chain tcp_flags {
        tcp flags & (fin | syn | rst | ack) syn
        tcp flags & (fin | syn | rst | ack) ! syn
        tcp flags syn / fin,syn,rst,ack
        tcp flags syn / fin,syn,rst,ack
    }
}

I don't suppose the mask in the first two rules would matter. And with
`tcp flags syn / fin,syn,rst,ack`, I assume it would be false when
"syn is cleared and/or any/all of fin/rst/ack is/are set"?

Also, as you can see, for the last two rules, `nft` interpreted them
as an identical rule, which I assume to be a bug. These does NOT seem
to workaround it either:

# nft flush chain meh tcp_flags
# nft add rule meh tcp_flags 'tcp flags == syn / fin,syn,rst,ack'
# nft add rule meh tcp_flags 'tcp flags != syn / fin,syn,rst,ack'
# nft list table meh
table ip meh {
    chain tcp_flags {
        tcp flags syn / fin,syn,rst,ack
        tcp flags syn / fin,syn,rst,ack
    }
}

I'm not sure if `! --syn` in iptables (legacy) is affected by this as
well. Anyway, I'm doing the following for now as a workaround:

# nft flush chain meh tcp_flags
# nft add rule meh tcp_flags 'tcp flags ! syn reject with tcp reset'
# nft add rule meh tcp_flags 'tcp flags { fin, rst, ack } reject with tcp reset'
# nft list table meh
table ip meh {
    chain tcp_flags {
        tcp flags ! syn reject with tcp reset
        # syn: 1, other bits: not checked
        tcp flags { fin, rst, ack } reject with tcp reset
        # syn: 1, fin: 0, rst: 0, ack: 0, other bits: not checked
        ct state != invalid accept
    }
}

Are the comments in above correct? Are any of the assumptions in this
email incorrect?

As a side question, is it even possible that any packet will be
considered `invalid` with (syn: 1, fin: 0, rst: 0, ack: 0)?

Thanks in advance!

Regards,
Tom
