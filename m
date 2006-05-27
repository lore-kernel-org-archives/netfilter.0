From: Eric Benton <erbenton@comcast.net>
Subject: Re: STRING agrument
Date: Fri, 26 May 2006 19:49:21 -0700
Message-ID: <4477BE31.4000405@comcast.net>
References: <20060526021735.81499.qmail@web30213.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060526021735.81499.qmail@web30213.mail.mud.yahoo.com>
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
Cc: netfilter@lists.netfilter.org

Allan Parreno wrote:

>Hello,
>
>Good Day.
>
>Anyone could help me out with this error using the string argument.
>
>[root@ja Desktop]# iptables -o eth0 -A FORWARD -p tcp -m string --string
>"X-Kazaa-Username:" -j REJECT --reject-with tcp-reset
>iptables v1.3.4: STRING match: You must specify `--algo'
>Try `iptables -h' or 'iptables --help' for more information.
>[root@ja Desktop]#
>
>However, if I specify the --algo if have this error
>
>[root@ja Desktop]# iptables -o eth0 -A FORWARD -p tcp -m string --string --algo
>"X-Kazaa-Username:" -j REJECT --reject-with tcp-reset
>Bad argument `X-Kazaa-Username:'
>Try `iptables -h' or 'iptables --help' for more information.
>[root@ja Desktop]#
>
>Thanks in advance
>
>
>
>__________________________________________________
>Do You Yahoo!?
>Tired of spam?  Yahoo! Mail has the best spam protection around 
>http://mail.yahoo.com 
>
>
>  
>
--algo bm

algo needs to a method but you left out the method
in this case the mthod is "bm"
Eric


