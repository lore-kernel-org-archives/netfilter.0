From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: opening connection for Tomcat
Date: Fri, 9 Apr 2004 23:59:02 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404092359.02317.Antony@Soft-Solutions.co.uk>
References: <40756C19.3010606@tin.it> <407642A3.1040700@tin.it> <54466.212.17.209.220.1081493787.squirrel@www.zarrelli.org>
Reply-To: "Netfilter" <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <54466.212.17.209.220.1081493787.squirrel@www.zarrelli.org>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Friday 09 April 2004 7:56 am, giorgio.zarrelli@mammaitalia.com wrote:

> Hi,
>
> > Well, I'm not a firewall guru, but I think that 0.0.0.0 address is often
> > used to indicate "every address", isn't it?
>
> Yes, it is.

"0.0.0.0" is very different from "0.0.0.0/0".

The first means "one specific IP address, which you will never find on a real 
device".

The second means "any IP address at all".

The reason is simply because if you do not specify a netmask, /32 is assumed, 
which means all bits must match exactly.   On the other hand /0 means that no 
bits have to match at all (which is why 0.0.0.0/0 corresponds to all 
addresses).

Regards,

Antony.

-- 
If you can't find an Open Source solution for it, then it isn't a real 
problem.

                                                     Please reply to the list;
                                                           please don't CC me.


