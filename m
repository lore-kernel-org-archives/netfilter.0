From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: ICMP and connection tracking
Date: Thu, 20 May 2004 11:24:07 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40ACDBA7.5010008@pbl.ca>
References: <40ACC986.8060103@pbl.ca> <200405201637.10513.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405201637.10513.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter User Mailinglist <netfilter@lists.netfilter.org>

Antony Stone wrote:
> On Thursday 20 May 2004 4:06 pm, Aleksandar Milivojevic wrote:
> 
>>Are ICMP packets related to new and established TCP connections and UDP
>>traffic considered to be part of them,
> 
> An ICMP packet which is returned in response to a previously sent TCP or UDP 
> packet is considered to be RELATED.

Thanks.  This preaty much answers my question.

>>or do I need to have explicit rules like
>>
>>    -A INPUT -p icmp -m state --state RELATED -j ACCEPT
>>
>>for things like path MTU discovery, traceroute, ICMP port unreachables,
>>and so on to work properly?
> 
> Nothing wrong with the above rule, however remember that it isn't only ICMP 
> packets which are considered to be RELATED - in an FTP connection, for 
> example, the reverse (data) connection is considered to be RELATED to the 
> original (control) connection, even though it's another TCP link, not ICMP.

Yup, I'm aware of that part.

>>Any downsides of using generic rule like above (if it is needed)?
> 
> Most people use an even *more* generic rule:
> 
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

Actually, the orginal question was prompted because I'm avoiding this 
more generic rule :-)

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

