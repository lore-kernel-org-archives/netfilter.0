From: Rui Santos <rsantos@ruisantos.com>
Subject: Re: NAT with unique egress port
Date: Fri, 18 Nov 2016 15:46:50 +0000
Message-ID: <CAJxU1QMEP53St8QLx=pG4ND1J5QhghSUN+mnicFazifrS6pSPg@mail.gmail.com>
References: <CAJxU1QN4c+5KOBgakYAgRXnR3jRh_s72BKyqT3F5g+oReQp3QQ@mail.gmail.com>
 <7118f027-0f54-7878-6d83-f304beed5430@familie-kuntze.de> <CAJxU1QP5OK=eScajCLB_=zNxc=2Q1Sc77iVsQnp4Cccs1iTmtg@mail.gmail.com>
 <bfbc83fd-179b-790b-5f78-5213032bee7c@familie-kuntze.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ruisantos-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=tWMDVkmV802I6iGHujBNrdXDt3v+SXYa79KLzj22sy4=;
        b=yinEuR3SbCWJh+GcIvKUuka2Fj7GwOliZgdJTIlYU6kWvCGsis93ut6xFax3AqtrCe
         TiYAobiDxOS6NFeknSQ0aTNcLtNxXF0aOCHVssE/+pdNORfjxlaPBJTxmkwRDjYSnioB
         hMWf1ZlUUW0KZBxE6krpia5pLgM1vTuHqD7CLBecK9XFCcVWyqXrsiM9fYPc277ykVQX
         p41ZZCLnAWYO4DcAJZ2xIfiITQ3WRlDI4apAgBg7YEntYVzb1aRqEbQnBje6OYp2EQlC
         1TljaRDh+48W3ugMpA6/Pm1B1pP72OVahh4gP4LO9kqQUlNONnewcKkAK8DAvU7hYwk0
         cBJw==
In-Reply-To: <bfbc83fd-179b-790b-5f78-5213032bee7c@familie-kuntze.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Noel Kuntze <noel@familie-kuntze.de>
Cc: netfilter@vger.kernel.org

>
> I don't know that, sorry. The stuff from that man page is all I know
> about this issue.
>

Just for the archive: The usage of --random does allow the reuse of
the same egress port.


-- 
Rui Santos
Veni, Vidi, Linux
