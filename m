From: Scott Bonar <sbonar@gmail.com>
Subject: Kernel panic when using IPset with counters
Date: Thu, 23 Mar 2017 05:47:04 -0600
Message-ID: <CABGW2bVabLiHO6_DuqhzOgkV5z1oeBMLSyqLrFZiY2oaVg6D0g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=IBasB5Nz4MrpJw0dVrlHsJeDnfq4tFdjT6zPpqxAL3Y=;
        b=pZgY/uzRlTaYyZiXpEfxpUsfiOOZoSUha79nzJNdBAeKmyYVz9jqi8ypqyTFjLYu9q
         r3f+wOQBJ2Zec6kZ3PZaXzh5BSr+u0MSJziLByHX2z6KdAv1UXxL36EuNMfUud5yIIlK
         E0e+kU8RvfZ3ac+vcuFFvvPKYwgxvAxGDmHx+DF2lfuG6TvLHFGarUQTWtZK00ikMo9u
         x6oDECj7MobhN4tVDgIxkmJIDD5mh+V/aCfgwHDacjmVSM/9ow+rFstWY2SuMOFGqufz
         bOCkXGloAgXCCPy9HaIsQ4FEZUsfLe0q/FjM/tjAXYDwB47N2ix/fBh52c9ZDenyOVey
         A98Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

When I configure a set with type =E2=80=98hash:ip=E2=80=99 and option =E2=
=80=98counters=E2=80=99,
after I have added more than 20 to 30 IP addresses to the set and then
execute an `ipset list <setname>` I get a kernel panic in the function
hash_ip4_list(). If I don=E2=80=99t have the option =E2=80=98counters=E2=80=
=99 I don=E2=80=99t get the
panic.

I am using ipset version 6.21.1 and kernel 3.14.

Is this a known issue and fixed in newer versions of ipset or kernel
or both??  Is there something I can do differently in setting up the
set?  I've tried playing with the hashsize and maxelem values but it
still panics.


Thanks in advance.


Scott Bonar
