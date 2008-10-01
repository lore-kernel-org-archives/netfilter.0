From: "Servers 4you" <servers4you@gmail.com>
Subject: --hex-string help with offsets.
Date: Tue, 30 Sep 2008 21:07:36 -0300
Message-ID: <98f5d92c0809301707j4d762534n3f83cab9f8088613@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=AwkMuAFD82f5h/46cADBXxQO/cKSpAc2CBcviJRsbLs=;
        b=UBykefuXvwGGhnQb850rMq4CcNsXDCZuu6q3BuJptd6IvS0I/iRuAwdPHpCq2N/mCd
         j8cn9ADP4wnNjW+j7ZuNLIgb4yols2h67SjCrVKWOn2MQeONKInFq/vcQPimLEMSP7DG
         p1pUTKyc3Gsoais4IBdenpm0pYlSPC03jcm0c=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I have this packets:

8365 3f47 e5aab87c3563bb7885a2
f76f 3f47 c58b189164198aabb126
fc6a 3f47 c572c0cc0bcf542e32f3
a988 3f47 2c3873bae9432f448c97
9688 3f47 85dac8c05a130798cbbc

like you see the package just repeat 3F47 in the same position, that
why i use --hex-string becouse this packet come from any ip.

Iam ussing this rule atm:

iptables -A INPUT -p tcp --dport 38500:38600 -m string --hex-string
"|3f 47|" --from 42 --to 44 --algo bm -j DROP

but im not sure about if gonna work.

I need some info about, how check the offset from where start --FROM
and --TO or another way to do this.
I ust get 42/44 makeing test, but i dont have a good idea about how
works the --from --to system.


thanks in advance.
