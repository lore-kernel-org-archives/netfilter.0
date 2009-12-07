From: Ilya Barsukov <mzfk.0xff@gmail.com>
Subject: Dynamic bidirectinal nat. Possible ?
Date: Mon, 7 Dec 2009 17:54:24 +0500
Message-ID: <14434f350912070454s38ec6903wcd78e0679ac0859d@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=Eqpq4tBQj44jvavLrPrVp/zoapLV7lyiWTcNOiypwC4=;
        b=TAZGjYKBK+YidNBxETOhj2thr0NJsyU08p/UgnQtS6jwww7te7575aQZpQKgiOoYwE
         FgUf4LOf0skpvFIAkQobUbIwJio9KOpBp8fMLrJGlWMci3t4zSnVO8LrVUYAowvF7vMD
         dq+r0fCPCQQHj9loL+EynTEPsvKdgeShF4Kfc=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi guys, i search for analog Cisco dynamic binat for iptables and
didn't found anything about it. It's really doesn't exist some
implementation of this mechanism ?
I have a simple task: create binat for three "/16" networks into one
"/16" network, i don't know how to get this with static translations
(e.g. NETMAP), i think, it's possible only with dynamic nat.
