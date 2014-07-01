From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: errors found in nftable docs on wiki
Date: Tue, 1 Jul 2014 08:32:29 +0200
Message-ID: <CAOkSjBhBVBLHWWNRC7qZrks0ug_qQ8RH9g_gJQGDA6vZPcNqLA@mail.gmail.com>
References: <CALLvB8LPbBQpGD-QAmPW3L9GT6CYZ2TAMh+E9koYBq7OWBUCkw@mail.gmail.com>
 <20140629101250.GA3615@localhost> <CALLvB8K7dnprfQdozF1RCsUhiy_hjp3A09T8M9U+BRVNkKA+Gg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=OYcKQ6Tk2rDVDdvGVnnwfGEGrTAsUlzHXckVcaqLDUY=;
        b=G64lJ4+L7Luz6r13QxFAodUh+YlgDjhI7MtNS/iJwG0gElt6RR5IlXGjW6meZ1Ay5o
         UUUfQZ6dw3SvjusgNIizm9eFblLUMvwK9LsfDM8T0EcuBjt2kD+sNzhEFVcuS0tXp7Lm
         ix2e9IqzP3//eFjap7IPNoGdtFLSC89zcZCFw3YBi/NBmkoKn/lsL5mSqaVb8XJqsUz2
         VVScFATUkYAEtMnEtrSKP5ndi9ZUpT8RNCg9qqzc4wIAZjT9c61mk6xVMdiIpd1nQQKW
         hS9NX0cSbT2Q+nFdavU/fIHn8yUHBhdDsaFJzWFGFpCYZiUXIQKEHTC09ZiW5T5po//p
         OAig==
In-Reply-To: <CALLvB8K7dnprfQdozF1RCsUhiy_hjp3A09T8M9U+BRVNkKA+Gg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Jonathan Johnson <ecybernard@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 29 June 2014 16:51, Jonathan Johnson <ecybernard@gmail.com> wrote:
> I followed your example and no go.
>
> /sbin/nft add table ip  blackhole
> nft list tables
> results:  blackhole
>
> nft add set filter blackhole { type ipv4_addr\;}
> <cmdline>:1:26-42: Error: Could not add set: No such file or director=
y
>

The syntax is:

nft add set <family> <table> <setname> { type ... }

So, you are adding a set named 'blackhole' in a table named 'filter'.

I would suggest to create the filter table.
--=20
Arturo Borrero Gonz=C3=A1lez
