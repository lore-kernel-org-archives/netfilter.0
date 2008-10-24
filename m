From: "Servers 4you" <servers4you@gmail.com>
Subject: block tcp packet.
Date: Fri, 24 Oct 2008 20:00:55 -0300
Message-ID: <98f5d92c0810241600r7d44b366u8c0b84c917a4c8b9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=MdmxKpIZuMUj/KChQY8LCxJUN9F+h55t4ka9phHPtvY=;
        b=pncbEYAvYj9/jDMwim/jueuptl1XopRELl9lnJvP5KguHL0lqPk2F4OPwJnRrWrnj/
         xQQBKtk3rpS+TKRV6C+G/oWgWSf0W9tvSVWAN/x8Ad7KttKlbWx597L4UQT+m7HMbS7r
         +Z9NBt2sAKDvdJI6IEK7/UezmUtRfsB4bgH28=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello every one!

how can i block a tcp packet, just knowing the 4th byte its "47" and
the total length of DATA is 14bytes?

this is my packet:
aa883f 47 9434f54c9b03e8327940


thanks. :)
