From: "David F. Strauch" <dstrauch@cyberlink.com>
Subject: Re: open ports 25/tcp and 110/tcp
Date: Wed, 3 Dec 2003 17:58:03 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003d01c3b9f9$4e074380$0201a8c0@OurPC>
References: <002101c3b9ef$53e5d780$0201a8c0@OurPC> <200312032301.11900.Antony@Soft-Solutions.co.uk> <002201c3b9f5$c7ee11a0$0201a8c0@OurPC> <200312032339.21755.Antony@Soft-Solutions.co.uk>
Reply-To: "David F. Strauch" <dstrauch@cyberlink.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Yes, Antony this is the case.  I have only one WinXP machine that I am
testing with.  I'm testing the external interface eth0 and I have unplugged
eth1 from the hub.

When I nmap -sT -p 25,110 -P0 xx.xx.xx.xx I get the following output form
nmap:

Starting nmap V. 3.00 ( www.insecure.org/nmap )
Interesting ports on  (67.153.34.147):
Port       State       Service
25/tcp     open        smtp
110/tcp    open        pop-3

Nmap run completed -- 1 IP address (1 host up) scanned in 1 second

----- Original Message ----- 
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, December 03, 2003 5:39 PM
Subject: Re: open ports 25/tcp and 110/tcp


> On Wednesday 03 December 2003 11:32 pm, David F. Strauch wrote:
>
> > Antony,
> >
> > I tried telnet from my WinXP machine to both open ports without any
> > responce.  I'm hosting neither services on this machine.  It will be a
> > gateway machine with a very minimal hardened installation.
>
> Are you saying that from the same machine you did "nmap -sT -F -P0 -O
> xx.xx.xx.xx" and got a report including "SMTP port 25 open" and "POP3 port
> 110 open", and also doing "telnet xx.xx.xx.xx 25" gives no response?
>
> That makes no sense, because nmap -sT means a full TCP connect - the same
as
> the telnet command would do.
>
> Please confirm whether I am understanding correctly that you are doing
both
> these tests from the same machine to the same address and getting
different
> answers?
>
> Antony.
>
> -- 
> All matter in the Universe can be placed into one of two categories:
>
> 1. Things which need to be fixed.
> 2. Things which need to be fixed once you've had a few minutes to play
with
> them.
>
>                                                      Please reply to the
list;
>                                                            please don't CC
me.
>
>
>
>



