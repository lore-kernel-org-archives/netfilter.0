From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: Does anybody experience kernel crush when 'ebtable -t nat -L'
Date: Tue, 11 Feb 2020 12:03:22 +0000 (GMT)
Message-ID: <alpine.DEB.2.20.2002111201530.6759@tornado.local.jubileegroup.co.uk>
References: <CAFAx9aaiv4dK6Om0kkaGfzxiOY9CDGbzXtube5LLVBiA3pbMxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="-1463800020-1233497215-1581422605=:6759"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        jubileegroup.co.uk; h=Cc:Date:From:From:In-Reply-To:Message-ID
        :MIME-Version:References:Reply-To:Subject:To:User-Agent; s=uk;
         bh=fZxWAYhmS8bupqX+OIvGrcOrVeakyU/5oXgS3yv5P0E=; b=Dr3onyvmMHDt
        kpxVhbwKys4m3dNyyEpHfd6hCRUR9JD1Qyh5/W9iYEjOxiM8j2o/P592Si3ZNt6y
        rlIRBepJ8VCFfFpONOdc7KjC+Fyw33VGAmChFNAqCC4r7Ne/cyHoo9j4FZXb4qAn
        LohH7ARQbqnRmKEHb6M9w0x6hZn815wS/d+GcxTJ6Ra7CPvVxEkJX8FQ5Dfc/Ba3
        h9iZFCceymZ35uxT3EvUZThJeMenP2XNCNd31Sgs795S45U7VJgbOj1LMGTb+vjk
        KLZWCSoPUma8vwK5PVMM+McPPzd1CYHWuXpLvVxl+IUy7ckHupZNhtRj4hofI9if
        +J0PqhQytQ==
In-Reply-To: <CAFAx9aaiv4dK6Om0kkaGfzxiOY9CDGbzXtube5LLVBiA3pbMxw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: =?EUC-KR?B?vufAr7yu?= <ileixe@gmail.com>
Cc: netfilter@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463800020-1233497215-1581422605=:6759
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

Hi there,

On Tue, 11 Feb 2020, 양유석 wrote:

> From today, we even does not know what makes crush since there was no
> any log (literally kernel, application or something) Only that we
> encounter is when linux bridge agent in openstack restarted, server
> reboot without any log. After reboot, we see strange null string (@)
> in syslog. ...

I cannot help you with the kernel crash but I suggest that you try
remote logging to another server, it might help provide more log info.

-- 

73,
Ged.
---1463800020-1233497215-1581422605=:6759--
