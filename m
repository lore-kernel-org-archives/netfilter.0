From: vikrant <vikrant@saysnetsoft.com>
Subject: Re: how to execute command on match?
Date: Mon, 20 Feb 2006 11:28:10 +0530
Message-ID: <43F95A72.9030202@saysnetsoft.com>
References: <20060219132945.61719.qmail@web37805.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060219132945.61719.qmail@web37805.mail.mud.yahoo.com>
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
To: linux blr <linuxblr_in@yahoo.com>
Cc: netfilter@lists.netfilter.org

linux blr wrote:

>hi all, 
>
>plz let me know how can i execute a program everytime
>there is a match, for example, 
>everytime my Linux box receives a packet with SYN bit
>ON, instead of taking normal actions like
>ALLOW,DROP,REJECT, i want to execute a command.
>
>google wasn't able to help me, hope this list will..
>
>cheers,
>mayank.
>
>__________________________________________________
>Do You Yahoo!?
>Tired of spam?  Yahoo! Mail has the best spam protection around 
>http://mail.yahoo.com 
>
>
>
>  
>
Hi,
I am not a netfilter guru .So, the information i am giving may be wrong .
You need to write a program in which u register to the netfiler hooks 
and then do what  u wanna do.
Read the article at following link:-
_http://www.linuxjournal.com/article/7184

_Here, main_hook is replace with ur function which perform the operation 
that u wanna do .

netfilter_ops_out.hook = main_hook;

Thanks,
Vikrant


