From: "Wennie V. Lagmay" <wlagmay@yanbulink.net>
Subject: Re: private to public IP
Date: Mon, 3 Jul 2006 15:01:13 +0300
Message-ID: <002a01c69e98$617e69d0$7819a8c0@MYNOTEBOOK>
References: <006801c69dcb$9fccd140$7819a8c0@MYNOTEBOOK><1151856182.5609.2.camel@robee.mars.cyberbajt.pl><004b01c69e8d$5f083ab0$7819a8c0@MYNOTEBOOK>
	<57177.193.173.147.3.1151925423.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org, Rob Sterenborg <rob@sterenborg.info>

Thanks you very much Rob, I will take note that It is better to use -A 
rather than -I on this situation, however I have a follow up question.what 
is the difference between implemeting these rules on FOWRARD chain, rather 
than POSTROUTING and is it important to put  DROP after the rules?

Wennie

----- Original Message ----- 
From: "Rob Sterenborg" <rob@sterenborg.info>
To: <netfilter@lists.netfilter.org>
Sent: Monday, July 03, 2006 2:17 PM
Subject: Re: private to public IP


On Mon, July 3, 2006 12:42, Wennie V. Lagmay wrote:
> Hi Robee,
>
>
> Thank you very much for your reply, just want to confirn something.
>
>
> 1. Based on the script  you've sent to me does it mean that I have to 
> input
> all my private subnets example
> iptables -I  FORWARD  -s 192.168.1.0/24 -m state --state NEW -j LOG
> --log-level info
> iptables -I  FORWARD  -s 192.168.2.0/24 -m state --state NEW -j LOG
> --log-level info
> iptables -I  FORWARD  -s 192.168.3.0/24 -m state --state NEW -j LOG
> --log-level info
> iptables -I  FORWARD  -s 192.168.4.0/24 -m state --state NEW -j LOG
> --log-level info
> and so on

Yes. But you can script that to save yourself some work if you have a lot or
these.
You do know that when you are using "-I" that you are inserting the rules on
top of each other, instead of appending them..? In this case it doesn't 
matter
but you may get unexpected results if you are not aware of it.

> 2. With this script I can  identify a certain Private IP, which public IP
> address it use and which remote IP it is connected? example
>
> Private IP = 192.168.2.56
> Public IP =  203.174.11.8
> Remote IP = 65.67.87.9 (www.yahoo.com)

No. Only the source (private) IP and the remote (destination) IP (and more,
like [s|d]port, etc). A logging line would look something like this:

Jul  3 12:55:35 fw INPUT:  IN=eth0 OUT=
MAC=00:a0:27:a0:6b:00:00:b0:d0:db:aa:3a:08:00  SRC=60.11.125.36 DST=1.2.3.4
LEN=485 TOS=00 PREC=0x00 TTL=40 ID=0 DF PROTO=UDP SPT=40867 DPT=1026 LEN=465

Jul  3 12:55:35 fw INPUT:  IN=eth0 OUT=
MAC=00:a0:27:a0:6b:00:00:b0:d0:db:aa:3a:08:00  SRC=60.11.125.36 DST=1.2.3.4
LEN=485 TOS=00 PREC=0x00 TTL=40 ID=0 DF PROTO=UDP SPT=40867 DPT=1027 LEN=465

(This is a DROP rule in the INPUT chain so there's no private source IP.)

> 3. Are all the log are stored in /var/log/messages?

That depends on your syslog config. Normally, I think: yes.
If you want to log more specific, you can setup ulogd and use the ULOG 
target.


Gr,
Rob




