From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Memory leak problem
Date: Fri, 27 Sep 2002 17:33:03 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209271633.g8RGXPc32108@vulcan.rissington.net>
References: <7F2740B50D94FD4B9EAF9AAC33016C3C45382C@lascar>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7F2740B50D94FD4B9EAF9AAC33016C3C45382C@lascar>
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

On Friday 27 September 2002 4:03 pm, Jean Cantarutti wrote:

> <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
> <HTML>
> <HEAD>
> <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=US-ASCII">
> <META NAME="Generator" CONTENT="MS Exchange Server version 5.5.2653.12">
> <TITLE>Memory leak problem</TITLE>
> </HEAD>
> <BODY>
>
> <P><FONT SIZE=2 FACE="Arial">Hi, im using iptables 1.2.5 on a HP machine
> working like firewall, it has 512 MB of RAM and every 30 seconds eats 6 kb
> of RAM, in 48 hours only left 8300 kb of available RAM.</FONT></P>

Please:

1. Do not post html to this mailing list.
2. Tell us the volume of traffic you have going through your firewall.
3. Tell us the number of simultaneous connections you have through your 
firewall.
4. Tell us if you get any messages from netfilter in your syslog.
5. Give us an idea of what protocols you're handling, and what your ruleset 
is.
6. Let us know if you have any other services or applications running on your 
firewall.

Antony.

-- 

If you want to be happy for an hour, get drunk.
If you want to be happy for a year, get married.
If you want to be happy for a lifetime, get a garden.

