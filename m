From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Stateful FW Questions
Date: Thu, 4 Jul 2002 21:05:35 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020704200537.IHCI295.mta03-svc.ntlworld.com@there>
References: <5.1.0.14.0.20020704160414.022d3d40@mailhost.csca.ryerson.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <5.1.0.14.0.20020704160414.022d3d40@mailhost.csca.ryerson.ca>
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
To: netfilter@lists.samba.org

On Thursday 04 July 2002 9:04 pm, Paul Dunphy wrote:

> Hi Everyone,
>
> I'm new to stateful firewalls (can you tell?!), and I have a couple of
> iptables-related questions:
>
> Question 1:
>
> Is there any reason to itemize the established connections
> one by one, or can I simply allow all ESTABLISHED connections through from
> the outside, and rely on the internal-external chain to limit the type of
> connections that can be initiated from inside? Is one way more secure than
> the other?

Just use a single rule.   No more or les secure than multiple rules, but a 
LOT easier to read.

> Question 2:
>
> Another related question: If I want to use "-m state --state ESTABLISHED"
> as I'm doing above in the external-internal chain, do I also have to
> specify "-m state" or "-m state NEW" in the internal-external chain so that
> the state of the connection will be tracked, or will it simply work the way
> it is written above? (Are all connections tracked?)

It'll work as you wrote it, and again it's easier to read than specifying the 
state.

By the way, don't forget to allow RELATED connections as well - these include 
important things like ICMP messages, without which your network may have 
problems.

 

Antony.

