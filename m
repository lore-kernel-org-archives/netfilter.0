From: Daniel Chemko <dchemko@smgtec.com>
Subject: Re: related to -z option
Date: Wed, 10 Mar 2004 11:02:47 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <404F6657.4020101@smgtec.com>
References: <BAY12-F12shalxyPyF10000278a@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY12-F12shalxyPyF10000278a@hotmail.com>
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
To: rohit persaie <persaie@hotmail.com>
Cc: netfilter@lists.netfilter.org

If you have an accouting tool which doesn't handle accumulative 
statistics gathering, you will have to zero the counters right after the 
probe. Not ideal, but a hack to make some acocunting packages work.

Eg:
I probe an ipables rule ever 5 min.


Minute 0
    iptables -Z
    iptables -nvxL | grep ... | awk '{print $2}'
    5345
    iptables -Z
Minute 5
    iptables -nvxL | grep ... | awk '{print $2}'
    5454
    iptables -Z
Accounting with a non-acumulative counter == 5345,5454
Accounting with an acumulative counter == 5345,109 (wrong)


Minute 0
    iptables -Z
    iptables -nvxL | grep ... | awk '{print $2}'
    5345
Minute 5
    iptables -nvxL | grep ... | awk '{print $2}'
    10799
Accounting with a non-acumulative counter == 5345,10799 (wrong)
Accounting with an acumulative counter == 5345,5454


rohit persaie wrote:

> Dear All,
>
> There is one option in iptables .....-Z , used for  the  packet  and 
> byte counters in all the chains.
>
> Please tell me the use of this option, with example.
>
> with regards ,
>
> persaie
>
> _________________________________________________________________
> Take a loan. Win great prizes! Handsome prizes to be won!  Take a loan 
> & win TV, Fridge & many more prizes ! 
> http://go.msnserver.com/IN/44044.asp
>
>

