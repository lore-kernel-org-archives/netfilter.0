From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Packet forwarding.
Date: Wed, 7 Apr 2004 18:14:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404071814.34654.Antony@Soft-Solutions.co.uk>
References: <1081357206.4074339639b86@mail.tscnet.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1081357206.4074339639b86@mail.tscnet.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wednesday 07 April 2004 6:00 pm, bdameron@tscnet.net wrote:

>  I have 2 linux machines. One is accessable via the outside world (Internet
> machine) the other has no outside connectivity (LAN Machine). I need to
> redirect port 443 traffic to and from the LAN server via the Internet
> machine. Is this possible with Iptables?

Yes.   Have you read any of the tutorials or HOWTOs available from 
http://www.netfilter.org to find out what it can do and how to make it do it?

> I have setup packet forwarding but then the LAN server tries to connect
> directly to the client machine instead of to the Internet machine. Any
> direction appreciated.

If you tell us what your rules are and give us some more detail about your 
network setup, we might be able to help, however a better solution for you is 
to look at some of the excellent documentation available to learn how to do 
it yourself.   This is not a hard problem, and you will be able to manage 
your system much better in future if you understand more about how it works.

One very important detail which is not clear from your description above is: 
where is the "client machine" located?

Regards,

Antony.

-- 
In Heaven, the police are British, the chefs are Italian, the beer is Belgian, 
the mechanics are German, the lovers are French, the entertainment is 
American, and everything is organised by the Swiss.

In Hell, the police are German, the chefs are British, the beer is American, 
the mechanics are French, the lovers are Swiss, the entertainment is Belgian, 
and everything is organised by the Italians.

                                                     Please reply to the list;
                                                           please don't CC me.


