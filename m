From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Problems with connection
Date: Mon, 13 Sep 2004 16:30:29 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41461175.6050602@pbl.ca>
References: <20040913210115.54459.qmail@web50202.mail.yahoo.com>
	<1095110328.1899.26.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1095110328.1899.26.camel@wolfpack.ljm.dom>
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

Jason Opperisano wrote:
> 2)  try doing a tcpdump on the outside interface and capture the packet
> data as well:
> 
>   tcpdump -i $OUTSIDE -s 1500 -w output.cap host $SERVER_MACHINE
> 
> then open that capture file (output.cap) in something (ethereal is
> nice), and if the protocol exchanges data in clear text--you may gain a
> better grasp of what's going on...

I second that one.  Looking only at the inside interface tells only one 
half of the story.  Ethereal also have nice feature, if one packet of 
the connection is selected (say first), and than Analyze -> Follow TCP 
Stream, you'll get complete data exchange (coloured as input and output).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

