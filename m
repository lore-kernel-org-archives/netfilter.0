From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: SNAT does not work
Date: Thu, 6 Jun 2002 14:57:15 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206061357.g56DvOA31162@vulcan.rissington.net>
References: <3CFF6327.5020306@globit.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3CFF6327.5020306@globit.com>
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

On Thursday 06 June 2002 2:27 pm, Uwe Eisner wrote:

Hi.

Having read your email again, I realise that I do not understand what problem 
you're having...

> I'm using a internal ip-range, wherefor I need NAT to connecting to the
> internet..

Okay, yes - I understand that.

> My problem is, that this rule does not work. When I start a Perl-code at
> the www, witch shows me my ip-address, it showes me the IP-address of
> the external interface of the router/firewall.

Surely that means that your address translation *is* working ?

1. If it were not, the remote web server would not be able to establish a 
connection.

2. The external address of the firewall is the address you would expect to be 
coming from when yu use the SNAT rule.

3. If you are running a Perl script, I assume that means that a TCP 3-way 
handshake has been completed, which means the web server has successfully 
been able to send packets back to your client.

> I can not find the problem.

What *is* the problem ?

> If I set no POSTROUTING rule, it is the same game...

I do not understand what you mean by this.   Surely you do not mean that if 
you remove the POSTROUTING rule, you can still connect to a remote web server 
and have a Perl script tell you your source address ???

Maybe you can explain a little more for me ?


Antony.

