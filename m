From: kate <kate7234@yahoo.com>
Subject: Re: services for predetermined IP addresses
Date: Fri, 15 Oct 2004 13:40:52 -0700 (PDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041015204052.94397.qmail@web21526.mail.yahoo.com>
References: <20041015202858.GA8079@bender.817west.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041015202858.GA8079@bender.817west.com>
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
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org


--- Jason Opperisano <opie@817west.com> wrote:

> On Fri, Oct 15, 2004 at 01:14:13PM -0700, kate
> wrote:
> > so the drop-all would be..?
> > 
> > iptables -A INPUT -p TCP -i eth0 -s 0/0 -j DROP
> > 
> > or did I just invent my own thing here?
> > tia
> > Kate
> 
> well--the standard way would be to set the policy of
> the built-in chain
> to DROP; i.e.,
> 
>   iptables -P INPUT DROP
> 
> the same can be achieved by making the last rule in
> the chain a drop
> rule, like
> 
>   iptables -A INPUT -j DROP
> 
> but that gets messy if you want to append rules "on
> the fly" so the
> policy method is preferred.

Last question-
I have this at the top of my script, We should be good
to go with this right ?

#(1) Policies (default)
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

or do we need something below part 3

iptables -A INPUT -p TCP -i eth0 -s 123.45.1.1
--destination-port 21 -j okay # userA
iptables -A INPUT -p TCP -i eth0 -s 123.45.0.0/16
--destination-port 22 -j okay  #users A - Z

like ?
iptables -A INPUT -j DROP

many thanks for all your help. At least the LAN works!
Kate


		
_______________________________
Do you Yahoo!?
Declare Yourself - Register online to vote today!
http://vote.yahoo.com

