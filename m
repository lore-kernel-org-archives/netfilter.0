From: Eric Ellis <eellis@mail.co.gilchrist.fl.us>
Subject: Re: More neqbie questions
Date: Mon, 02 Aug 2004 15:50:21 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <410E9AFD.90500@mail.co.gilchrist.fl.us>
References: <410E7DFB.9000505@mail.co.gilchrist.fl.us> <200408022003.54833.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200408022003.54833.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Antony Stone wrote:

> On Monday 02 August 2004 6:46 pm, Eric Ellis wrote:
> 
> 
>>This is one of those things that's been hounding me for the past few
>>weeks that I can't understand what's *exactly* going on...
>>
>>I've been using the IPTables tutorial from
>>http://iptables-tutorial.frozentux.net/chunkyhtml/index.html, as has
>>been pointed out and recommended by many of the list's pros.  It's a
>>great tutorial, and I highly recommend it.
>>
>>However, I have either glossed something covered in it, or I have a
>>fundamental misunderstanding of some part of IPTables.
>>
>>I know that the route works.  I've verified it.  I can move IPTraffic
>>when I set all of my policies on my filter script to accept.  However,
>>when I set my policies on my script to drop, Nothing talks any more.
> 
> 
> My recommendation is to put a LOG rule at the end of each chain, just before 
> the default DROP policy takes effect, and you'll see what packets are getting 
> that far and then being lost.
> 
> Regards,
> 
> Antony.
> 
Now here's something interesting that I discovered when you mentioned 
it...

<code>
root@firewall:/var/log# tail syslog -f|grep 10.1.1.100 

Aug  2 13:41:38 firewall kernel: IN=eth1 OUT=eth0 SRC=10.1.1.100 
DST=212.19.193.43 LEN=48 TOS=0x00 PREC=0x00 TTL=127 ID=
49518 DF PROTO=TCP SPT=3571 DPT=80 WINDOW=64240 RES=0x00 SYN URGP=0 

Aug  2 13:41:41 firewall kernel: IN=eth1 OUT=eth0 SRC=10.1.1.100 
DST=212.19.193.43 LEN=48 TOS=0x00 PREC=0x00 TTL=127 ID=
49558 DF PROTO=TCP SPT=3571 DPT=80 WINDOW=64240 RES=0x00 SYN URGP=0 

Aug  2 13:41:47 firewall kernel: IN=eth1 OUT=eth0 SRC=10.1.1.100 
DST=212.19.193.43 LEN=48 TOS=0x00 PREC=0x00 TTL=127 ID=
49660 DF PROTO=TCP SPT=3571 DPT=80 WINDOW=64240 RES=0x00 SYN URGP=0 

Aug  2 13:42:17 firewall kernel: IN=eth1 OUT=eth0 SRC=10.1.1.100 
DST=66.35.250.151 LEN=48 TOS=0x00 PREC=0x00 TTL=127 ID=
50070 DF PROTO=TCP SPT=3579 DPT=80 WINDOW=64240 RES=0x00 SYN URGP=0 

Aug  2 13:42:20 firewall kernel: IN=eth1 OUT=eth0 SRC=10.1.1.100 
DST=66.35.250.151 LEN=48 TOS=0x00 PREC=0x00 TTL=127 ID=
50113 DF PROTO=TCP SPT=3579 DPT=80 WINDOW=64240 RES=0x00 SYN URGP=0 

Aug  2 13:42:26 firewall kernel: IN=eth1 OUT=eth0 SRC=10.1.1.100 
DST=66.35.250.151 LEN=48 TOS=0x00 PREC=0x00 TTL=127 ID=
50187 DF PROTO=TCP SPT=3579 DPT=80 WINDOW=64240 RES=0x00 SYN URGP=0 

 
                                                  </code>

It appears that all of my HTTP packets are making it through the chains 
without being picked up by my redirect rule.  The same appears to be 
happening with mail.  I put the LOG at the end of the 3 filter tables, 
In, Out, and FWD, so assuming that it's line by line filtering (eg, runs 
until a rule catches it), my packet is making it throught the chains 
without being caught.  Any suggesstions on what could cause that?

