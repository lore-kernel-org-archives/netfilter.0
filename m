From: Michael <mutk@iprimus.com.au>
Subject: Re: IPTables Feature set and performance.
Date: Tue, 03 Dec 2002 09:22:27 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DEBEB33.2070806@iprimus.com.au>
References: <OE22IyhXMOYdOiQ4rYn000056cb@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: IPtables Users <netfilter@lists.samba.org>

hard__ware wrote:

>I belive you cant Mangle Packets as well on PIX Firewall
>Such as TTL Values & MSS Clamps,
>
>here are some things on why i consider netfilter over any other product for
>now ..
>
>1) its easy to understand & it works well
>2) Completely Open Source Project
>3) Using the help from www.lartc.org QoS can be seamlessly intergrated
>
>4) Squid + Netfilter also offers more advantages like
>Speedy Web Cache & ACL Rules to Block ADs ect,
>
>5) IPTState is a good utillity for showing your Connections Through & Too
>your netfilter firewall
>
>6) IPTables Allows you to set Variables for its ip_conntrack_helpers such as
>ftp & irc like,
>the Default Port No: to track is 21 this can be changed to Many or Just One
>using sysctrl options
>
>7) Kernel Level Networking & Filtering /w Linux ..
>have you got a problem, well if your good enough you
>can make changes to your kernel / modules that will
>improve / manipulate the way your IP V4 Box works.
>
>  
>
In addition to this, I have found one mention of throughput capabilities 
of iptables. According to this reference :http://www.hipac.org/  (The 
performance test links), iptables does have significant limitation of 
throughput when large (Sequential) rulesets are used. I believe under 
ideal circumstances, and with carefull attention paid the impact can be 
minimised.

I haven't replicated the tests, and also do not know how authoritative 
the tests are.
If the tests results are accurate, this might help in making comparisons 
and decision making. Does anyone have evidence to backup the findings of 
nf-hipac peaple?

Cheers,
Michael





