From: Jason Opperisano <opie@817west.com>
Subject: Re: netfilter and proxies
Date: Thu, 14 Oct 2004 17:15:32 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041014211532.GA4529@bender.817west.com>
References: <200410141702.00033.JALaramie@Loudoun-Fairfax.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200410141702.00033.JALaramie@Loudoun-Fairfax.com>
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

On Thu, Oct 14, 2004 at 05:02:00PM -0400, Jeffrey Laramie wrote:
> Hey All,
> 
> I'm trying to help a guy on another list with his network configuration but 
> he's thrown me a curve. He has a firewall/server on the perimeter with one 
> NIC facing an ADSL router and one facing his LAN. Here's his description of 
> the problem:
> 
> "to internet: no problem, but i have problem to connect with any vhost  
> (some virtual domain running in the server) or for send email through my 
> email server, using internal pc lan. 
> if I try to connect from outside (cybercafe) i don't have any kind of  
> problems (i can check my email and i can relay through my server )
> Thats why i think the problem start whith the forward rules  define at 
> the firewall."
> 
> I asked him to give me iptables -L -t nat and -t filter. Here's the output of 
> his nat chain:
> 
> # iptables -L -t nat

it would actually help more to have the output of "iptables -vnxL -t
nat" instead, but oh well...

> Chain PREROUTING (policy ACCEPT)
> target     prot opt source               destination
> REDIRECT   tcp  --  192.168.0.0/24       anywhere            tcp 
> dpt:http redir ports 3128
> REDIRECT   tcp  --  192.168.0.0/24       anywhere            tcp 
> dpt:smtp redir ports 3128
> REDIRECT   tcp  --  192.168.0.0/24       anywhere            tcp 
> dpt:pop3 redir ports 3128
> REDIRECT   tcp  --  192.168.0.0/24       anywhere            tcp 
> dpt:imap redir ports 3128
> 
> I don't use proxies or REDIRECT myself and I'm not sure what he means when he 
> says he has a "virtual domain", but this doesn't look right to me. Can he 
> have multiple services forwarded to the same port like this?

i will naively assume from the port number that this is a squid proxy?
yes--you can redirect multiple destination ports to the same proxy; as
long as the proxy understands the layer 7 protocol.  i.e. redirecting
both TCP port 21 and TCP port 80 to a squid proxy is valid, as squid can
proxy both FTP and HTTP (though i've never tried transparent redirecting
of FTP--dunno how that would work).  however; proxying SMTP, POP3, and
IMAP to a squid proxy...well it isn't the most ridiculous thing i've
heard in a while--but it's up there...

squid supports FTP, Gopher, and HTTP proxying...

-j

-- 
Jason Opperisano <opie@817west.com>

