From: Marco Coda <marco.coda7@gmail.com>
Subject: Re: [half_OT]Traffic shaping with tc and iptables
Date: Thu, 8 Sep 2011 14:10:02 +0200
Message-ID: <CAGRr-qnYAGqqw8pt2CAzffs+9aL9LCQ9dcVN1NL61NzKHP9ZkA@mail.gmail.com>
References: <CAGRr-qktvGncegdp+7X7Xb7Q9L0Q+FAn3+gPHGy+XJhDRtkQYg@mail.gmail.com>
	<4E688763.2060209@freemail.hu>
	<CAGRr-qm4gF8ZzvE9D5vXb-RLKXiELsj_P8KrOk9aOHTWRK01kQ@mail.gmail.com>
	<4E68A50B.5000901@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=s3FmH+LsO2KZCdQrDitP1pM8YwSLadrMb1mtWYroDEI=;
        b=KFspcbt5O3USem1UkjEOPzeZZeaJu6MwVuQ0K7XbN9Ka8P5CYEtMaFj4RH9BppXPDi
         VBbhKjbX8ZKkoO4qqXtUb4Hnu1sQyjf5TLGbpznFPzqc65PySoHPaRJYJj52YBGpwB7j
         7rFViehYqHP0QZ/aCSfEL6QTCZszao7a4Wh+s=
In-Reply-To: <4E68A50B.5000901@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

2011/9/8 G=E1sp=E1r Lajos <swifty@freemail.hu>:

> $IPTABLES -t mangle -A OUTPUT -p tcp -o $nic --dport $port -j MARK --=
set-mark 1

With this rule it does not work at all.. :(
At least before, even if I understand that concectually is not
correct, with --sport, traffic was shaped, in some manner, whth a
strange rate..
