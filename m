From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: firewall without rules blocks packages
Date: Sat, 5 Jun 2004 14:19:07 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406051419.07590.Antony@Soft-Solutions.co.uk>
References: <20040605130615.10604.qmail@web20027.mail.yahoo.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040605130615.10604.qmail@web20027.mail.yahoo.com>
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

On Saturday 05 June 2004 2:06 pm, Joerg Bruenner wrote:

> Hi,
>
> I have configured iptables:
>
> Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
> Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
> Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
>
> It should be wide open. But it is not:
> If I ping from firewall-box to box A A replies the
> expected way. If I ping from A to firewall A wont
> get an answer. Firewall recives the ping packes I
> verified.
> I can play the same with ssh or telnet ...
>
> What can I do?

Check the routing tables; check that services (ssh / telnet) are running; 
check that A is not blocking packets; check the netmasks on the interfaces.

Regards,

Antony.

-- 
What is this talk of "software release"?
Our software evolves and matures until it is capable of escape, leaving a 
bloody trail of designers and quality assurance people in its wake.

                                                     Please reply to the list;
                                                           please don't CC me.


