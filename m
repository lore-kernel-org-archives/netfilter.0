From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Measuring traffic
Date: Thu, 12 Sep 2002 19:53:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020912185335.OMKI11421.mta03-svc.ntlworld.com@there>
References: <001401c25a7b$d81e5920$6b01a8c0@s3ac>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001401c25a7b$d81e5920$6b01a8c0@s3ac>
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

On Thursday 12 September 2002 5:45 pm, Rowan Reid wrote:

> Is there a way using IPTables to measure network traffic across the
> firewall ? Perhaps even begin categorizing it by client.

iptables -A FORWARD -s a.b.c.d
or
iptables -A FORWARD -p tcp --dport 80
or both:
iptables -A FORWARD -s a.b.c.d -p tcp --dport 80

(Yes, there is no -j TARGET at the end of those commands).

Then
iptables -L FORWARD -n -v -x
will show you the packet & byte counts for each rule which matched packets - 
in this case, all packets from a specific source address, all packets 
containing http requests, or all http request packets from a specific source 
address.....

Antony.

-- 

It is also possible that putting the birds in a laboratory setting
inadvertently renders them relatively incompetent.

 - Daniel C Dennett

