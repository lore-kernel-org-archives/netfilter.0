From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: port mapping ANY:95 to originalIP:80
Date: Sun, 01 May 2005 17:07:12 -0500
Message-ID: <42755310.2060203@riverviewtech.net>
References: <77d61640504300952e19c4c2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <77d61640504300952e19c4c2@mail.gmail.com>
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

Hm, a touch quick on the draw to repost.  Sietse van Zanen posted a reply (https://lists.netfilter.org/pipermail/netfilter/2005-May/060125.html) to your earlier post with a solution that I just tested that did work for me.



Grant. . . .

Efraim wrote:
> Hi,
> I'm using my linux box as a router and I have an application that is
> make all the request in port 95.
> I need to make an iptables rule that will change the original port of
> any destination ip addres to 80.
> I know how to do it for a specific destination ip but I could not find
> the way to do it for any destination ip.
> 
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 95 -j DNAT --to
> 66.249.87.99:80
> 
> 66.249.87.99 is the Google ip, but I need the rule to work for any ip.
> Something like:
> 
> iptables -t nat -A PREROUTING -i eth0 -p tcp -d ANY --dport 95 -j DNAT
> --to ANY:80
> 
> I know that it is possible to do with checkpoint firewall but it is a
> little expensive...

