From: Michael Gale <mgale@utilitran.com>
Subject: Re: open ports 25/tcp and 110/tcp
Date: Wed, 3 Dec 2003 17:14:59 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031203171459.5733d448.mgale@utilitran.com>
References: <002101c3b9ef$53e5d780$0201a8c0@OurPC>
	<200312032339.21755.Antony@Soft-Solutions.co.uk>
	<003d01c3b9f9$4e074380$0201a8c0@OurPC>
	<200312040008.36161.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312040008.36161.Antony@Soft-Solutions.co.uk>
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

Hello,

	Maybe because you are running nmap from a windows box ?

Have you tried a windows machine ?

Michael.



On Thu, 4 Dec 2003 00:08:36 +0000
Antony Stone <Antony@Soft-Solutions.co.uk> wrote:

> On Wednesday 03 December 2003 11:58 pm, David F. Strauch wrote:
> 
> > Yes, Antony this is the case.  I have only one WinXP machine that I am
> > testing with.  I'm testing the external interface eth0 and I have unplugged
> > eth1 from the hub.
> >
> > When I nmap -sT -p 25,110 -P0 xx.xx.xx.xx I get the following output form
> > nmap:
> >
> > Starting nmap V. 3.00 ( www.insecure.org/nmap )
> > Interesting ports on  (67.153.34.147):
> > Port       State       Service
> > 25/tcp     open        smtp
> > 110/tcp    open        pop-3
> >
> > Nmap run completed -- 1 IP address (1 host up) scanned in 1 second
> 
> Well, that just makes no sense to me.   If nmap -sT reports a port open, then 
> a telnet to that port from the same machine as the nmap test was done should 
> present a welcome banner (for services which provide one, such as SMTP and 
> POP3).
> 
> Maybe someone else here has a clue what strangeness is going on?
> 
> Antony.
> 
> -- 
> The first fifty percent of an engineering project takes ninety percent of the 
> time, and the remaining fifty percent takes another ninety percent of the 
> time.
> 
>                                                      Please reply to the list;
>                                                            please don't CC me.
> 
> 


-- 
Michael Gale
Network Administrator
Utilitran Corporation

