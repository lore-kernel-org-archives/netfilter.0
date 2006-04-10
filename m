From: Aleksander <aleksander@krediidiinfo.ee>
Subject: Re: Redirecting packets based on source+destination ip's
Date: Mon, 10 Apr 2006 17:04:13 +0300
Message-ID: <443A65DD.6050607@krediidiinfo.ee>
References: <4840.68.94.225.167.1144557277.squirrel@webmail.dominationtime.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4840.68.94.225.167.1144557277.squirrel@webmail.dominationtime.com>
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
To: netfilter@lists.netfilter.org

clan@dominationtime.com wrote:

> To make it work I had to change PREROUTING to OUTPUT.  So is there a way
> for that to only effect certain source ip's?

If the packet originated from localhost, then OUTPUT is correct. -s is 
source and -d is destination ip.

iptables -t nat -A OUTPUT -s 3.3.3.3 -d 1.1.1.1 -p tcp -m tcp --dport 80 
-j DNAT --to 2.2.2.2

Should work for you. Remove your previously inserted rule first though.

Please read the manual page of iptables and/or 
http://iptables-tutorial.frozentux.net/iptables-tutorial.html

HTH,
	Alex

