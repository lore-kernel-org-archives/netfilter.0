From: Varun Tewari <tewari.varun@gmail.com>
Subject: Ip route flush table X doesn't delete the table?
Date: Fri, 20 Jan 2023 18:20:58 -0800
Message-ID: <6D13FE0F-07AA-496F-902A-E7F43436A39B@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ci7bu4ohjpiMG/6AbciF4NlErzj9AKhrfgT5wAMOC6k=;
        b=SVe9JbIZB/Ou6e004tNBAmaLMNNcMbL+etTyY+YwYIfqeoH+asLi+mWawmelMYIpG5
         1V+cIZY6Z9LjKc7ECBhccDo6k1/Dt/rTAVIJ4O4/Icm715g6XgcpktgbJJ6xsDTYGNSm
         brKrEo22PhRKVQPTbHlN3v+mFRjVJ8VoOFZTSe8kOJNoRrzU4NtB88yOCSfG6bbhEBr3
         rUy9yVl1S8Z3G9Ds1mb6+fdNycKzlFUdXRqKxSQCaRLIZlpbS+rio6KB1VBnnCAlXDzp
         Mx8UU30C2sFm/C7VudhFOc3PgRQmRNh22YnYwIhh1jWBZgoi49hOkCigKuorsUheFPAq
         cDyg==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hello All,

I stumbled on this lately.
We have a system where we use policy routing tables extensively.
We treat them as use and throw, therefore we create them, install the =
needed routes and then when the job is done, we delete the route from =
the table and also the policy rule tied with the table.
We use ip route flush table to clean the table and to delete the table =
as well.
As expected, this leads us ending up creating huge chunk of tables on =
the system.
Lately, its been found, that the tables that we flush appears as if they =
are not deleted.
They are definitely empty, but aren=E2=80=99t deleted (ip route show =
table X, dumps empty, not the error dump terminated) and therefore exist =
in the hash map, leading to cpu spiking in fib_get_table().

Is this expected, or we doing doing something wrong here ?
I probed fib_frontend.c and fib_trie.c in the kernel tree, and as far as =
I can see, it appears the tables are deleted only on netns exit.

=E0=A4=B6=E0=A5=81=E0=A4=AD =E0=A4=95=E0=A4=BE=E0=A4=AE=E0=A4=A8=E0=A4=BE=E0=
=A4=8F=E0=A4=81,
Varun Tewari

