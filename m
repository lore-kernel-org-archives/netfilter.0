From: "John Black" <black@arbbs.net>
Subject: Re: netfilter question
Date: Thu, 19 Feb 2004 10:56:39 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4034eac7.473.0@arbbs.net>
Reply-To: black@arbbs.net
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

>
> - for packets which have a source address in the range 192.168.0.0/24
> - and are going out of interface eth0
> - and have a destination address in the range 161.x.x.x/21
>translate the source address to 161.x.x.x
>
>Any other packets (eg: ones with a destination address of the netfilter 
>website server) will not match this rule, and will not be translated.
>
>I think you simply need to remove the "-d 161.x.x.x/21" from your rule and

>things will start working the way you want.
>
>Regards,
>
>Antony.
thanks i will try it when i get to work.

john
http://www.arbbs.net/

