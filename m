From: Matthew Ellquist <mellqui@d.umn.edu>
Subject: iptables debian 11 package
Date: Wed, 28 Jun 2023 20:29:44 -0500
Message-ID: <CAOBAZ9C9s5Ko6YHzSqY7hUW2WHnA4zkZWu4pvD=o=4OCV1wTaQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 4Qs18g5qL9z9vCBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=d.umn.edu; s=google; t=1688002195; x=1690594195;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Kw0PtPcR66jKWpjQHeqKKww4Vay0/dblQObiseW/LlE=;
        b=EDlsGldAMd4v/ZiAj9Uhcfgwfd+zxsrs9LDvyLrWKyFh8VoeeJUio4zd+3KdKaWCuI
         MdTJt0eCFvYqxZIBwfOh68T1g1xHl8xGwQYOXT9rm4e/6hbmnkzIKMWbtAywaTJHZXNl
         Rwf0i+y1kyxYfrjJUz4jds8COnmvfPPjVlLFOwjRrQiN2JpruLRqQb2gFMSnV3ecCNOr
         olberWQYETcljgDmbiAYJyUuHLjmRi+wavp8z7q/sBJ39DTelM8jVsT/QUNu1/QVyLIv
         ZPmWgspDyk2pizCD4lj0vjCbn/66qMLrk/Bt/wicx4Xj7oXuYxT7FQ7ihR44otI89orz
         omCg==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: NFTables Mailing List <netfilter@vger.kernel.org>

Not sure why these packages are behaving differently -- I can't seem
to figure it out. Maybe someone here can help.

https://i.imgur.com/U2nN6QQ.png

package has been purged with apt purge and dpkg --force-all --purge
iptables, and reinstalled with apt. Neither seems to make a
difference.

Thanks,
matt
