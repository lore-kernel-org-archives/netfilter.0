From: "oatech" <oatech7402@gmail.com>
Subject: /proc/net/netfilter/nf_log boot setup / persistence
Date: Sun, 6 Apr 2014 18:24:04 +0200
Message-ID: <0828E69AE2D243E4AFDB81850D33C0B8@PEGGYPC>
References: <001a11c16772e52ced04f661a84d@google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:from:to:references:in-reply-to:subject:date:mime-version
         :content-type:content-transfer-encoding:importance;
        bh=wPwna7eQGu1GAbH7M6XD2H2yWO49CYugGkKzD2VJ4sc=;
        b=VE54Pk4QgeFXgA6Y9opLHh3fiFjg+cIjaVyU7KrCbVn0D8qF08jtPF//TgoGeJF3D5
         g6mtzkpfsnjHJu4PNLPr1FZ8INK9IfjGpa0LIJ6Xkw1gZImWz6F5GqJiLqBricxUeCIG
         j+FeS4LjUJMZdlMPsaWk65zQAEOYrH+LGDRj7kf1qy4aXJjNYlbN+3McVMj37XWMWUtM
         M1Hq3fscDplck6oG6KDHpn++RDpsTeoUGoocagpPoaM3IipKBTQGWg88uOLLxhowQJ1D
         uIQdN36KNkYGHgKwL1USFGLC/enVgl8pBVwbxADnm2l2l5PiRQrS02pRTG5SxtEV14YE
         DBuw==
In-Reply-To: <001a11c16772e52ced04f661a84d@google.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed	reply-type=original"
To: netfilter@vger.kernel.org



Hi

I manage to change the /proc/net/netfilter/nf_log flags using echo >=20
/process/sys/netfilter/nf_log/ ...
( For IPv6 nflogging )

But it gets deleted at reboot.
Worse, using a boot-time script fails ( the flags get overwritten )
Using /etc/sysctl.conf doesn't seem to work.

I end up using a 1minute cron job that rewrites the flags each minute.

Is there a better way ? Or a sysctl.conf kind config file ?

Thanks  :-)


---
Ce courrier =E9lectronique ne contient aucun virus ou logiciel malveill=
ant parce que la protection avast! Antivirus est active.
http://www.avast.com

