From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: one to one NAT
Date: Tue, 10 Sep 2002 01:21:57 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020910002200.VICK295.mta06-svc.ntlworld.com@there>
References: <200209100010.g8A0AAr9027286@ns2.is.bizsystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200209100010.g8A0AAr9027286@ns2.is.bizsystems.com>
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

On Tuesday 10 September 2002 2:10 am, Michael wrote:

> I've been messing around all day trying to get one to one NAT working
> for my site. This is (I think) a typical DMZ application.

I don't see a DMZ anywhere in your description...   You seem to have an 
internal network, and an external connection - where's the DMZ ?

> INTERNET <==> linux/iptables <==> localnet
>
> linux ip 1.2.3.4 on eth1
> local net 192.168.1.0
>
> local net ip box 192.168.1.19
>
> I want to map 1.2.3.5 to a single address behind the linux box
> 1.2.3.5 is mapped to eth1:0

iptables -A PREROUTING -a nat -d 1.2.3.5 -j DNAT --to 192.168.1.19
iptables -A FORWARD -d 192.168.1.19 -j ACCEPT

You might want to restrict that last rule a bit with -p tcp --dport 80 or 
whatever, depending on what that machine is running and what you're trying to 
make accessible to the Internet.

Antony.

-- 

In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac

