From: Frank Gruellich <frank@home.manuelm.org>
Subject: Re: opening connection for Tomcat
Date: Fri, 9 Apr 2004 01:18:08 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040408231808.GN10272@home.manuelm.org>
References: <40756C19.3010606@tin.it> <1081446600.2453.63.camel@katala.sterenborg.info> <4075B24D.1020601@tin.it> <200404082253.44301.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200404082253.44301.Antony@Soft-Solutions.co.uk>
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
To: Netfilter <netfilter@lists.netfilter.org>

* Antony Stone <Antony@Soft-Solutions.co.uk>  8. Apr 04:
> On Thursday 08 April 2004 9:13 pm, Gianni Pucciani wrote:
> > Ok, I've fixed the problem: it seems that the address 0.0.0.0 is no good.

I think you meant something like "0.0.0.0/0.0.0.0" or its alias
"0.0.0.0/0" or its alias "0/0" or its alias "".  So, omit it.

> You are certainly very unlikely to receive packets from that address, as it 
> does not exist.

hydra:~# zgrep 'SRC=0\.0\.0\.0' /var/log/kern.log.1.gz |wc -l
     28

Dhcp-clients use it when discovering.  But not to port 8080.

 Regards, Frank.
-- 
Sigmentation fault

