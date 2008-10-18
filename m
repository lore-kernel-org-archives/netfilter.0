From: Jason Cosby <sky_jason@yahoo.com>
Subject: tc prio question
Date: Fri, 17 Oct 2008 17:34:48 -0700 (PDT)
Message-ID: <414838.70443.qm@web37302.mail.mud.yahoo.com>
Reply-To: sky_jason@yahoo.com
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Probably a better way to have asked this is:

In the case of multiple sets of prio queues under related htb classes, will the root htb qdisc dequeue the highest priority bands globally and evenly across all bands of the same priority or will each incarnation of a prio qdisc be dequeued autonimously?

Thanks,
Jason
