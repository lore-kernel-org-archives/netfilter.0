From: Stephen Satchell <list@fluent2.pyramid.net>
Subject: Re: Starting iptables problem
Date: Fri, 24 Oct 2003 07:08:24 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.1.1.0.20031024070612.010e1088@fluent2.pyramid.net>
References: <3F998BA4.7070001@icare.com.hk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F998BA4.7070001@icare.com.hk>
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
Content-Transfer-Encoding: 7bit
To: Stephen Liu <satimis@icare.com.hk>, netfilter@lists.netfilter.org

At 08:29 PM 10/24/2003 +0000, Stephen Liu wrote:
># /etc/init.d/iptables start
>* WARNING:  "net.eth0" has already been started.
>* Not starting iptables. First create some rules then run
>* /etc/init.d/iptables save

RTFCL (read the nice console log).

It says you don't have any rules defined.  That means there is no saved 
rules where Gentoo expects to find them.  So define some rules using the 
iptables utility, then run /etc/init.d/iptables save, and then you should 
be good to go.

Finding example rulesets is a Google search away.

Satch



-- 
Programming X Windows is like trying to find the square root of pi using 
roman numerals.  -- Henry Spencer  


