From: "Kevin P. Fleming" <kevin@km6g.us>
Subject: Re: Reliably flushing individual tables in nftables
Date: Sat, 8 Oct 2022 13:49:41 -0400
Message-ID: <CAE+UdoqiVh-3306VpzHFxZWCOf=_T_O6RsngjKaHf3LzOs_kwg@mail.gmail.com>
References: <CAE+Udoq40XMVyx34hiEjLzVVitJC8ZcsR19aMawNYPZP4NRJVg@mail.gmail.com>
 <f057a62a-1f4d-cc84-53ee-f767757a2a40@average.org> <CAE+UdoooNrM6khxmgz1MB_cnspZpBa=oA8OTxi7zLm4NK3O-Zw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=km6g.us; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=elJJogd4h89d+mRnr4M55OqhgdkY72jXSr6t/4BlHq4=;
        b=HX0AeqcAazvRbRRSvViVaYH6TSoMxvKURpCkBppKC0ZYZJEY/GHHRKBuYw+GmQyQ47
         QV+CBQG/8wFmVGum+DpupW6psRuDZBlEBki9TOlFUoIrr1ESlnJvo5lG8s9MPt6Wg83i
         Dd75nYrv3OPz7UwUpe+rmtcZ75HFaozvyVpFwnFjldmxzlSFPpifSvo7zaPhqJa90gIW
         +h56LA9BbosExzNs79PQ71r6soV4dTrm6wdV1RVUSgNa8HTM+odldg00afAIgWuwq6w+
         C9KMLXagoS50YBlJorD7jcKIJgFCS1XbwnNftxyuLdQ/Hpt8T4fOn6GvLmD6+oTJY6Io
         fi4w==
In-Reply-To: <CAE+UdoooNrM6khxmgz1MB_cnspZpBa=oA8OTxi7zLm4NK3O-Zw@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eugene Crosser <crosser@average.org>
Cc: netfilter@vger.kernel.org

On Sat, Oct 8, 2022 at 1:39 PM Kevin P. Fleming <kevin@km6g.us> wrote:
>
> On Sat, Oct 8, 2022 at 12:47 PM Eugene Crosser <crosser@average.org> wrote:
> >
> > On 08/10/2022 15:04, Kevin P. Fleming wrote:
> > > On my firewall machines the nft ruleset contains tables I created
> > > (using a systemd unit similar to Debian's nftables.service unit) and
> > > also tables created by Tailscale.
> > [...]
> > > I've got an ugly workaround at the moment but I'd like to avoid that.
> > > I think the simplest solution here would be to enhance 'nft flush
> > > table <table>' to not report an error if the table does not exist,
> > > since in the end that was almost the same goal as the command itself.
> > > Does this seem reasonable?
> >
> > You can define the table and then remove it in the next line. Definition will do
> > nothing if the table exists, and will create and empty one when it does not.
>
> That's a great tip! Thanks.

Confirmed. A ruleset file like this:

add table inet _test
delete table inet _test
table inet _test {
    ... sets and rules here ...
}

This works fine with '--check', and works fine during system startup
as well. Note that 'delete table ...' is required instead of 'flush
table ...' if the table contains sets that will be recreated later in
the file; the other alternative would be to use 'flush set table ...'
for each set-in-table combination, but I opted to just use 'delete'
instead. It is also important to use 'add table ...' and not 'create
table ...', as the latter will fail if the table already exists.
