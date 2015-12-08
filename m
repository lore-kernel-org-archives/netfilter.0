From: Oliver Graute <oliver.graute@gmail.com>
Subject: Re: Marking frames with ebtables for iptables
Date: Tue, 8 Dec 2015 08:10:49 +0100
Message-ID: <CA+KjHfYpF8tJD0QcDagTucLuYgOqL60J13K2iHHmKUyLcJyAqQ@mail.gmail.com>
References: <loom.20151202T145721-935@post.gmane.org>
	<5662CACC.9010809@plouf.fr.eu.org>
	<CA+KjHfaK=qGZAvwCEZ1XNGcLBSQ6VE9z69E0XSxX_mfkHQ8TgA@mail.gmail.com>
	<56660A8F.2000802@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=iUID0zuu5cPGfVyFZWqHxNL74/eUyuEUbQHtl7fBRZU=;
        b=cdnmKpa0fVjs5s9nZCwY/66hSEy9FhmrXPKitsJMA3VdFDzsgl0rLA5IaLhp7g45jX
         0FYdYENwRgEoApzhbF2pZbluT22BAOUW7C3eUjOZAOc7drUHVIfAo9jzrrrxnf5QAGrN
         yoSInrCUFSQHGkx+QDqErSJ+cAEmJ7x2wMN+wnBaENBl2q9XxacyStN2wE/S50ixTyWJ
         vC9xqYZdHCBnMSkyYjEHeZXGSzIf9vHlCE34W/hKAxWBuIuTd4/TtWwubgRypPmapmgu
         DJkRvbCY/FY2zVU273PZ4IAIq83va713z8ll3ZW0a8oBHbXHB8rCd4BsZ239QmNmsm0+
         dIDA==
In-Reply-To: <56660A8F.2000802@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

> I don't know what the PCP field is. Is it the same as the 3-bit user
> priority field in a IEEE 802.1Q header ? If so, you can use the vlan
> match in ebtables.

yes these are the right ones.

> To set TOS bits with iptables, you can use the TOS or DSCP target.

I'll try thank you

Oliver
