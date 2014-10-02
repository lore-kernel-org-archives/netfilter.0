From: Al Grant <bigal.nz@gmail.com>
Subject: ban traffic per country
Date: Fri, 3 Oct 2014 06:27:10 +1300
Message-ID: <CAODtcdfJrgtXcoQUVkJ=kcUuf-p1MkVnz8DDqLXdSEyMkYzH7A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=njyRVaM88Udg0cXhu8TZH1myeUTh3/j/oRvyK7shHE8=;
        b=zlvsWaIXBNNFeLr/o1qLsr+97Liaj7/xitxKcxLWzCItKhAoNAj0rLLe+EEHiso7cD
         58VOULl5VbFHxLxmoZm6pRGvE9x37saCzfkllABU/7KYouui4cojA+LRwxn5TYaYVdM6
         sYymQYVEqx+eDaTxRm0zBYNbuFqhQUU4g9W0ENBLh9cA3oqk79fXvjByS6kiw0Zxqzea
         nrws+GxByc/AIrqJG3LlED4tlAsWqxJqJAtsEMOvvc9jDEKIF0Fz/DNxD+LWYjvExhIC
         C1KpN1By8TnKe/hcPFonzCnAeBqNxbs1qLB6POYMtd+HslKbf6nYeDoXXV7zIZ1mmKEM
         iFPA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Hi All,

I have a Amazon instance running asterisk. I think it also has fail2ban running.

I want to lock it down a little as I have opened up some ports for
asterisk to run.

In essence no traffic should connect to it except from my country .nz

Is there a way to do this? I see a few websites list some very long
lists of iptables per country.

Cheers

-Al


-- 
"Beat it punk!"
- Clint Eastwood
