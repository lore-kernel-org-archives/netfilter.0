From: Tib <tib@firelion.org>
Subject: Re: use of the limiting options
Date: Fri, 28 Jan 2005 15:32:07 -0600 (CST)
Message-ID: <Pine.GSO.4.60.0501281530480.22233@sirius.firelion.org>
References: <Pine.LNX.4.53.0501251248340.24829@altaica>
	<Pine.LNX.4.53.0501251306320.24829@altaica>
	<Pine.LNX.4.53.0501251327570.24829@altaica>
	<294d5daa0501251137328fa4ff@mail.gmail.com>
	<Pine.LNX.4.53.0501251340370.24829@altaica>
	<294d5daa05012511513465fcc1@mail.gmail.com>
	<Pine.LNX.4.53.0501251355270.24829@altaica>
	<294d5daa0501251217b1935c4@mail.gmail.com>
	<Pine.LNX.4.53.0501251421150.24829@altaica>
	<Pine.LNX.4.53.0501260156100.24829@altaica>
	<294d5daa05012610435e4160b@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <294d5daa05012610435e4160b@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Mark Moseley <moseleymark@gmail.com>
Cc: netfilter@lists.netfilter.org


Ahh, I was wondering about this. I had put the limit rule in place and the 
drop after it, and found that it apparently shut everything out. So do I 
need to do all three then?

Establish rule
Limit rule
Drop rule

In that order?

<EOL>
Tib



On Wed, 26 Jan 2005, Mark Moseley wrote:

> I'm guessing maybe you don't have a rule above that accepts
> established connections? e.g.
> iptables -A INPUT -i eth0 -p tcp --dport 22 -m state --state
> ESTABLISHED -j ACCEPT
>
> If you don't have that, your established connection will soon deplete
> the 6/hr packets as well.
>
> Though, as Jason mentioned, you probably want to poke a hole or two
> through for select known-good IPs.
>
>

