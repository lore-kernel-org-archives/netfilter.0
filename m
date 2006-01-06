From: Georgi Alexandrov <georgi.alexandrov@gmail.com>
Subject: Re: Bypass transparent proxy in iptables?
Date: Fri, 06 Jan 2006 14:16:34 +0200
Message-ID: <43BE5FA2.6050800@gmail.com>
References: <BFE309C2.4DB92%jamie@listserv.newberg.k12.or.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BFE309C2.4DB92%jamie@listserv.newberg.k12.or.us>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Jamie McParland wrote:

>This is probably the wrong place to ask this but i don't know where else to
>turn. I'm using IPCOP as my distro and we use iptables to do transparent
>proxy with squid.
>
>I have one site that is balling up in squid and need to totally bypass
>squid. Doing an ACL in squid doesn't work.
>
>I know i could somehow put some rule before the transparent rule and bypass
>it that way but i can't seem to figure it out. I asked the ipcop list but
>didn't have any luck there. I thought the IPTable gurus might have an idea.
>
>Thanks, 
>Jamie
>
>
>
>
>  
>
Let's asume you are using a rule like this one:
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT 
--to-port 3128

Let's asume the site you'll be bypassing is www.McParland.com.

Just add a rule before the REDIRECT one like this:

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -d 
www.McParland.com -j RETURN
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT 
--to-port 3128

That would cause tcp packets coming from eth0 with destination port 80 
and destination host www.McParland.com
to stop travelling PREROUTING chain of the nat table. E.g. they won't 
hit the REDIRECT rule and will not be
redirected to squid's port.


regards,
Georgi Alexandrov

