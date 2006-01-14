From: Gabriel <jarod125@yahoo.com>
Subject: Re: iptables port80 forward and snat
Date: Sat, 14 Jan 2006 12:48:10 -0800 (PST)
Message-ID: <20060114204810.11206.qmail@web60920.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

On Sat, 14 Jan 2006 22:23:42 +0200, Gabriel wrote:

> On Fri, 13 Jan 2006 21:12:18 +0200, J.P. Fischer wrote:
>
>> 1- Snat traffic coming in on eth2
>
> iptables -t nat -A POSTROUTING -i eth2 -o eth0 -j SNAT
> --to-source 1.1.1.1
>
>> 2- port forward http traffic coming in on eth1 to port
> 8080 (so it will hit
>> the safesquid running on the box)
>
> here:
>
http://iptables-tutorial.frozentux.net/iptables-tutorial.html#REDIRECTTARGET
> it says it should look something like this:
>
> iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80
-j
> REDIRECT --to-ports 8080
>

Sorry, I haven't read Rob's post before replying.

-- 
Using Opera's revolutionary e-mail client: http://www.opera.com/mail/

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

