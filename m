From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: iptables-normalizet: argument normalization and DNS resolution?
Date: Wed, 9 Apr 2014 16:00:56 +0200
Message-ID: <CAOkSjBiFCZP4CBvj1K=tD1ApaWJ+6LswezqLemNwiQzOvv5FGA@mail.gmail.com>
References: <web-181154039@uni-stuttgart.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=dE0KeKykki9x+monW1kojq2IPsnGwlqDESrn9Cit/M8=;
        b=JDKTaugORf9vpLq1iHJCKFozJiDLqh3a0D1w6yYumxjlinMT7HTsS5tngp8O01tXT5
         LqMWz8wnQ72W57PTEyyQpQRQQpoTS5J9DMFrG+nDa2QDxRVSc8jZBddO6v5LaDZAstQf
         5wh/0MRHdo6R6611HcQ5pgTiTbwPoza2L3m1Y2s3boM2cvm1mwC5Ib9BqI0N/0ooC+SI
         9+eIhdkF4J10UgS70cg/juDVIk5sT6c0+W0XovZYHpFAY4XfAFqHg0Vb/HbUmdeRlTuL
         pJuPGzXFjqZfTa99KJfDAit25oAQZNmBsCxZGqq9hQdyEehM5Bp79euBS2kh2WJOcVag
         R2og==
In-Reply-To: <web-181154039@uni-stuttgart.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Daniel Tiebler <daniel.tiebler@tik.uni-stuttgart.de>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 9 April 2014 14:10, Daniel Tiebler
<daniel.tiebler@tik.uni-stuttgart.de> wrote:
[...]
> * Is something similar possible with nftables?
>

In nftables, you can know a low-level (netlink) representation of all
nftables objects (tables, sets, chains, rules...) in userspace (using
libnftnl).

This representation is either XML or JSON, where DNS name resolution,
service name resolution and friends are translations to the internal
kernel data structures.

To know if two rules are the same, you could check if the expressions
set is the same.

=46or these nftables rules:
 * nft add rule test test tcp dport 22 accept
 * nft add rule test test tcp dport ssh accept

The list of expressions in XML is exactly the same. The handle
attribute is unique for each rule.

<rule>
  <family>ip</family>
  <table>test</table>
  <chain>test</chain>
  <handle>3</handle>
  <flags>0</flags>
  <expr type=3D"payload">
    <dreg>1</dreg>
    <offset>9</offset>
    <len>1</len>
    <base>network</base>
  </expr>
  <expr type=3D"cmp">
    <sreg>1</sreg>
    <op>eq</op>
    <cmpdata>
      <data_reg type=3D"value">
        <len>1</len>
        <data0>0x00000006</data0>
      </data_reg>
    </cmpdata>
  </expr>
  <expr type=3D"payload">
    <dreg>1</dreg>
    <offset>2</offset>
    <len>2</len>
    <base>transport</base>
  </expr>
  <expr type=3D"cmp">
    <sreg>1</sreg>
    <op>eq</op>
    <cmpdata>
      <data_reg type=3D"value">
        <len>2</len>
        <data0>0x00001600</data0>
      </data_reg>
    </cmpdata>
  </expr>
</rule>

If you are using a recent nftables, you can run `nft export
{xml|json}' to get your current ruleset in XML or JSON format.
We plan to add `nft import {xml|json}' operation as well.

Tracking FQDNs changes is another, different issue.
--=20
Arturo Borrero Gonz=E1lez
