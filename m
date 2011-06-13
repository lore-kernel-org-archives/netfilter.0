From: =?ISO-8859-1?Q?S=E9bastien_LAVEZE?= <slaveze@gmail.com>
Subject: [Ebtables configuration] CONFIG_BRIDGE_NETFILTER ebtables dependency
Date: Mon, 13 Jun 2011 15:30:23 +0200
Message-ID: <BANLkTik-boon=ACm9yEPaCV17jHQPLA01g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=u7Lwnfjzovh6szn5K9WDdkW863b9fL/L/+w/ypioIHM=;
        b=DmFe53z+57HdoBd2tgUDbZAOTt3L5KIWH8plJ53zFYJFAST8NQzk+NT4DPEY7D5c4b
         nE8cv4zZfa1whe4O/nD7DKrTVzbo/Y2Yfqyg0/gUw24rCJM0vXlqB1Rmh05l3ag2QeQ3
         PgzYkOY6+T1q1w4tHDxg+XlyeyoGbj/f9epbU=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi all,
Since a while I noticed that ebtables configuration is dependent upon
CONFIG_BRIDGE_NETFILTER.
Is there any specific reason for this ? There was not this dependency
in the past and on top of it the description of bridge-netfilter in
net/KConfig says the opposite:

"=A0Enabling=A0this=A0option=A0will=A0let=A0arptables=A0resp.=A0iptable=
s=A0see=A0bridged
=A0=A0=A0=A0=A0=A0ARP=A0resp.=A0IP=A0traffic.=A0If=A0you=A0want=A0a=A0b=
ridging=A0firewall,=A0you=A0probably
 =A0=A0=A0=A0=A0want=A0this=A0option=A0enabled.
 =A0=A0=A0=A0=A0Enabling=A0or=A0disabling=A0this=A0option=A0doesn't=A0e=
nable=A0or=A0disable
=A0=A0=A0=A0=A0=A0ebtables.

=A0=A0=A0=A0=A0=A0If=A0unsure,=A0say=A0N."

I would like to use Ebtables but not Bridge-netfilter...

Thanks,
Sebastien
