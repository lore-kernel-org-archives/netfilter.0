From: Jason Opperisano <opie@817west.com>
Subject: Re: Destination nat for a local (sendmail) process
Date: Fri, 19 Nov 2004 08:56:22 -0500
Message-ID: <1100872582.3874.36.camel@hubcap.ljm.dom>
References: <OF8AE127F7.13302693-ONC1256F50.005BCE0C@actuera.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <OF8AE127F7.13302693-ONC1256F50.005BCE0C@actuera.local>
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

On Thu, 2004-11-18 at 12:07, Michiel Lange wrote:
> Dear list,
> 
> I am having some troubles getting a good redirection working for the 
> following situation:
> 
> [OUTSIDE WORLD]<--->[IN-BETWEEN NETWORK]<--->[OUR FIREWALL/MTA]<--->[REAL 
> MAILSERVER]
>  \---->[OTHER FIREWALL / MAILSERVER]
> 
> We can send mail to the outside world fine, but not to the "other" 
> mailserver. Some looking showed that connecting to the 'real internet 
> address' of the 'other' host was not possible at all.
> A small fix was to create a DNAT rule which would redirect traffic to that 
> machine to it's 'internal' IP address. It works fine... if this is done 
> from a machine within the network, but not from the local machine.
> 
> It appears that outgoing packets do not go through the firewall but just 
> go out by themselves. 
> 
> Trying to get locally generated packages go through the firewall and make 
> use of the PREROUTING chain is not working yet... 
> 
> These are the rules that work for traffic going from our inside NIC to the 
> outside NIC, but not from local processes:
> $iptables -A PREROUTING -t nat --dest out.side.address1 -j DNAT 
> --to-destination 10.0.100.1
> $iptables -A PREROUTING -t nat --dest out.side.address2 -j DNAT 
> --to-destination 10.0.100.2
> 
> putting these rules in the POSTROUTING chain results in errormessages.
> I am using Iptables 1.2.7a on kernel 2.4.20
> 
> Anyone any suggestions how I can solve this problem?

i'll be honest--i don't understand your question.

first, if your trying to DNAT locally-generated packets on your
firewall--your kernel needs to be compiled with "IP_NF_NAT_LOCAL"
support.

second, NAT is not the magic solution to all things networking, as seems
to be the impression on this list.  if you're trying to get a mail
server to forward all of its mail to another mail server, simply set
that in your MTA configuration, rather than trying to use NAT.  sendmail
(which makes my head hurt) refers to this as a SMARTHOST.  in postfix
(which i use) this can be set in your transport map:

  actuera.com smtp:[MAILSERVER_IP]

-j

--
"Please do not offer my god a peanut"
	--The Simpsons


