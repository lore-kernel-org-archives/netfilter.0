From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Allow active and passive FTP connections
Date: Thu, 17 Jun 2004 08:07:52 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087474071.2015.3.camel@grendel>
References: <20040617110325.97064.qmail@web14723.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040617110325.97064.qmail@web14723.mail.yahoo.com>
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
To: Sagara Wijetunga <sagaralists@yahoo.com>
Cc: netfilter <netfilter@lists.netfilter.org>

On Thu, 2004-06-17 at 07:03, Sagara Wijetunga wrote:
>
> I have following issues relating to above rules:
> 1. For active FTP requests by remote clients, it drops
> the data connection request to the remote client from
> the server on the OUTPUT chain. 
> 
> 2. For passive FTP requests by remote clients, it
> drops the data connection request to the server from
> remote clients on the INPUT chain.

Try:
insmod ip_conntrack_ftp

HTH,
C



