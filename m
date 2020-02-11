From: =?UTF-8?B?7JaR7Jyg7ISd?= <ileixe@gmail.com>
Subject: Does anybody experience kernel crush when 'ebtable -t nat -L'
Date: Tue, 11 Feb 2020 20:57:35 +0900
Message-ID: <CAFAx9aaiv4dK6Om0kkaGfzxiOY9CDGbzXtube5LLVBiA3pbMxw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=J97ucEATN7+TdWcwMnX5nUtGLUHCDKBklVbpXrQGMRs=;
        b=TpwaNOOfHN4EeHrEwhlk4NAe++HiVGGr7ydxx2QUoQU1F/WOK9CM1KILxAEad54Y4G
         YqnK5zFJCUVIJXb/yhis2RHOsKoiaLDJQLrt+7j1Ov9MM/wZR4lo+gS8XAJL3jbrutpH
         JHjA5NjNZcIeqWomtLDLtXjOozMib07VSjYB47kD1w3K8aLEdKBeY+JEZ5ImgiLr7Mou
         rFdJi6fpcA9jNPIPIzC1zsA0Vw1irnvzLV6eTf2SM8r3KDwwF8p8e2xDP2999et5lRTl
         5RcEMFvwo9oxeyfcPymCqyFGtf7LjHNXtIJqPhIQ9Bgk5xfCXgzyh35Pd28fXHMKni+9
         N6pQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi netfilter,

I encountered strange kernel crush using ebtables, and did not find any clue.
Our cluster keep crushing so please shed light on me if somebody has
some exprience.

Current our environment is

- ubuntu xenial kernel 4.13
- openstack stein
- ebtables version 3.10

From today, we even does not know what makes crush since there was no
any log (literally kernel, application or something) Only that we
encounter is when linux bridge agent in openstack restarted, server
reboot without any log. After reboot, we see strange null string (@)
in syslog. (Google says it kernel failed to write file because of
unknown crush but no detail)


We tracked what excutable makes crush using bcc execsnoop, and finally
find ebtables!

To be sure, I just ran simply 'ebtables -t nat -L'  , surprisingly it
do make panic just like before.

More hints to consider
- We run the command over 400 computes and only 10% (about 40 servers) crushed
- After crush, server never crushed anymore with same command
- We never used ebtables command, so there were no rules. Ebtables
module itself insmoded but not ebtables_nat .

 I dig ebtables client and kernel module codebases, but from my
knowledges I could not fund which can make panic possibly.

Does anybody can guide how netfilter make crush? We are so desperate
to find clues so any help will be really appreciated.

Thanks
