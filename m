From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables and permits ports
Date: Thu, 12 Sep 2002 09:34:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020912083501.UQTP287.mta02-svc.ntlworld.com@there>
References: <1031772226005316@caramail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1031772226005316@caramail.com>
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

On Wednesday 11 September 2002 10:23 pm, Mohamed Nassih wrote:

>  Hi,
>
>  my firewall file is like below, It is work without any
> problem, today I test to connect to a oracle server via the
> internet from inside to the port 1521(in outside oracle
> server), and it is work.
>
>  Normaly as you can see from the roles I drop all paquets
> that do not have as a distination-port www,ftp..the
> firewall must drop all paquets with the port-destination
> 1521!!
>  Can I have please explanation of this..

I don't know whether by "inside" you mean some machine on your LAN (not your 
firewall), or the firewall itself, however:

You have no FORWARDing rules whatsoever, so if you're sending packets from 
your internal LAN, everything is allowed by the default ACCEPT policy (which 
you haven't changed).

You have no OUTPUT policy either, so if you're sending packets from the 
firewall itself, everything is allowed by the default ACCEPT policy (which 
you haven't changed).

Antony.

-- 

All matter in the Universe can be placed into one of two categories:

1. things which need to be fixed
2. things which will need to be fixed once you've had a few minutes to play 
with them

