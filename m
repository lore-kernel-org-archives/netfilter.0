From: =?UTF-8?B?0JvQvtC20LXRh9C90LjQuiDQkNC70LXQutGB0LDQvdC00YA=?=
	<A.Logechnik@itak.ua>
Subject: Re: problem using MAC address.
Date: Wed, 27 Oct 2004 12:57:48 +0000
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <417F9B4C.3080007@itak.ua>
References: <20041027095016.39480.qmail@web60408.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041027095016.39480.qmail@web60408.mail.yahoo.com>
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

ads nat wrote:

>Hi,
>I want block forwarding as follows :
>
>"iptables -I INPUT 1 -i eth1 -p tcp -m tcp --dport 25
>-m mac --mac-source 00:08:A1:53:BE:71 -d ! 10.0.0.2 -j
>DROP"
>
>it does not work but when I try to do same thing with
>rule 
>"iptables -D FORWARD -i eth1 -p tcp -m tcp --dport 25
>-s 192.168.0.42 -d ! 10.0.0.2 -j DROP"
>
>Is there any sytax error.
>
>Or Do I have to installed any additional module of
>iptables.
>I am using Redhat 9.0 Linux.
>Please guide me.
>
>Thanks for support.
>
>
>
>		
>__________________________________
>Do you Yahoo!?
>Take Yahoo! Mail with you! Get it on your mobile phone.
>http://mobile.yahoo.com/maildemo 
>
>
>  
>
You try delete some chain. You need:

"iptables -A FORWARD -i eth1 -p tcp -m tcp --dport 25
-s 192.168.0.42 -d ! 10.0.0.2 -j DROP"



-- 
wbr, Logechnik Alexandr

In God we trust, but something 
else must have X.509 certificate


