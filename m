From: Jason Opperisano <opie@817west.com>
Subject: Re: Fwd: Linux as router (Gateway Server)
Date: Sat, 12 Feb 2005 09:01:42 -0500
Message-ID: <1108216901.4462.27.camel@hubcap.ljm.dom>
References: <1dceb012050211233357e23dd4@mail.gmail.com>
	<1dceb01205021123483860fb86@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <1dceb01205021123483860fb86@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Sat, 2005-02-12 at 02:48, Navneet Choudhary wrote:
> hi list,
> 
> i require further co-operation from yours side.
> 
> Squid Server is serving as Proxy server, Gateway & Firewall
> 
> Problem:
> Squid daemon dies at startup.
> 
> Here is log output of  /var/log/messages
> 
> Feb 12 09:15:25 squid squid[3652]: Squid Parent: child process 3654 started
> Feb 12 09:15:25 squid (squid): Cannot open HTTP Port
> Feb 12 09:15:29 squid squid[3720]: Squid Parent: child process 3722
> exited due to signal 6
> Feb 12 09:15:32 squid squid[3720]: Squid Parent: child process 4385 started
> Feb 12 09:15:32 squid squid[3720]: Squid Parent: child process 4385
> exited with status 1
> Feb 12 09:15:33 squid (squid): Cannot open HTTP Port

that has nothing to do with iptables.  my guess is that you are either:

(a) telling squid to listen on a port that is already in use by another
process
(b) trying to start squid after it's already started
(c) running squid as an unprivileged user and trying to bind to a
privileged port

go read:

  http://www.squid-cache.org/Doc/FAQ/FAQ-11.html#ss11.23

(ps - google is your friend)

> Why my iptables rule blocking squid to open HTTP port.

it isn't.

-j

--
"It's not easy to juggle a pregnant wife and a troubled child, but
 somehow I managed to fit in eight hours of TV a day."
	--The Simpsons


