From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: errors found in nftable docs on wiki
Date: Wed, 2 Jul 2014 08:56:19 +0200
Message-ID: <CAOkSjBjcz=+h0dxQHPS4Q1vjA-WGKmGEHeeNcNePKprDSWTroQ@mail.gmail.com>
References: <CALLvB8LPbBQpGD-QAmPW3L9GT6CYZ2TAMh+E9koYBq7OWBUCkw@mail.gmail.com>
 <20140629101250.GA3615@localhost> <CALLvB8K7dnprfQdozF1RCsUhiy_hjp3A09T8M9U+BRVNkKA+Gg@mail.gmail.com>
 <CAOkSjBhBVBLHWWNRC7qZrks0ug_qQ8RH9g_gJQGDA6vZPcNqLA@mail.gmail.com> <CALLvB8KbqmQT1YQLj9D8mD=wuxW4CY6DkWirP8za4iPZ067d0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=nn8vsRehm/cZWupmmfp9Vw1oIE7UX9XVzZOp7NQZGzk=;
        b=P5+0Lf0gnb2clIjSnZQP08FNp13tCSokYNSDORKK4W4irkB/hxkG+SkziIlzulLDG4
         zvUhTTOmOrHJwF5vXW10Sfum4Aw/RAtJ0LEInz7bJ9VYJ15vkUFQF4P1CkgcK6/CeU93
         dGS3Y/fkFx7uTEx96G1SrbFLEDb09gGqxTTrO7F8pFqAZRz9IRcNoT4zp90ltf7lO2Eh
         kJEZpZJhTW0c14Q9rPsRkhys4vIGtt7zGP5yLueLDfC8R+RhK8l2lfYs8hIcvQsPJdmA
         XUHIomQfcAPxBwZ9+kzqKMShCuNeZpwU4TZDCagObA1n3H4czs3Ap7GYezOIPGtyg+iu
         uLfQ==
In-Reply-To: <CALLvB8KbqmQT1YQLj9D8mD=wuxW4CY6DkWirP8za4iPZ067d0Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Jonathan Johnson <ecybernard@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 2 July 2014 06:44, Jonathan Johnson <ecybernard@gmail.com> wrote:
> I tried to implement the syntax above with no luck.  I have no idea
> what I am supposed to do, and I am blindly stabbing around with trial
> and error trying to figure this out.  Why don't you just provide me
> with a complete example and make it easy for me?  All the examples I
> find are broken,wrong, or incomplete.
>

Well, I just succesfully tested this:

nft add table blackhole
nft list table blackhole
table ip blackhole {
}

nft add set blackhole set1 { type ipv4_addr\; }

nft list table blackhole
table ip blackhole {
   set set1 {
      type ipv4_addr
   }
}

nft add element blackhole set1 {1.1.1.1, 2.2.2.2, 3.3.3.3}

nft list table blackhole -nnn
table ip blackhole {
   set set1 {
   type ipv4_addr
      elements =3D { 3.3.3.3, 2.2.2.2, 1.1.1.1}
   }
}

nft add chain blackhole chain1
nft list table blackhole -nnn
table ip blackhole {
   set set1 {
      type ipv4_addr
      elements =3D { 3.3.3.3, 2.2.2.2, 1.1.1.1}
   }

   chain chain1 {
   }
}

nft add rule blackhole chain1 ip saddr @set1 counter accept
nft list table blackhole -nnn
table ip blackhole {
   set set1 {
      type ipv4_addr
      elements =3D { 3.3.3.3, 2.2.2.2, 1.1.1.1}
   }

   chain chain1 {
      ip saddr @set1 counter packets 0 bytes 0 accept
   }
}

--=20
Arturo Borrero Gonz=C3=A1lez
