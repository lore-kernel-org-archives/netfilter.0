From: ml ml <mliebherr99@googlemail.com>
Subject: looking for a very simple web/php firewall builder
Date: Sat, 27 Aug 2011 10:40:32 +0200
Message-ID: <CANFxOjAJt4JN3UWaZtagSxCVC9DvuRzzHCch452=afKUu-OeYA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=q4WHmXZtVy8gihB0gvU4Oeuoz7PfdqUNDGi8TcFC7Jk=;
        b=JdzBb9lb+XbelpfDNaN4dtcd8v/3b00kED1C4bEiiUwypd22ahO4+JiG1+R3Y4I5xc
         83o+QslM3oXwFk0BpM+8jYf1Hz39RQ1sfKlsMVVCFnag4mh5A+9rfRwywEkF3skpptz0
         FXCwDut8n0KVIFD8eGHyRbavnWxbXaKKCQhDE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello List,

i am looking for a very simple "php firewall builder".
I only want to manage simple FORWARD chains like:
 -A FORWARD -s 192.168.0.1      -d 123.123.123.123 -m tcp -p tcp
--dport 21 -j ACCEPT
 -A FORWARD -s 192.168.0.0/24 -d 123.123.123.123 -m tcp -p tcp --dport
25 -j ACCEPT

Does someone know a nice project which handles this?

Thanks,
Mario
