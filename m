From: "Juan Cardoza" <ing.jcardoza@gmail.com>
Subject: I want to connect a PC from Internet to my LAN (Asterisk server)
Date: Sun, 20 Sep 2009 18:01:24 -0500
Message-ID: <4ab6b447.151bf30a.1393.ffffc3ea@mx.google.com>
References: <4AB6A1EE.1040201@gmail.com> <4AB6A375.2070801@standarduniversal.com.au> <4AB6AA79.3090302@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:references
         :in-reply-to:subject:date:message-id:mime-version:content-type
         :content-transfer-encoding:x-mailer:content-language:thread-index;
        bh=J6DFZsG+IdXXCvq++EnS+ma4HePlUsRXP+pRJlPqoaE=;
        b=HsG56NDSrsnPvHUuGln6Hgs6bYsFeCtKCv4SA4OuDQ8WwFqEUOiD2UqsXbgxWqxEXN
         o4Eagu5a/H3/pBkck7N2+5lxtXlHEBK8KGQfENWcTW3ZWm4EcWIVzGuPrlrRK5Ukm3Hz
         C1DWBecdk6B9C9cP5UDOhgQKiC35yuV0ijiYM=
In-Reply-To: <4AB6AA79.3090302@gmail.com>
Content-Language: es-mx
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello I am been looking in the internet but no one option have worked.
I want to connect my xlite softphone through the firewall that have an specific IP (xx.xx.xx.xx), the firewall is reached from the internet, I can connect to the firewall via tridia without any problem.

Now I want to connect my softphone to the asterisk server into the lan, the server have the ip (yy.yy.yy.yy)
In first place I want to allow all port from the asterisk to the remote softphone to check all the services.

Is there a way to configure this requirement into the firewall to let the softphone to connect to the asterisk server passing trough the firewall.
The softphone have the ip address zz.zz.zz.zz, so the connection would be:

zz.zz.zz.zz ----> xx.xx.xx.xx ------> yy.yy.yy.yy
yy.yy.yy.yy ----> xx.xx.xx.xx ------> zz.zz.zz.zz

Please let me know if someone can send me some information about how to do this changes.
Thanks for your help.

