From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: open ports 25/tcp and 110/tcp
Date: Wed, 3 Dec 2003 19:11:07 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312031911.07628.JALaramie@Loudoun-Fairfax.com>
References: <002101c3b9ef$53e5d780$0201a8c0@OurPC> <200312032339.21755.Antony@Soft-Solutions.co.uk> <003d01c3b9f9$4e074380$0201a8c0@OurPC>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003d01c3b9f9$4e074380$0201a8c0@OurPC>
Content-Disposition: inline
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

On Wednesday 03 December 2003 18:58, David F. Strauch wrote:
> Yes, Antony this is the case.  I have only one WinXP machine that I am
> testing with.  I'm testing the external interface eth0 and I have unplugged
> eth1 from the hub.
>
> When I nmap -sT -p 25,110 -P0 xx.xx.xx.xx I get the following output form
> nmap:
>
> Starting nmap V. 3.00 ( www.insecure.org/nmap )
> Interesting ports on  (67.153.34.147):
> Port       State       Service
> 25/tcp     open        smtp
> 110/tcp    open        pop-3
>
> Nmap run completed -- 1 IP address (1 host up) scanned in 1 second
>

Why don't you run a packet sniffer on this interface and run the test again. 
That should show what it is nmap is seeing, if anything.

Jeff


