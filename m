From: Eric Grunt <gruntblue@gmail.com>
Subject: Re: How to get rule handle when adding a rule using libnftnl?
Date: Fri, 2 Feb 2018 13:06:39 +0300
Message-ID: <CADB9fJEtosymEskm-uLFU=KpEMNQi5OWeDC+2C8xx=v8yuzk5w@mail.gmail.com>
References: <CADB9fJF-rpjBo=DXeO7sxeH-9U4y5LytGWba5nUG_xfPkar-qg@mail.gmail.com>
 <20180201170614.7aiziqewvivb5eqw@salvia> <CADB9fJGJfSDpoz+DCTXjfw9+ZoTD2Sm27rWx7_Pbi6q-YMVyVQ@mail.gmail.com>
 <20180201182037.recv7u3ava6ohmc2@salvia> <CADB9fJH1AF_USe5B7pXComZk5zHMOU3q2LCGGm=9Yee8Y4X=gA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
        bh=8cKMJu6UHCSusqS4oMcHKCNLWfSdJUPVoa01xF/i/ow=;
        b=g1RETiacL5ZIuqFXyMLjq+we7sGuZgqOB2TDqB5H9hdZ+GPLfaBhLiwo9VtS+GY6MI
         rgrEOo45NwYVVCFvhXgeYy/NsGHjry2jG6Lc0tIXyABWArlXLqVOAVCAvY92y+L1ueoF
         g9VvvUaatqlWJtFoYePfXu9eFHsGnuztOk0se1r/W9WyLD64C56JQclrp8qEByu8sJJk
         QcRSKP4ERENThYFneuzo0Fc/KxkOFZkhlNG3lKJzUkukpBzcwqqFjdq5riIvcBFx3lEX
         MfGM4skUUGOoDUpYUvxU1vzWJrERueJkYBMoyPZpPLC/ms5/2/tmEXAzYbjtmzKSn/Va
         ThEg==
In-Reply-To: <CADB9fJH1AF_USe5B7pXComZk5zHMOU3q2LCGGm=9Yee8Y4X=gA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Thank you.
Worked perfectly by adding an own callback
and using nftnl_rule_get_u64(t, NFTNL_RULE_HANDLE));
