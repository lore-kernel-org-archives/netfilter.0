From: "Hurley, Michael" <MHurley@law.uconn.edu>
Subject: RE: logging to console
Date: Wed, 17 Dec 2003 13:14:00 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <AD8D39C727CBD411BB2C0090273A727408F9ED5B@mortimer.law.uconn.edu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Actually, I got a response directly to me that solved the problem. This is
effectively dumping all my iptables messages to their own log:

>I set my logging in my firewall script to
>iptables -A FORWARD -j LOG --log-level 7 --log-prefix "FORWARD: "
>
>Then in /etc/syslog.conf:
>
>kern.7	-/var/log/firewall
>
>On a side note in /etc/sysconfig/syslog I modified the -c parameter, this
>controls the console logging level.
>KLOGD_OPTIONS="-x -c 4" 

I didn't bother tinkering with klogd, but I thought I'd reproduce the
message I got in full for anyone else who might find this as useful as I
did. 

- Michael Hurley


-----Original Message-----
From: Laurence J. Lane [mailto:ljlane@nontoxic.org]
Sent: Tuesday, December 16, 2003 6:34 PM
To: netfilter@lists.netfilter.org
Subject: Re: logging to console


On Tue, Dec 16, 2003 at 05:19:31PM +0000, Antony Stone wrote:

[ re sending netfilter logs to a separate file ]

> I thik several people would. It's come up a few times before on
> this list. Short of delving into the netfilter source code, I
> don't know of a way to do it.

syslog-ng may interest you.

