From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: DCC ...
Date: 10 Jun 2002 10:48:08 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1023698888.19824.75.camel@tux>
References: <3D0373FE.9060205@twcny.rr.com> <1023637180.19838.70.camel@tux>
	 <3D0402AA.4020208@twcny.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3D0402AA.4020208@twcny.rr.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Fred Richards <Toril@twcny.rr.com>
Cc: Netfilter <netfilter@lists.samba.org>

On Mon, 2002-06-10 at 03:36, Fred Richards wrote:
> 	I haven't tried the patch yet, but I have tried upgrading my kernel to 
> the latest 2.4 kernel (2.4.19-pre10).  Still doesn't appear to work, 
> although I have tried putting in my actual ip address (172.16.0.5).  I 
> also cannot find the irc-natip.patch anywhere... doesn't seem to be in 
> the iptables 1.2.6a source tree.  Another curiosity ... I see the 
> default port for irc (and how netfilter sees related connections) is 
> port 6667... having my wife do most of the testing from her machine ... 
> most of the time she's connecting to port    6668 ... hmmm ...

I attached the patch and you actually quoted it in your reply.

the irc extension to the conntracking only listens to port 6667 by
default and can only be changed by either changeing the source or having
it as a module and using the ports= parameter.

If you did set the ip to 172.16.0.5 _and_ connected to port 6667 and it
still didn't work then my next question would be if you have the
neccessary rules to allow RELATED connections from outside into your
network? ie. iptables -A FORWARD -i eth0 -m state --state
ESTABLISHED,RELATED -j ACCEPT


-- 
/Martin

Never argue with an idiot. They drag you down to their level, then beat
you with experience.

