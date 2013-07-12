From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: iptables Qu: how to specify !dst:port
Date: Fri, 12 Jul 2013 14:50:31 +0200
Message-ID: <CAOkSjBhV9YE=hrX4+OcF++F_dDvtRZVd94sSP=4m-rynPZJ6gQ@mail.gmail.com>
References: <51DFEFC1.6070708@die-optimisten.net> <CAOkSjBibSebbEvOfnZRQgLO4_tKHPTcyCJ-YpKaU60J_9sWWBA@mail.gmail.com>
 <51DFF730.2090203@die-optimisten.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=JkVyqjqU1UR7mk3/qDGfavGDTW8DmrKoA5xfgamC5pc=;
        b=I3L6ag21mBNK4Ub2ZpGtLBBQ4zW31rBpU5v+2w4yvh6i6vKrE3UK8zvmXwsDVS6LKM
         g4LFpE8xW2RMyrk8Ur5OZ5QsA0Db1Td/lF/7LIqfgm0o4bUZIJ4WAz7ltUuz/wZBm+5B
         1Pwr79OaVrsh+eAZll7wAYm94O+1iTFUYRwrarfflwAATHIphFlMwno85GnUVc1XbtGw
         R+cvtVpQpRykFGsO7u33wlhYHTH2fEtVreD47OWz5nMslP0tY2lO6okRdBJTZRYVoMWk
         IJjwBq+4qdzMVII4Tsg52mYESW5gHYyCjo6LowU9+OUpY18KMPbKCLLhB8TQqigXTw0X
         wYfA==
In-Reply-To: <51DFF730.2090203@die-optimisten.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Die Optimisten <inform@die-optimisten.net>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

2013/7/12 Die Optimisten <inform@die-optimisten.net>:
> Hi!
> Thanks for your fast answer!!
>
> How can I write -t nat
>     [all except these 2:]    (! -d 127.0.0.1 -and  ! -d  192.168.0.0/=
16)  ?
>

I would do it with ipset(8).

--
Arturo Borrero Gonz=E1lez
