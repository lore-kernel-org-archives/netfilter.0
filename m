From: Daniel <tech@tootai.net>
Subject: Deleting rules question
Date: Wed, 20 Oct 2021 19:39:37 +0200
Message-ID: <6d040689-86b0-823e-2601-6da90dd17a27@tootai.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1634751578; bh=PcE1AMlow7LIumCBB6btEXH9RBGRtQ8AykVZV49QWog=;
        h=To:From:Subject:Date:From;
        b=xBMDM5mcpPGLoUV44eTprEVO2nE8tQMq9lpC/7amK9lDkVZN4mVkXPT/4NLGq7f//
         iCXyUfDs1wWfN8LbIau37OabY0xb3FO1XflWwfIQIK/3a9mcv5/Svd6OO0smfT9UNy
         jHlT/lg17Hglzp2QMZMjPau7bdF6BHkHWM69G2ZE=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1634751577; bh=PcE1AMlow7LIumCBB6btEXH9RBGRtQ8AykVZV49QWog=;
        h=To:From:Subject:Date:From;
        b=p4GBeQzsUrdg0Js72/ZtdF5xpvtrMwlULRRWjMyoA+xPVQS+Do9D45ZoQcDTdpmpP
         6/3GTlcl+BrYe+z4p9vAvG4q4z5hrnOsGe3b6g2tR7jr05Ya1l2HFDtCfQEhhgz8OC
         GRg+6CgCXlFRt8JBbNyIUjoikoawMbInNgQBaenk=
Content-Language: fr-FR
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter list <netfilter@vger.kernel.org>

Hi,

is there a possibility to delete in one shot all rules concerning an 
interface ?

-- 
Daniel
