From: Ruprecht Helms <rhelms@mayn.de>
Subject: Re: ipfilter on satellite receive only PC
Date: Tue, 29 Jun 2004 14:41:13 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40E16369.9020109@mayn.de>
References: <40DD28BA.82DEE8DA@neduet.edu.pk> <200406260915.01035.Antony@Soft-Solutions.co.uk> <a0f69e5040626012851d190ba@mail.gmail.com> <200406260945.38438.Antony@Soft-Solutions.co.uk> <a0f69e504062602337d614297@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <a0f69e504062602337d614297@mail.gmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Askar Ali Khan <askarali@gmail.com>
Cc: netfilter@lists.netfilter.org, antony@soft-solutions.co.uk

Askar Ali Khan wrote:

>
>The following commands will create new rules for your system.
>
>   iptables -P INPUT ACCEPT	
>   iptables -P OUTPUT ACCEPT	
>   iptables -P FORWARD DROP	
>
> 
>
normaly you begin your firewallscript by dropping all packages in the 
chains. In the
next line you open the connections as needed. The other way, first all 
is open and than
you close all that is needed , remember your mind  can forget  -  not 
good practise.

Regards,
Ruprecht

---------------------------------------------------------
Ruprecht Helms IT-Service & Softwareentwicklung

Tel/Fax +49[0]7621 16 99 16
Web:     htp://www.rheyn.de


