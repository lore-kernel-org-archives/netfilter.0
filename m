From: Andrew Schulman <andrex@alumni.utexas.net>
Subject: Re: I have the script with the rules, what now?
Date: Tue, 23 Mar 2004 04:47:18 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <c3p136$snh$1@sea.gmane.org>
References: <086C43C9A9A1A541BFDFABCFDA05F58902094668@mailnew.tecnun.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
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

> Hi everyone,
> 
> I am a newbie, and I am probably asking a silly question, but anyway!
> 
> I have 3 network cards (2 for internal networks and the other one to
> Internet), and I have already started with my ruleset and have made a
> script, based on the scripts I have found in several HOWTOs and
> tutorials.
> 
> My question is: how do I execute this script now?

At a command prompt,

chmod u+x script
./script

Saioa, it sounds to me as though you need to learn some Unix/Linux
fundamentals, in order to tackle the other problems that will surely come
up when you're building a firewall.  I suggest that you get a good book
about Unix or Linux, and read it.  For an introductory book, lots of people
like Running Linux, from O'Reilly.  For an intermediate book, Unix Power
Tools, also from O'Reilly, is terrific.

Good luck,
Andrew.



