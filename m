From: Filip Sneppe <filip.sneppe@gmail.com>
Subject: Re: ftp contrack
Date: Tue, 25 Jan 2005 16:25:49 +0100
Message-ID: <9151ac2a050125072524c0def8@mail.gmail.com>
References: <22793.1106524634@www29.gmx.net>
	<9151ac2a05012504156caf097b@mail.gmail.com>
	<1106657609.22125.78.camel@nostromo.bgsecm.com>
	<1106646626.7431.1.camel@linux.site>
	<9151ac2a05012505432914ff51@mail.gmail.com>
	<1106648450.7431.6.camel@linux.site>
Reply-To: Filip Sneppe <filip.sneppe@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1106648450.7431.6.camel@linux.site>
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
To: Mario Ohnewald <mario.ohnewald@gmx.de>
Cc: netfilter@lists.netfilter.org

On Tue, 25 Jan 2005 11:20:50 +0100, Mario Ohnewald
<mario.ohnewald@gmx.de> wrote:
> On Tue, 2005-01-25 at 14:43, Filip Sneppe wrote:
> > On Tue, 25 Jan 2005 10:50:26 +0100, Mario Ohnewald
> > <mario.ohnewald@gmx.de> wrote:
> 
> The weird thing is that it works ONLY with the first ftp connection.
> If i try to upload something a 2nd time, the packges wont get forwarded

By first/subsequent connections, do you mean an ftp login, or a second
ftp GET command etc over the same master connection.
Are you able to download multiple files from within one login session ?

> anymore. I can see the following packages with tcpdump:
> (- 123.123.123.123 is the client
> - 222.222.222.222 is the FW)
> 
> 15:02:45.999772 IP 123.123.123.123.42823 > 222.222.222.222.2121: SWE
> 1965111453:1965111453(0) win 5840 <mss 1460,sackOK,timestamp 313275888
> 0,nop,wscale 0>
...
> 
> as you can see, its not even forwarding.
> /proc/sys/net/ipv4/ip_forward is turned on.
> 
And on the other NIC (that goes to the ftp server on port 21), what
are you sniffing
there ?

I see that the packets that are coming in have ECN enabled. I assume that this
isn't causing any problems ?

What does cat /proc/net/ip_conntrack show (relevant to your problem) ?

What kernel are you running ? Have you been able to test this
with a specific kernel version that is not giving you any problems ?

Can you sniff on both NICs with tcpdump with the -s 1500 option, write it
to a file (-w file) and look at this file with ethereal (or tcpdump -X). Can you
see the data ports getting rewritten by ip_nat_ftp ?
If not, and your rulebase is ok, I guess you'll have to provide your
kernel version
so people can start looking into this ...

The firewall rules you gave in your first mail, are they the only ones active ?

Regards,
Filip

