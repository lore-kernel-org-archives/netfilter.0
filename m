From: Jan Humme <jan.humme@xs4all.nl>
Subject: Re: script particularities
Date: Wed, 10 Jul 2002 21:11:27 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <0207102111270E.04513@Lms>
References: <20020710144109.5448cc69.mt@open2web.com>
Reply-To: jan.humme@xs4all.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020710144109.5448cc69.mt@open2web.com>
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
To: Mark Tessier <mt@open2web.com>, netfilter@lists.samba.org

On Wednesday 10 July 2002 20:41, Mark Tessier wrote:
> Is there anyone out there who has deployed the choke firewall script found
> in chapter 6 of R. Ziegler's book "Linux Firewalls".

Which edition is that? Mine doesn't even deal with iptables.

> CLASS_A="10.0.0.0/8"                 # class A private networks
> CLASS_B="172.16.0.0/12"              # class B private networks
> CLASS_C="192.168.0.0/16"             # class C private networks
>
> This is all typical of what you'd find in most scripts, but the fact is in
> this script, that's the last time CLASS_A, CLASS_B, etc are mentioned. In
> other words, there's no rule specific to denying packets coming from a
> CLASS_A private network. Why would one initialize a CLASS_A variable if
> it's never going to be used, I wonder? Is there some other rule used in
> this script that makes using a rule specifically denying access to packets
> coming from a CLASS_A private network obsolete?
>
> Finally, I use the following rule:
>
> iptables -L FORWARD -v -x

That is only one specific chain. If all counters remain at 0, then your 
packet is not traveling through the FORWARD chain.

So you may also want to look at:

iptables -L -v -x
iptables -L -v -x -t nat
iptables -L -v -x -t mangle

to inspect all other chains where your packets may get dropped. One or more 
of the counters there must be changing, that's right!

Also, tcpdump -n may give some information what is happening to your packets.

Jan Humme.

