From: Jason Opperisano <opie@817west.com>
Subject: Re: syslogging firewall data to an external file
Date: Tue, 22 Mar 2005 06:27:40 -0500
Message-ID: <1111490859.4267.16.camel@hubcap.ljm.dom>
References: <20050320210235.0CBD0F9D7EF@mx2.hotpop.com>
	<423DEDC3.1000902@hotpop.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <423DEDC3.1000902@hotpop.com>
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

On Sun, 2005-03-20 at 16:40, Georgi Alexandrov wrote:
> Use the ULOG (userspace logging) target and the ulogd deamon. That way 
> you may specify logging to a particular file (supports sql logging too).
> More at: http://iptables-tutorial.frozentux.net/iptables-tutorial.html

in addition to the ULOG target/ulogd solution (which is the easier way
to go), you could also use syslog-ng as your syslog daemon and use its
filtering capabilities to say, dump all logs entries with the string
"FIREWALL" into /var/log/firewall.

-j

--
"Asleep at the switch?  I wasn't asleep, I was drunk!"
	--The Simpsons


