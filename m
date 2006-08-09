From: Marek Zachara <marek.zachara@telperion.pl>
Subject: Re: Problem with router connected to two ISPs (connection marking?)
Date: Wed, 9 Aug 2006 14:35:48 +0200
Message-ID: <200608091435.49051.marek.zachara@telperion.pl>
References: <200608082140.03815.marek.zachara@telperion.pl>
	<44D9CB5B.9020508@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44D9CB5B.9020508@freemail.hu>
Content-Disposition: inline
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

>
> Maybe these lines will help you... :) But if not.... :D
>
> $IPT -t nat -A POSTROUTING -j SNAT -p tcp --dport www -d $WWW
> --to-source $MY_IP
> $IPT -t nat -A POSTROUTING -j SNAT -p tcp --dport www -d $WWW
> --to-source $MY_IP
>
well, the packets can be send out with two different IPs - depending on which 
ISP the connection came from - so this would just bind all connections to one 
of the IPs making it impossible to have a connection from the other one.
no, i am pretty sure the snatting must be done automatically based on contrack 
entries.

Marek

