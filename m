From: <kaskada@email.cz>
Subject: batch update of conntrack?
Date: Thu, 26 Mar 2020 16:04:31 +0100 (CET)
Message-ID: <1z{.aV8H.46CnJzJxSaX.1UVCH}@seznam.cz>
Mime-Version: 1.0 (szn-mime-2.0.52)
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz; s=beta;
        t=1585235073; bh=kHnjikzX4WA6qT47KR/vERlItdk5aJZUmjByGA+77Ec=;
        h=Received:From:To:Subject:Date:Message-Id:Mime-Version:X-Mailer:
         Content-Type:Content-Transfer-Encoding;
        b=gbhwK49EHLFUrqmH5Ql8q4q8ZfKyq+3a3xWsWs3+qycfJOtAWdFc0h+3iK1DP5Yfn
         3MYOGboHaU2vefkOGh2ZaG6FbGcKeoD+CqPbp+vH1Eo+ScCYxzCSVWesJH0CJeY11z
         OD0FxTZX+Nc3N7YSOuiwmppXED+LIFs6f2CCQ+SE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I`m trying hard to find if it is possible to update multiple (tens, hundre=
ds and maybe thousands too) conntrack table flows with just one run of the=
 "conntrack -U ...". I need to massively change "--mark" parameter on some=
 of the flows depending on some external "values" I`m creating in my users=
pace scripts.

In other words, I`m looking for a way howto read a file with those multipl=
e flows prepared. I mean flows like this example:
conntrack -U -p $protokol --orig-src $src1 --orig-dst $dst1 --sport $sport=
1 --dport $dport1 --reply-src $src2 --reply-dst $dst2 --reply-port-src $sp=
ort2 --reply-port-dst $dport2 --mark 0

So, is there somethink like:
conntrack -U < ./batch_file_with_changed_mark
?

Like iptables has:
iptables-restore < ./iptables-save-restore-rules
or tc has:
tc -b ./tc_final_batch_file

Thank you
be brave...
Pep.
