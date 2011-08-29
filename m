From: naruto canada <narutocanada@gmail.com>
Subject: bridges are not self contained
Date: Mon, 29 Aug 2011 14:28:23 +0000
Message-ID: <CAKrOiPTKyAezXpr__BmRLZRiweh_L+xFjw5Nj7FA1qCoRd3Bdw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=iQwSTs+Y86NEVcQUpDgR0U1N3YMo0hM84Zhbws7sC+E=;
        b=U7Kex5SlHv9DiBKtCtd6RPifl5ELpWwVrds1cLnkzzyNitheUavnZWRy9Qi79oQjbl
         r1gYTZVhp6mgtjPv1MUDAgGS70wXLo6Q5ACfn9Our8iy4v9TIOI1EMVZ9fbtZ4OPdfIx
         Qi98NBFlSYUFzTnJ1NXKW3aQlOZ09llP56BNQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

hi

I am a new user of ebtales. (bridges)
Just started experimenting, I run into one problem immediately:
all the bridges can see traffic on ethernet card that are NOT
connected to the bridges.
I know the card is trasmitting broadcast type packets, but should not
each bridge be self-contained?
By default, bridges should be self-contained without having to resort
to ebtables rules ?

Thanks
