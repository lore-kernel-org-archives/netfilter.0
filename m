From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: conntrack ftp module usage
Date: Mon, 30 Sep 2002 17:03:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209301603.g8UG3XL04506@vulcan.rissington.net>
References: <20020930203655.57527962.arc_of_descent@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020930203655.57527962.arc_of_descent@gmx.net>
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

On Monday 30 September 2002 4:06 pm, Rohan Almeida wrote:

> Hi List,
> I've loaded the ip_nat_ftp and ip_conntrack_ftp modules.
> I also have the follwing rule in my firewall:
>
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> This is on a linux box, with 2 interfaces, one public,
> one private and doing NATing
>
> Most importantly, ftp from the client's end works fine
> But when i do an `lsmod', i see that the ftp modules
> are being used.
> Is that normal?
> what is happening?

Modules being "used" does not indicate whether they are doing anything useful 
on your machine.

It tells you whether any other modules depend on them.

Therefore a module which is listed by lsmod which is not being "used" may be 
doing a splendid job for you, but no other modules are linked in to it.

Antony.

-- 

What is this talk of software 'release' ?
Our software evolves and matures until it becomes capable of escape,
leaving a bloody trail of designers and quality assurance people in its wake.

