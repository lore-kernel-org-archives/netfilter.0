From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: SUN RPC portmap
Date: Fri, 25 Jun 2004 18:59:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406251859.23966.Antony@Soft-Solutions.co.uk>
References: <200406251600.i5PG0vD4005549@ylpvm29.prodigy.net>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406251600.i5PG0vD4005549@ylpvm29.prodigy.net>
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

On Friday 25 June 2004 5:01 pm, Spiro Azkoul wrote:

> Can anyone think of a reason to simple block SUN RPC via iptables rather
> than simply stopping the service if it is a mail/pop/imap/web server?

Disable and uninstall any service you do not require on a machine.

If you want the machne to run mail/pop/imap/web, then there should be no ftp 
server, no telnet daemon, no finger service, no daytime service, no 
portmapper (rpc), no file sharing.....

You might want to leave sshd running on the system, though :)

Regards,

Antony.

-- 
"The joy of X!!??  I've always hated compiling graphical shite.  You have a 10 
line program, and it ends up depending on the entire known universe."

 - Philip Hands

                                                     Please reply to the list;
                                                           please don't CC me.


