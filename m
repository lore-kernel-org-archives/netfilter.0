From: Anatoly Muliarski <x86ever@gmail.com>
Subject: Broadcast redirecting
Date: Thu, 13 May 2010 18:52:42 +0300
Message-ID: <AANLkTikn9mpzLV3YRvtvwQSIlX31ZZBmWItU8tgf9QkV@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=PRyWOSpFA3PbX4wyXPHjQue+AsHavKP/nbUf5NWwzYw=;
        b=ccJ5hrWyoRT3iT/zVO9Vv124yPjnqwTofvaUEHqG+Dezf4cD9HY3qXibItrAjn93xf
         VNuNnt0X+QvX3GW7yfOtB+GaLDhxAcQCJtQZr3VjZ+PB28ozlTtlAmAxJskkv3UP/UC0
         5fHbe0+owijtntNCqyWu64Eh4o77w9U0YWwsc=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi list,

Is it possible to redirect broadcast packets( with dst 255.255.255.255
) received on one interface to another?
Or should I use some standalone program?

-- 
Best regards
Anatoly Muliarski
