From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: opening connection for Tomcat
Date: Thu, 8 Apr 2004 22:53:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404082253.44301.Antony@Soft-Solutions.co.uk>
References: <40756C19.3010606@tin.it> <1081446600.2453.63.camel@katala.sterenborg.info> <4075B24D.1020601@tin.it>
Reply-To: Netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4075B24D.1020601@tin.it>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Thursday 08 April 2004 9:13 pm, Gianni Pucciani wrote:

> Ok, I've fixed the problem: it seems that the address 0.0.0.0 is no good.

You are certainly very unlikely to receive packets from that address, as it 
does not exist.

Regards,

Antony.

-- 
Success is a lousy teacher.  It seduces smart people into thinking they can't 
lose.

 - William H Gates III

                                                     Please reply to the list;
                                                           please don't CC me.


