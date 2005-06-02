From: =?windows-1252?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: port filtering
Date: Thu, 02 Jun 2005 17:30:17 +0200
Message-ID: <429F2609.8080809@mnemon.de>
References: <1117723215.10257.6.camel@debianbox>
	<1117724394.13839.14.camel@fly.in.iantel.com.uy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1117724394.13839.14.camel@fly.in.iantel.com.uy>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

Eduardo Spremolla schrieb:
> I suppose you have a firewall that allow outgoing traffic on port 21 ?
> or is incoming?
> 
> Any way you can't tell if the traffic on port 21 if ftp , telnet or http
> without looking a hi layers protos. Don't know of any support for that
> in netfilter. May be you need to setup a transparent proxy.
> 
May be this is of use:

http://l7-filter.sourceforge.net/L7-HOWTO-Netfilter

Have a nice time,

Joerg


