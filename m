From: Rob Sterenborg <rob@sterenborg.info>
Subject: Re: FTP passive not working
Date: Tue, 13 Apr 2004 19:59:53 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1081879193.3521.1.camel@katala.sterenborg.info>
References: <20040413114125.6d159e42@mgalepc.utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040413114125.6d159e42@mgalepc.utilitran.com>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Tue, 2004-04-13 at 19:41, Michael Gale wrote:
> Hello,
> 	
> 	I am having trouble getting a FTP connection to work in passive mode from
> behind a firewall.

....

> So all rules with regards to this IP / PC are under one rule.
> 
> This setup is working fine for all connections accept passive FTP -- it seems
> the firewall is not forwarding the related data connection to the internal
> server.

Did you load the ip_conntrack_ftp and ip_nat_ftp modules ?


Gr,
Rob



