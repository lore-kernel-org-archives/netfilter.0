From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <zenczykowski@gmail.com>
Subject: Re: [Patch net-next] netfilter: remove xt_NOTRACK
Date: Mon, 3 Sep 2012 17:14:45 -0700
Message-ID: <CAHo-Ooy=fg23B5TU7vL95V_-W=Fq+qxHFiycWwPGYBwrfVFdzQ@mail.gmail.com>
References: <1345962219-2999-1-git-send-email-amwang@redhat.com>
	<CAHo-Ooz0SDBZTvBKRR-bZs0wHk25bSLaYgUYF0njUgxY8iGWpA@mail.gmail.com>
	<alpine.LNX.2.01.1208262201520.32152@frira.zrqbmnf.qr>
	<CAM_iQpU2GPgHP1BVfL_JL6dadjHeiU08en+UpAicjmH3H0QX5Q@mail.gmail.com>
	<20120903153121.GA19926@1984>
	<20120903192455.GA3527@1984>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=eY1PphNantC14r5mJNpSBdYjiXVnsC6QZ8r8040lJZs=;
        b=uWvxmCClpw97hLOXk1RoW5vN5gZ0U1Qu/Kkb/c28HDW9EGWQWYz+759ZInN6XzX55m
         GgLDVN0fqQNQkJEOxtZSNWbfJyXWFxxOpnb6d/dERBQR49tLZ8ShICbhDaU42XwX5FCo
         LanhZtp2AojE2Nf25oLH1o12pm7gAOH/LcI+uHXD8Cq1jovfbky8HaUQQYNiSU1iXPVm
         Hb4CdfE/V236WBizdekFhHahf4vpENR1bUesel6EBO+OfFtzw7jp5g6GIfp0WATvDmoc
         6McufAqtQQPrC4PnC/q6v1NIGpZ48bbmwG0RrnRPJNihvdSBvneS4Move5+ZzYGdhwRP
         XEWg==
In-Reply-To: <20120903192455.GA3527@1984>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Cong Wang <xiyou.wangcong@gmail.com>, Jan Engelhardt <jengelh@inai.de>, Cong Wang <amwang@redhat.com>, netfilter-devel@vger.kernel.org, Patrick McHardy <kaber@trash.net>, "David S. Miller" <davem@davemloft.net>, netfilter@vger.kernel.org

+<----->if (cs->target->alias == NULL)^M
+<-----><------>strcpy(cs->target->t->u.user.name, cs->jumpto);^M
+<----->else^M
+<-----><------>strcpy(cs->target->t->u.user.name, cs->target->alias);^M

I'd have probably written if (cs->target->alias) copy(alias) else copy(jumpto)

doesn't this all really belong in the CT files now?
ie. libxt_CT.c not libxt_NOTRACK.c

Either way, LGTM.
