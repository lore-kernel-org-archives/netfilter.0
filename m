From: primero <primero@fastwebnet.it>
Subject: Re: segmentation fault
Date: Mon, 20 Dec 2004 09:50:41 +0100
Message-ID: <41C69261.7010008@hdr-roma.it>
References: <200412201256140136.011B2F06@smtp.mail.yahoo.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200412201256140136.011B2F06@smtp.mail.yahoo.de>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ubberalles@yahoo.de
Cc: netfilter@lists.netfilter.org

ubberalles@yahoo.de wrote:

>I am using Slackware 10 distro, with 2.4.26 kernel and 1.2.10 iptables, when i try to use something like this:
>
>iptables -A FORWARD -p tcp -s 192.168.0.0/24 -d yahoo.com -j REJECT
>
>a segmentation fault happen.
>
>can somebody help...
>
>cheers
>JW
>
>  
>
I don't remember well because a lot of time is passed .... but i had 
similar problem while tryng to add a rule to accept OUTPUT traffic to my 
mail server using the name instead of ip. i had the same seg fault 
problem as you ... solved by manual translate of name to ip for 
destination match.
What about if u try to change "-d yahoo.com" in an "ip address"?

bye


