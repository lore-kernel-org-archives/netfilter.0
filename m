From: fender <frozenspot@gmail.com>
Subject: Re: SSHBrute Force: False Postives
Date: Thu, 1 Feb 2007 13:32:18 -0300
Message-ID: <7e36c7130702010832s7523c8a5vfaedca18e15f026a@mail.gmail.com>
References: <02a601c745a8$9f7e1110$2904b00a@au.schpac.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <02a601c745a8$9f7e1110$2904b00a@au.schpac.local>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dominic Caputo <jec6jec6@gmail.com>
Cc: netfilter@lists.netfilter.org

On 1/31/07, Dominic Caputo <jec6jec6@gmail.com> wrote:
> I have been reading up on iptables and i am by no means an expert but i have
> a problem with SSH brute force attacks on port 22. I am currently using the
> config below to minimise these threats but i am constantly getting false
> positives (logs actually say that my connection has been flagged as a brute
> force connection even on the on the first attempt-but then on others it
> connects first time with no problems)
>
> #SSH Brute-Force Scan Check
> $IPTABLES -N SSH_Brute_Force
> $IPTABLES -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --name
> SSH --set --rsource -j SSH_Brute_Force
> $IPTABLES -A SSH_Brute_Force -m recent ! --rcheck --seconds 60 --hitcount
> 4 --name SSH --rsource -j ACCEPT
> $IPTABLES -A SSH_Brute_Force -j LOG --log-level info --log-prefix "SSH Brute
> Force Attempt:  "
> $IPTABLES -A SSH_Brute_Force -p tcp -j DROP
>
> Any help with this problem would be great


About the problem with ssh brute force attacks, you can use portknocking
[1]. There are several portknocking projects, but you can use
portknocko project [2]. This is a netfilter module that implements
portknocking in an easy way. This module works in kernel 2.6.15, for
now. It will work in newer versions soon. We need more feedback about
this project.

We will be thankful for your comments.


[1] http://www.portknocking.org
[2] http://portknocko.berlios.de

--
Federico

