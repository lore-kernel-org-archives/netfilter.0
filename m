From: "AragonX" <aragonx@dcsnow.com>
Subject: Re: Problem reexplained.....
Date: Tue, 27 Sep 2005 13:30:08 -0400 (EDT)
Message-ID: <1308.10.1.1.1.1127842208.squirrel@www.dcsnow.com>
References: <65aa6af9050927092673267410@mail.gmail.com>
	<20050927164947.43318.qmail@web54709.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050927164947.43318.qmail@web54709.mail.yahoo.com>
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

<quote who="Alaios">
> I have restarted my pc just for being sure.. i have
> run your commands but the tcpdump -i eth0 -vv -n give
> nothing :(
> it doesnt work :(
> I think its time to start debugging. plz suggest me
> how to  use efficiently logging so as to find out what
> the is the problem

I'm very new to iptables so I can't be of much help in that way.  The
first thing I was thinking you should check is if you can communicate with
any machines at all.  How are you connected to these machines?  Through a
hub or directly.  If directly, are you using the correct crossover cable?

I'm guessing both machines are running Linux.  Some have built in
firewalls that like to take over at random intervals if not turned off.

I would make sure your hardware is connected correctly then make sure your
iptables is clear(iptables -L & iptables -t nat -n -L).  Then ping a
machine on both interfaces.

Once you are sure that you can connect to machines on both interfaces,
then start working on your rules.

I'm sorry if this is to basic and you have tried all these things.  :)




