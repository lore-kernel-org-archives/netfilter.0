From: Oskar Andreasson <blueflux@koffein.net>
Subject: Re: what are the possible chain policies?
Date: Sun, 30 Mar 2003 15:03:16 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0303301458320.19498-100000@laptop1.agatha>
References: <Pine.LNX.4.44.0303291426440.7401-100000@dell>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0303291426440.7401-100000@dell>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: iptables mailing list <netfilter@lists.netfilter.org>

Hi,

First of all, sorry to everyone who's tried to contact me or mailed me 
during the last couple of months or so. Ive been tremenduously overworked 
since around Christmas, and hence all the delays on my part. I am 
currently trying to catch up, but I am still under heavy load so...

On Sat, 29 Mar 2003, Robert P. J. Day wrote:

> 
>   i was just summarizing the behavior of iptables and i'm puzzled
> by a contardiction between the man page and oskar's tutorial.
> 
>   regarding possible chain policies, oskar lists DROP, ACCEPT
> and REJECT.
> 

REJECT is not true, and I don't know where I got that one. It was fixed
earlier today, and should be out in a week or so with the rest of the
updates I am trying to gather up right now.

>   the man page, however, suggests all of ACCEPT, DROP, QUEUE
> or RETURN, which seems a bit odd.

ACCEPT and DROP should work. Possibly QUEUE as well, but RETURN sounds 
strange. RETURN should be the default policy on user created chains, but 
what good can it do on systemspecified chains? 

Of course, I am only speculating here since I haven't had the time to 
actually read the code so...

> 
>   since i've only used DROP or ACCEPT until now, i'm not sure
> what the right answer is.
> 
>   anyone?
> 
> rday
> 
> 
> 

-- 
----
Oskar Andreasson
http://www.frozentux.net
http://iptables-tutorial.frozentux.net
http://ipsysctl-tutorial.frozentux.net
mailto:blueflux@koffein.net


