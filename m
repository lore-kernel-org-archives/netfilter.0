From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Logging
Date: Mon, 15 Mar 2004 16:08:12 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403151608.12073.Antony@Soft-Solutions.co.uk>
References: <1079365863.2163.8.camel@vejan>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1079365863.2163.8.camel@vejan>
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

On Monday 15 March 2004 3:51 pm, Mario Udina wrote:

> Hello!
>
> I have done some googling however did not manage to find out if there
> is a way to define a file where iptables writes its logs.
>
> As I read in the man the file where the logs are written is the kernel
> log i.e. /var/log/messages
>
> is there a way to send this output to another file in order to keep the
> logs clean?

netfilter logs via syslogd, therefore by changing the --log-level option to 
the LOG target you can get messages sent to some other file as specified in 
your syslog.conf (however you may not be able to keep them *completely* 
separate from other messages, depending on how you arrange syslog.conf).

If you want to change the syslog facility as well as the level, which is the 
ideal solution, you'll have to hack the netfilter logging source code :(

Antony.

-- 
The first fifty percent of an engineering project takes ninety percent of the 
time, and the remaining fifty percent takes another ninety percent of the 
time.

                                                     Please reply to the list;
                                                           please don't CC me.


