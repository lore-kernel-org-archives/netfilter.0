From: Michael Tautschnig <michael.tautschnig@zt-consulting.com>
Subject: Re: Iptables and vserver
Date: Sun, 20 Mar 2005 17:34:27 +0100 (CET)
Message-ID: <Pine.LNX.4.62.0503201728510.4948@l01.thnet>
References: <200503201710.46087.werner_schalk@gmx.de>
Mime-Version: 1.0
In-Reply-To: <200503201710.46087.werner_schalk@gmx.de>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Werner Schalk <werner_schalk@gmx.de>
Cc: netfilter@lists.netfilter.org

Hello,
>
> So set up PRE- and POSTROUTING rules and I was able to transparently access
> the 10.0.1.x network. However of course I am not able to access the SSH and
> HTTP servers on the host itself anymore because iptables can not
> differentiate between the SSH and HTTP server provided by my host with the
> (one and only) public IP address and those servers provided by the Vserver
> the host also acts as a DNS server for. Can anybody point me to feasable
> solutions to this problem because I don't want (or actually I simply can't)
> to use more than public IP address on the host. Anyone? Might that be
> possible with advanced routing maybe?
>

I don't think this would ever be possible with advanced routing or the 
like - how would the server know, whether you are trying to access the 
vserver or the router? But it could be easily one, if you just changed the 
ports of the ssh/http-daemons to, let's say, 23 and 81 ...

It could probably be done for http, though, if you are using different 
names for the instances provided by the vservers and the ones on the 
router using layer7-filter.

Regards,
Michael

