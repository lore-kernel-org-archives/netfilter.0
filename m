From: "Kevin P. Fleming" <kevin@km6g.us>
Subject: Re: Reliably flushing individual tables in nftables
Date: Sat, 8 Oct 2022 13:39:20 -0400
Message-ID: <CAE+UdoooNrM6khxmgz1MB_cnspZpBa=oA8OTxi7zLm4NK3O-Zw@mail.gmail.com>
References: <CAE+Udoq40XMVyx34hiEjLzVVitJC8ZcsR19aMawNYPZP4NRJVg@mail.gmail.com>
 <f057a62a-1f4d-cc84-53ee-f767757a2a40@average.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=km6g.us; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M9qpoM1gO3xjZSKGIPJOJQ3xnZWC2FZ7HCVbr2sh6WE=;
        b=LMTmPJB15GtJQDd/JzYbaOuc4mz/TAKlggEmJApODb0BR0zNbeGcM/4C1yc7Bkm3ZC
         X9Fr5ZpTdtZhTtYiBF0lIxDBh92hRH5qjCC+h+Af/iJV0BmA0j1RfboaU/HNAS3rliy7
         TbE7x98S4LzVmA3jKNPsboSMsiRklcRs3WPgakB3+lqg0CH835mDZ6AsPdg1OOrIDyHz
         l/N8G2TKCToV0KaGAoOUGaEm2DUsc3uwueMZ0BfjW0ySilmZ2YWc0k6Z2+adS7TZbHUB
         ql4+8BMKZuwWbpIOwZRAL9NvHPk+9NBIFTnwnzTpupZSyiAl/FHKJlG8bmIHcKK7+TLX
         c4kQ==
In-Reply-To: <f057a62a-1f4d-cc84-53ee-f767757a2a40@average.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eugene Crosser <crosser@average.org>
Cc: netfilter@vger.kernel.org

On Sat, Oct 8, 2022 at 12:47 PM Eugene Crosser <crosser@average.org> wrote:
>
> On 08/10/2022 15:04, Kevin P. Fleming wrote:
> > On my firewall machines the nft ruleset contains tables I created
> > (using a systemd unit similar to Debian's nftables.service unit) and
> > also tables created by Tailscale.
> [...]
> > I've got an ugly workaround at the moment but I'd like to avoid that.
> > I think the simplest solution here would be to enhance 'nft flush
> > table <table>' to not report an error if the table does not exist,
> > since in the end that was almost the same goal as the command itself.
> > Does this seem reasonable?
>
> You can define the table and then remove it in the next line. Definition will do
> nothing if the table exists, and will create and empty one when it does not.

That's a great tip! Thanks.

> We need to deal with a similar situation, when there may be more than one entity
> mucking with the ruleset. The approach that we take now is that everyone who
> changes the ruleset must reflect the change in file in /etc/nftabled.d/
> directory, that is included from /etc/nftables.conf. As long as there are no
> exceptions to that, it is always safe to flush and reload everything, and also
> should be possible to run --check.

I wish I could do that, but the Tailscale VPN won't store the rules it
needs in a file; it can be told *not* to much with the firewall at
all, which means I could inject the necessary rules myself, but I
wouldn't be able to know when a new version needs different rules. For
now, just using separate tables (with priorities set appropriately)
will work fine.
