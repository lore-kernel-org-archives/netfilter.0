From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Forwarding help
Date: Thu, 27 Nov 2003 13:21:16 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311271321.16493.Antony@Soft-Solutions.co.uk>
References: <000701c3b469$17203ba0$14d36c50@anonymous> <200311271258.29327.Antony@Soft-Solutions.co.uk> <1069938876.20811.5.camel@raylinux.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1069938876.20811.5.camel@raylinux.internal>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Thursday 27 November 2003 1:14 pm, Ray Leach wrote:

> Halflife like most network games uses UDP, so should be able to work
> through nat.

I'm not sure I see the reasoning here.   Just because something uses UDP 
doesn't automatically mean it will work through nat?

The criterion for whether a protocol will work through nat or not is whether 
the IP address that each end-system thinks it has gets embedded in the 
communication somewhere or not.   If those addresses do get embedded in the 
packet contents, then it won't work through nat without a helper which 
understands where and how the embedding is done, and can fiddle about with 
it.

I don't think it makes any difference whether the packets get to the other end 
by TCP, UDP or anything else?

Antony.

-- 
The first fifty percent of an engineering project takes ninety percent of the 
time, and the remaining fifty percent takes another ninety percent of the 
time.

                                                     Please reply to the list;
                                                           please don't CC me.


