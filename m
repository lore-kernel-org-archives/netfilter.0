From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: alias interfaces
Date: Fri, 18 Oct 2002 17:51:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210181651.g9IGpjL28851@vulcan.rissington.net>
References: <03c701c276c2$388fb3f0$13c01dd0@shadowfax>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <03c701c276c2$388fb3f0$13c01dd0@shadowfax>
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

On Friday 18 October 2002 5:20 pm, Mario Antonio wrote:

> Dear List,
>
> I have configured eth0(10.10.10.2) and the alias interface eth0:0
> (10.10.10.3)
>
> do I have to specify both interfaces in my set of rules to allow traffic
> in?

No, in fact you cannot.

> /usr/local/sbin/iptables -A INPUT -i eth0    -s 0/0 -d 10.10.10.2 -p tcp -m
> tcp --dport 80 -j ACCEPT
> /usr/local/sbin/iptables -A INPUT -i eth0:0  -s 0/0 -d 10.10.10.3 -p tcp -m
> tcp --dport 80 -j ACCEPT

You will find that the latter rule generates an error, since netfilter does 
not allow : characters in interface names.

> How should I handle the alias interfaces?

For the INPUT chain, specify the destination address.   For the FORWARD 
chain, it doesn't matter anyway.

Antony.

-- 

G- GIT/E d- s+:--(-) a+ C++++$ UL++++$ P+(---)>++ L+++(++++)$ !E W(-) N(-) o? 
w-- O !M V+++(--) !PS !PE Y+ PGP+> t- tv@ b+++ DI++ D--- e++>+++ h++ r@? 5? 
!X- !R K--?

