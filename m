From: cc <cc@belfordhk.com>
Subject: Re: udp port 135
Date: Thu, 14 Aug 2003 15:54:50 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F3B404A.7060400@belfordhk.com>
References: <001201c36225$e166d270$0401000a@sterenborg.info>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----------=_1060847889-32021-609"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001201c36225$e166d270$0401000a@sterenborg.info>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Rob Sterenborg <rob@sterenborg.info>
Cc: 'Netfilter Group' <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format...

------------=_1060847889-32021-609
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Rob Sterenborg wrote:

>>iptables -A INPUT -i $EXT_DEV -p tcp -d $EXT_DEV --dport 135 -j DROP
>>iptables -A INPUT -i $EXT_DEV -p udp -d $EXT_DEV --dport 135 -j DROP
> 
>                                        ^^^^^^^^^^^
> 
> I guess the above and below is are typos ? It should be -d $EXT_IP.
> 
Yup.  They are.  Sorry.  Thought a copy& paste was sufficient. :)

> 
> No. I am interested too in why udp shows "open" from a foreign host,
> while tcp shows filtered.
> How can I check if an udp port is really closed/filtered or opened ?

I'm completely stumped on this issue.

Thanks.



** All information contained in this email is strictly     **
** confidential and may be used by the intended receipient **
** only.                                                   **


------------=_1060847889-32021-609--

