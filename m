From: David Cannings <lists@edeca.net>
Subject: Re: Iptables Email Alerting
Date: Mon, 15 Mar 2004 18:15:24 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403151815.24769.lists@edeca.net>
References: <20040315180815.18699.qmail@web40701.mail.yahoo.com>
Reply-To: david@edeca.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040315180815.18699.qmail@web40701.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

On Monday 15 March 2004 18:08, Real Cucumber wrote:
> Does anyone know if it is possible to have IPtables
> send email alerts
> based on certain traffic?
>
> I'm looking for something similair to the -j LOG
> option, perhaps a -j MAIL ?

You could quite possibly jump to a userspace script that handles this.  I 
believe the target is QUEUE, but support will need to be compiled into 
your kernel to support it.

David

