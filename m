From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Newby Question
Date: Wed, 23 Oct 2002 10:48:55 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210230949.g9N9n2L02318@vulcan.rissington.net>
References: <F23V4jWdrEr6wSSakoC000006ea@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F23V4jWdrEr6wSSakoC000006ea@hotmail.com>
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

On Saturday 19 October 2002 9:00 am, Antonio W. Lagnada wrote:

> Help!
>
> I can't seem to get iptables to forward to my internal server
>
> eth0:  INTERNAL_IP
> eth1:  INTERNET
>
> WEBSERVER_IP is the ip address of the webserver
>
> I am trying to forward port 80 to an internal machine at port 8080 and it
> doesn't work.  If I change the ip address to be eth0's ip, then it works.
>
> # this doesn't work
> $IPTABLES -A PREROUTING -t nat -i eth1 -p tcp --dport 80 \
>     -j DNAT --to $WEBSERVER_IP:8080

Do you have a FORWARD rule to allow the packets through to the internal 
webserver (and also to allow the replies back again) ?

If that's not the answer, give us some more details of your network setup:

IP addresses, routes on the firewall and the web server, complete ruleset, 
any LOG results or packet sniffing you've tried...

Antony.

-- 

If at first you don't succeed, destroy all the evidence that you tried.

