From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Iptables Problem on DNS Server
Date: Fri, 21 Jun 2002 18:27:01 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020621172705.MXYB2755.mta05-svc.ntlworld.com@there>
References: <003f01c219c5$4c54e900$6500a8c0@systemsadmin>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <003f01c219c5$4c54e900$6500a8c0@systemsadmin>
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

On Saturday 22 June 2002 9:17 am, Joe de Vera Jr. wrote:

> From: Antony Stone <Antony@Soft-Solutions.co.uk>
>
> On Saturday 22 June 2002 6:29 am, Joe de Vera Jr. wrote:
> >
> > the scenario is this.. my DNS can't resolve when i activate the firewall
> > on this machine..
>
> What rules do you have ?
>
> Antony.

> how would i know if what kind of rules do i have?

1. What rules are being set in the firewall script you are running ?

2. What is the output of:

iptables -L -n -v
iptables -L -n -v -t nat
iptables -L -n -v -t mangle

> it just so happen that when i activate my firewall the DNS doesn't work..
> but when i deavtivate my firewall it turn back to normal operation...

That's why we need to know what rules you have in your firewall :-)

 

Antony.

