From: Tom <tom@tomdp.com>
Subject: Re: locally access server behind firewall
Date: Wed, 01 Sep 2004 20:30:30 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41361546.5020707@tomdp.com>
References: <41360CA0.6090109@tomdp.com>
	<200409011417.29061.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200409011417.29061.Alistair@nerdnet.ca>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org


>	IF you want to do this without a DMZ (*not a good thing*) you will need to 
>both DNAT and SNAT the connections from the LAN to the webserver. 
>

Guess you guys are right. I will put the server in a DMZ, but that 
requires some work and thinking about my firewall script... I will try 
to find some spare time and when I have more problems, I will get back 
here :-) Thanks a lot for the fast responses!!!



