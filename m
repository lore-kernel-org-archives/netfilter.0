From: =?ISO-8859-2?Q?Micha=B3_Sewera?= <michal.sewera@gmail.com>
Subject: conntrack-tools: conntrack -L --> Operation failed: Connection 
	refused
Date: Tue, 1 Sep 2009 15:30:21 +0200
Message-ID: <875a14c20909010630s7500ca60hcb9084641a338211@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=29Gihl64pE82LUEs+eS8bCvS4i9ZJsNBYRd72KRKIv8=;
        b=WtAa+9FT7EQzx4qd36iBZIJWRxcNIpBsdAvXz5BzshveNCdhI5byabnkHe7Df9HQy3
         mkDUS+ZomFZ4EA6LnAIjIdL3Epumn28RAkK62ft6aK/iofHTohItrAjd0zXaIfTspNYA
         nEHJl2DUZmvQwn2z4izp5GI3xlcXOZNHKOuPA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I'm using the conntrack-tools Version 0.9.4 and linux kernel version
2.6.23. I've installed libnetfilter_conntrack and libnfnetlink, but
for conntrack -L command I have following error:

/ # conntrack -L
Operation failed: Connection refused

For conntrack -E I have:

/ # conntrack -E
conntrack v0.9.4: Can't open handler

Does anyone know what could be the issue ?

thanks
m
