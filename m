From: "T. Take" <t_takejp@hotmail.com>
Subject: Re: ULOG: invalid argument
Date: Fri, 20 Feb 2004 14:53:48 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY15-F10Ln5U9T3TGJ00000452@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="iso-2022-jp"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi, Mr. Stearns.

thank you for replying me.

>	The command you're using would normally be run from a script.
>Would you please check the values of $OUTER_PORT and $INNER_IP and make
>sure they're valid?
>	The rest looks good, assuming your kernel and iptables binary have
>ULOG support.
>	Cheers,
>	- Bill
>

I checked the values by changing $OUTER_PORT and $INNER_PORT to eth0 and 
192.168.1.0/24 respectively. But, I got the same output "invalid argument"

I'm sure that I set "ULOG target support" as a module when I compiled 
kernel, so I think my kernel have ULOG support. And I don't know how to 
check the iptalbe binary have ULOG support.

_________________________________________________________________
友達と24時間ホットライン「MSN メッセンジャー」、今すぐダウンロード！  
http://messenger.msn.co.jp 


