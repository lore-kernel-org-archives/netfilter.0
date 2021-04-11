From: Frank Wunderlich <frank-w@public-files.de>
Subject: device list reversed
Date: Sun, 11 Apr 2021 15:07:41 +0200
Message-ID: <trinity-199f77e0-dc05-45d9-85a6-3b583adcee10-1618146461717@3c-app-gmx-bap41>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1618146461;
        bh=bR3En2d4XwFYkIhXFzK0OPUKrCgOykHW4QxHwGTA+uk=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=W06M8s26Rf7gUJ3Eik7Rxb3+IyBS6+Wrzn89XVRXbr1IDBHguY+VCOUSj4NaEA+h1
         xiqDuXXxT32uz1+AFVJVpHpe59cPVp8rvx6FAMKRV5rW8XNkKa3/LuzoUgjWoJxLS2
         +byO4ZqJSgG7UiDTbCESJvjIs2e4hXSVwGQrUDNg=
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

i import ruleset by file with a devicelist (flowtable)

devices = { wan, lan0, lan3 }

and if i do a nft list ruleset, it gets reversed

devices = { lan3, lan0, wan }

imho this is a cosmetic thing, but strange anyway

took a look in ./libnftnl/src/flowtable.c but it seems the loop is always done in forward way

any idea why this happen?

regards Frank

