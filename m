From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: difference between SNAT and SAME Patch?
Date: 17 Sep 2002 11:26:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1032254816.30037.7.camel@tux>
References: <F11056FtZo1P4lvVL5m00009327@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F11056FtZo1P4lvVL5m00009327@hotmail.com>
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
To: SB CH <chulmin2@hotmail.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

On Tue, 2002-09-17 at 10:27, SB CH wrote:
> Hello, all.
> 
> what's the difference of the SNAT and SAME patch?
> 
>  ex)
> 1)iptables -t nat -A POSTROUTING -j SNAT --to-source 1.2.3.4-1.2.3.7
> 2)iptables -t nat -A POSTROUTING -j SAME --to 1.2.3.4-1.2.3.7

SNAT will use the currently least used ip in the range for the new
connection. That means that clients can get diffrent ip's for their
connections, even against the same server and some webservers don't like
this, ie. hotmail, banking via internet....

SAME on the other hand doesn't care which ip has the least number of
connections. It will calculate which ip in the range to use for a given
client, that way a client always gets the same ip on all of it's
connections. I wrote this target when users complained about banking via
internet not working via SNAT with multiple ip's.

(SAME uses both the clients ipadress and the ip of the server you are
trying to connect to in the calculation so by default clients will get
diffrent ip's against diffrent servers but always the same ip against
the same server. There is an option to force it to only care about the
clients ip so that they will always get the same ip regardless of which
server they are trying to connect to, that option is called --nodst,
this is how I use it here)

I hope that helps.

-- 
/Martin

Never argue with an idiot. They drag you down to their level, then beat
you with experience.

