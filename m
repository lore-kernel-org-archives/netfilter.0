From: David Cannings <lists@edeca.net>
Subject: Re: trafic info
Date: Tue, 27 Jan 2004 16:17:16 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401271617.16381.lists@edeca.net>
References: <1169375166.20040127185956@internetplustravel.ru>
Reply-To: david@edeca.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1169375166.20040127185956@internetplustravel.ru>
Content-Disposition: inline
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
To: Oleg Savostyanov <savostyanov@internetplustravel.ru>, netfilter@lists.netfilter.org

On Tuesday 27 January 2004 3:59 pm, Oleg Savostyanov wrote:
> Hello netfilter,
>
> I am using my LinuxBox as a NAT device for my LAN.
> Debian Woody 2.4.23
> I suspect one of my (or not one) computers infected by virus
> And generating outgoing trafic.
> Is there any way without installing packages to view from my linuxbox
> established connects, any info about
> transferred bytes during this connect, etc..?
> Or maybe someone can suggest good program for that.

If you're prepared to change your ming about installing packages, you 
could try "trafshow" or "iptraf".  I prefer iptraf but they're both good.

In Woody, trafshow is in the apt package "netdiag" and iptraf is in 
"iptraf".

David

