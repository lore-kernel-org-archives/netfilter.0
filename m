From: "Karel Rericha" <karel@maxtel.cz>
Subject: Re: tc prio question
Date: Sat, 18 Oct 2008 11:14:40 +0200
Message-ID: <5b19ed110810180214p262b164ck2dce2f783c2faded@mail.gmail.com>
References: <414838.70443.qm@web37302.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <414838.70443.qm@web37302.mail.mud.yahoo.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

2008/10/18 Jason Cosby <sky_jason@yahoo.com>:
> Probably a better way to have asked this is:
>
> In the case of multiple sets of prio queues under related htb classes, will the root htb qdisc dequeue the highest priority bands globally and evenly across all bands of the same priority or will each incarnation of a prio qdisc be dequeued autonimously?

autonomously

I would bet fine beer on that :-)

Karel
