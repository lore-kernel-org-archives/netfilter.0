From: James Morris <jmorris@intercode.com.au>
Subject: Re: log - kernel BUG at transaction.c
Date: Sat, 7 Dec 2002 00:25:51 +1100 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Mutt.LNX.4.44.0212070024500.13427-100000@blackbird.intercode.com.au>
References: <1039164490.18412.47.camel@rayw.knowledgefactory.co.za>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1039164490.18412.47.camel@rayw.knowledgefactory.co.za>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Raymond Leach <raymondl@knowledgefactory.co.za>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

On 6 Dec 2002, Raymond Leach wrote:

> Hi
> 
> Maybe I'm way off here, but I recall something similar being discussed
> on this list previously and it was a file system corruption in the
> journaling file system (reiserfs?).
> 

> > I use a RedHat7.2 updated and a 2.4.18-18.7 kernel.

If you mean the 2.4.20 ext3 bug, no, it was introduced in 2.4.20-pre5.


-- 
James Morris
<jmorris@intercode.com.au>



