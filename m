From: Georgi Alexandrov <tehlists@hotpop.com>
Subject: Re: TTL Examples
Date: Wed, 20 Apr 2005 14:35:26 +0300
Message-ID: <42663E7E.6050201@hotpop.com>
References: <060601c54572$90801ab0$09603fca@southern>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <060601c54572$90801ab0$09603fca@southern>
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

hareram wrote:

> Hi all
>
> iam going through the doc from the following site
>
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html#RCTEST-IPTABLESTXT 
>
>
> The TTL target is used to change the TTL (Time To Live) field of the 
> packet. We could tell packets to only have a specific TTL and so on. 
> One good reason for this could be that we don't want to give ourself 
> away to nosy Internet Service Providers. Some Internet Service 
> Providers do not like users running multiple computers on one single 
> connection, and there are some Internet Service Providers known to 
> look for a single host generating different TTL values, and take this 
> as one of many signs of multiple computers connected to a single 
> connection.
>
> I was looking for the option above said in the docs
>
> can some one give me the example script.
>
> i would like to restrict other side use only one PC, he/she should not 
> use any proxy server or any other NAT.
>
This is pointless ... as the user on the other side can increase their 
TTL value the same way you decreased it :-)
refs: #TTLTARGET @ iptables-tutorial.frozentux.net

regards,
Georgi Alexandrov

