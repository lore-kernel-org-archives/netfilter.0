From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: Blocking Netranges Based on IP-to-Country CSV
Date: Mon, 20 Sep 2004 12:53:57 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040920115357.GE3786@metastasis.org.uk>
References: <7EACCDBB65D37443912D80713CC1245D02382B06@fsnsab20.losangeles.af.mil>
	<20040917114613.GP452@metastasis.org.uk>
	<1403218a0409190209416c12b9@mail.gmail.com>
	<20040919110111.GA706@metastasis.org.uk>
	<1403218a04091904173de016ea@mail.gmail.com>
	<3063e504091904456844d5cf@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3063e504091904456844d5cf@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Sun, Sep 19, 2004 at 02:45:48PM +0300, George Alexandru Dragoi wrote:
> Good point, not to mention disliking a country sounds so nazi :D

It does, but its not.

> So, whats the reason is banning some countryes?

Why not?  Don't you effectively ban huge ranges of IP addresses, and
therefore countries, every time you restrict access to a host?  Imagine
I'm going travelling, and I know I'm only going to South America, so I
want to open up my ssh daemon to more addresses.  However I don't want
to permit the entire Internet to have a go at the daemon, but I'm
willing to open it up to South America to increase the risk slightly
in return for permitting myself SSH access wherever I am.

I must admit I'm a little worried that everyone is thinking that this
will be used to prevent access by certain countries for nefarious /
racist reasons when there are so many useful applications.

-- 
mors omnia vincit

