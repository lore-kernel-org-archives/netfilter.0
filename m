From: Kiernan George <kbg98@vt.edu>
Subject: Creating a map programmatically with libnftnl
Date: Mon, 27 Mar 2023 13:22:37 -0400
Message-ID: <CAOg40qgbgCoVZbv5UFhR9Gxp2MSYsAuBMs4nFeAyzj5imqSfCw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20210112.gappssmtp.com; s=20210112; t=1679937768;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qt8So4YybQScj0GBLN9HZwEoSaWwde8R2ro4twtbJ88=;
        b=Vv8CExMle0ATXXBi5Mn5DqzgkCZ3bh5GrUu+7zUC0ND/zCAtnxrLQMJRHeBQ21WSBh
         R5V33dMHePIXa7MhdY7biPJ2P2x2q8opfEzSOhRIjzFdTWvJ5v3RLVToSLTEQcc0YM7S
         +KFW9Yb6b9J41kaLripLTaKZz+tgysedZn5cpf3le5rw28nhlC1HiV37AEXvj4c8XnAM
         fixalV2u/JVJBvkHVer/HAq11TwwJf0V2cSMk4T44SmDPj10RZTQ8BZTVPH+THGpqMDM
         oJ39rLa9RxiF7KZWb5wSO93jjQAZ0Ungy0bIGrubVnkoZamilLlQV5RShPFThmcTNr/x
         aVAw==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello,

I asked this on 2022-06-30, but never received a response. Could you
post an example using the libnftnl functions to create a map of the
following type and insert elements:

type ipv4_addr . inet_service : ipv4_addr

I see an example for creating a set, but I can't figure out how to
create a map and insert elements into it.

Thanks,
Kiernan George
