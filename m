From: Michael Gale <michael.gale@utilitran.com>
Subject: Re: how to block p2p
Date: Mon, 5 Apr 2004 09:09:43 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040405090943.05bc0db2@mgalepc.utilitran.com>
References: <001201c40744$1f34a190$2a245cc2@cea05>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001201c40744$1f34a190$2a245cc2@cea05>
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

Hello,

	From my experience and depending on how anal you would like to get. I setup a
firewall with IPTABLES blocking all connections / traffic types and then
allowed:

port 22 out
port 21 out 
connections made by the squid UID 

I then used squid to block almost all traffic except for http. No MSN, AOL, ICQ
,... over http. No streaming audio, video (except for Microsoft training).

It cut our bandwidth usage is have which saved the company over $400 a month.

Michael.



On Thu, 11 Mar 2004 09:37:42 +0100
"Tomasz Macioszek" <tomekm@cea.pl> wrote:

> Hello!!
> I would like to block all known p2p program ( Kazaa, eDonkey, ...). I would
> like to find patch of iptables (p-o-m) which blocks all this programs??
> 
> Thanks for your help
> Tomek
> 
> 
> 
> 
> 
> 


-- 
Michael Gale
Network Administrator
Utilitran Corporation

