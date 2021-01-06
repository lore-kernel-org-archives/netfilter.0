From: Nikolai Lusan <nikolai@lusan.id.au>
Subject: Re: Matching streaming services
Date: Thu, 07 Jan 2021 05:37:23 +1000
Message-ID: <10397770845846a7270a3b3922772f1a84de9684.camel@lusan.id.au>
References: <34e8a6b25cd0886dc6f5d8757e64d1846b29d7cd.camel@lusan.id.au>
         <ae566d41-2114-536e-9f86-6392a0e4ef76@thelounge.net>
Reply-To: nikolai@lusan.id.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lusan.id.au;
        s=KIEV_LUSAN; t=1609961849;
        bh=nHoL7ssxrc0zB6+zpELB97BbDP6g0JKl6VjIl7fL10s=;
        h=Subject:From:Reply-To:To:Date:In-Reply-To:References;
        b=QqJk6uNPRiJ8dRK68HJj5tpqta/oyvRboAeBoChL2NsqhaA6o60/YYz77OY4LRJ6c
         GamCBxqj0pqKJUloCajuJKeoLhC6QPEzi8d/r9YmtkJ819OB1GJVfQGiugryP2TDuL
         w+xZGLCDpQL9xfEH/qQj1A58DPOmyfQ8yDT1RtMg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lusan.id.au;
        s=KIEV_LUSAN; t=1609961845;
        bh=nHoL7ssxrc0zB6+zpELB97BbDP6g0JKl6VjIl7fL10s=;
        h=Subject:From:Reply-To:To:Date:In-Reply-To:References;
        b=IwSVVNsCxt1v1d/PuZz1M/Wya10ba/TvpyZLoqFcthGcXG4X1acMGRXvy4e8DUtLY
         Y4I2rTt3BFpu3VNXhTzfKktwn2csGhq1adHymBu1P3Kg1WdrhwJjFKQ2Nj0DDvE0Af
         zF4+yfVzceOk7zNk52jtY59f9P7eeTkA4YUKRVhg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lusan.id.au;
        s=KIEV_LUSAN; t=1609961845;
        bh=nHoL7ssxrc0zB6+zpELB97BbDP6g0JKl6VjIl7fL10s=;
        h=Subject:From:Reply-To:To:Date:In-Reply-To:References;
        b=IwSVVNsCxt1v1d/PuZz1M/Wya10ba/TvpyZLoqFcthGcXG4X1acMGRXvy4e8DUtLY
         Y4I2rTt3BFpu3VNXhTzfKktwn2csGhq1adHymBu1P3Kg1WdrhwJjFKQ2Nj0DDvE0Af
         zF4+yfVzceOk7zNk52jtY59f9P7eeTkA4YUKRVhg=
In-Reply-To: <ae566d41-2114-536e-9f86-6392a0e4ef76@thelounge.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

On Wed, 2021-01-06 at 19:18 +0100, Reindl Harald wrote:
> the point of https is to clap on dirty fingers of anyone in the
> middle 
> of the connection, no matter if his intention is good or bad

My initial thinking was that the https port was just being used, and
not that it was actually https traffic, although this seems not to be
the case (verifying would require a deeper dive into the packet stream
than I have time for right now).


> if you can distinct the content of https traffic we have a problem
> houston

I agree - but it doesn't stop people using port 443 for other data
transmission, for example ssh on port 443 often allows you to bypass
proxies or overly strict firewalls. Just because it's "reservered" as a
port for secure http transmission doesn't mean that's what it's being
used for. I suspected it might be sctp traffic, but again I can't
verify anything with my current time constraints.

- -- 
Nikolai Lusan <nikolai@lusan.id.au>
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEVfd4GW6z4nsBxdLo4ZaDRV2VL6QFAl/2EXMACgkQ4ZaDRV2V
L6QsWBAAkmb5NgIkNxDqWGM9EAqyd+DvtPADcix4Wq4hdKw1qdW2BJyWq5xgBvCh
ty9MzXkkiqeuOL/vr82srZgAIjZJ3Y7gJ2pozanYLEc6celCGHK1J9ElUFvPijF+
z/W/yObxJPUJ5oFHhHr8VBPSF6fmhgKBAgNQaczErrhUyRu8sMElFXun4mRKTbsX
RKx4mWFF/lQbQ9p2OMngvJAZRl+Zyxxyu7enFjrzX4IUWhBeznhj/3x3AR4dN7om
vhO9gYgQ5uam9/tWURfUhGdBs80DFLrMJMAGoPYfBqLOgzzo6RpBBUyu2A7KtOKx
KKlkc2vPBy8mrAQLB0+JvtyY+xU759wp5ItNPAurdt17i6yh6x/UKNLFOUiVeyZE
zASBUrw5B/1SwBwtHqiSqlEDiqKU1g7zr+oEbBT8tJot3CT+Kzz+QlqGPa8YykDU
Q/mAkTb/kdur4Yil5scpIxBRf+ISCiwZC5gXGo94HkNtHWeLHNWCv/NVLNSbWQb9
5LsGAyXQxA9cmKT78OX4rbGq6iJzZLLKgEi2a0EDAQCy5ZD0y4aGyl91SnHYSmoj
1q9IszexoxC72zqnL7BDpDFSz2RAFoeA7QIrJ5Nq1DxwXw524YOSipqJTrnpeX3/
Trvy610Wf7XA1PtfGfnh2iGC2ETi/Pai/XqWfjlg1ujnROHmwIA=
=GHKy
-----END PGP SIGNATURE-----

