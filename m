From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Need module help
Date: Sat, 14 Jan 2017 09:56:49 +0100
Message-ID: <fc5afaf8-5303-ac48-7683-64f474c57316@plouf.fr.eu.org>
References: <CAH-pVi-McTaVYJjvsBLbnSVk+wW2biD+0U8byK3exrFHfig1Hg@mail.gmail.com>
 <72f2e366-c823-40a6-17d6-330e803bc52e@plouf.fr.eu.org>
 <CAH-pVi-94=nY8zZJDQE_Kfq=01t9snXnBk-Rw3C8sbhsAM6i-w@mail.gmail.com>
 <20170108035307.GH8339@harrier.slackbuilds.org>
 <3d6b0822-d484-e41e-8141-94dc128b94ba@plouf.fr.eu.org>
 <CAH-pVi810QXjG5p_nhdpdGNcM2RWO7w9AZrE==t0-tzsyLEpLw@mail.gmail.com>
 <20170112181524.GJ8339@harrier.slackbuilds.org>
 <CAH-pVi838ZUeqSKZu7JiLDYjX9R2upmfKP8xH8esD9YAhVJ95g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAH-pVi838ZUeqSKZu7JiLDYjX9R2upmfKP8xH8esD9YAhVJ95g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: DOHC F22 <dohcf22@gmail.com>
Cc: netfilter@vger.kernel.org

Le 14/01/2017 à 01:27, DOHC F22 a écrit :
>
> Ok, what I'm trying to do is mark certain packets on my Fire TV (it's
> running android) so when they get to my router I can filter them
> accordingly.  I was told that MARK wouldn't travel with the packet but
> ToS would.

Indeed MARK is internal to the kernel.

So you need the TOS/DSCP target kernel module and iptables extension on 
the Fire TV Android, and the tos/dscp match kernel module and iptables 
extension on the router (what OS ?). Which ones are missing, on which side ?

