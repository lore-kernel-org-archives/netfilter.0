From: Mario Ohnewald <mario.ohnewald@gmx.de>
Subject: Re: ftp contrack
Date: Tue, 25 Jan 2005 11:20:50 +0100
Message-ID: <1106648450.7431.6.camel@linux.site>
References: <22793.1106524634@www29.gmx.net>
	<9151ac2a05012504156caf097b@mail.gmail.com>
	<1106657609.22125.78.camel@nostromo.bgsecm.com>
	<1106646626.7431.1.camel@linux.site>
	<9151ac2a05012505432914ff51@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9151ac2a05012505432914ff51@mail.gmail.com>
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
To: Filip Sneppe <filip.sneppe@gmail.com>
Cc: netfilter@lists.netfilter.org

On Tue, 2005-01-25 at 14:43, Filip Sneppe wrote:
> On Tue, 25 Jan 2005 10:50:26 +0100, Mario Ohnewald
> <mario.ohnewald@gmx.de> wrote:
> > 
> > by the way.
> >  modprobe ip_nat_ftp ports=21,2121
> > didnt work.
> > 
> Did you rmmod the ip_nat_ftp module before reloading it ?


Yes, i did.

The weird thing is that it works ONLY with the first ftp connection.
If i try to upload something a 2nd time, the packges wont get forwarded
anymore. I can see the following packages with tcpdump:
(- 123.123.123.123 is the client
 - 222.222.222.222 is the FW)


15:02:45.999772 IP 123.123.123.123.42823 > 222.222.222.222.2121: SWE
1965111453:1965111453(0) win 5840 <mss 1460,sackOK,timestamp 313275888
0,nop,wscale 0>
15:02:48.990185 IP 123.123.123.123.42823 > 222.222.222.222.2121: SWE
1965111453:1965111453(0) win 5840 <mss 1460,sackOK,timestamp 313276188
0,nop,wscale 0>
15:02:54.990145 IP 123.123.123.123.42823 > 222.222.222.222.2121: SWE
1965111453:1965111453(0) win 5840 <mss 1460,sackOK,timestamp 313276788
0,nop,wscale 0>
15:03:06.990205 IP 123.123.123.123.42823 > 222.222.222.222.2121: SWE
1965111453:1965111453(0) win 5840 <mss 1460,sackOK,timestamp 313277988
0,nop,wscale 0>

as you can see, its not even forwarding.
/proc/sys/net/ipv4/ip_forward is turned on.


Cheers, Mario



