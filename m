From: Michal Soltys <nozo@ziu.info>
Subject: Re: IPMARK
Date: Sat, 20 Sep 2008 14:24:03 +0200
Message-ID: <48D4EB63.8010707@ziu.info>
References: <397309.80901.qm@web37302.mail.mud.yahoo.com>	 <48D36195.1060404@ziu.info> <66c343c00809190152j4a3789f7ue7d231c0afa40f65@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <66c343c00809190152j4a3789f7ue7d231c0afa40f65@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: julien vehent <julien@linuxwall.info>
Cc: netfilter@vger.kernel.org

julien vehent wrote:
> So CLASSIFY can do it too...
> Are you aware of any performance difference between MARK/tc filter and
> CLASSIFY ?
> 

Not really. Both MARK and CLASSIFY mainly differ by the field they set
(respectively: skb->mark and skb->priority, after quick peek over the 
code). So - not much of a difference between those two, except that MARK 
allows for some extra functionality.


