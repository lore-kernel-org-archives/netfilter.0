From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: How do i Block adult sites
Date: Wed, 24 Dec 2003 12:39:52 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312241239.52285.Antony@Soft-Solutions.co.uk>
References: <20031224121931.71388.qmail@web13203.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031224121931.71388.qmail@web13203.mail.yahoo.com>
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

On Wednesday 24 December 2003 12:19 pm, Nilesh wrote:

> Hello all
>
> can any one please tell me how do i block adult sites form my proxy server

Squidguard or Dan's Guardian are good places to start.

http://www.squidguard.org
http://dansguardian.org

This is Application layer 7 problem, not a Transport / Network layer 4/3 
problem.   Netfilter is not your solution.

Antony

-- 
The first fifty percent of an engineering project takes ninety percent of the 
time, and the remaining fifty percent takes another ninety percent of the 
time.

                                                     Please reply to the list;
                                                           please don't CC me.


