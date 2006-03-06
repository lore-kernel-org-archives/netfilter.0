From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: how to do a no duplicate record log.
Date: Mon, 6 Mar 2006 06:58:32 +0100
Message-ID: <000001c640e3$00947140$0101000a@sterenborg.info>
References: <40b6d52e0603051739w1ead2f5ap@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <40b6d52e0603051739w1ead2f5ap@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

netfilter-bounces@lists.netfilter.org scribbled on :

> hello,list.
>    I need record all ip that input,and log it.but if log the duplicate
> message will occupy more disk space. so I want only log one record for
> one ip, or little records. iptables can do this ? my English is
>    ugly,I'm so sorry! Please help me.

Do I understand correctly that you want each unique IP address logged
only once in the entire log ? I don't know of any mechanism that can do
this out-of-the-box.
Maybe if you use ulogd, log to a database and then run a sql job to it
at regular intervals to remove duplicate source IP's you can achieve
this. But that would be ugly. ;-)


Gr,
Rob


