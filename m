From: Jason Cosby <sky_jason@yahoo.com>
Subject: tc prio question
Date: Fri, 17 Oct 2008 01:26:34 -0700 (PDT)
Message-ID: <546364.29716.qm@web37307.mail.mud.yahoo.com>
Reply-To: sky_jason@yahoo.com
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

All,

I have a NAT box set up with individual htb user classes for about 30 users in order to regulate bandwidth. Under each class is a prio queue with 7 bands. Bands 3-7 have sfq attached. My question is this:

Will the root qdisc dequeue all of the prio 1 bands before any prio 2 bands or will each user's prio band be treated as a seperate entity? If the latter is the case, I have more work to do, as I will then, for example, have one user's p2p packets and another's voip packets being dequeued simultaneously.

Thanks,
Jason
