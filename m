From: "Michael D. Berger" <m.d.berger@ieee.org>
Subject: RE: QUEUE function called twice?
Date: Thu, 8 Sep 2005 22:14:08 -0400
Message-ID: <000101c5b4e4$2996f7b0$2801a8c0@MBRC40>
References: <000001c5b46a$87d8c2b0$2801a8c0@MBRC40>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000001c5b46a$87d8c2b0$2801a8c0@MBRC40>
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
Content-Type: text/plain; charset="us-ascii"
To: 'netfilter' <netfilter@lists.netfilter.org>

Mia culpa.  Because of a script error, I had two
similar -j QUEUE lines.  My apologies.
Mike.
--
Michael D. Berger
m.d.berger@ieee.org 

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org 
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of 
> Michael D. Berger
> Sent: Thursday, September 08, 2005 7:43 AM
> To: netfilter
> Subject: QUEUE function called twice?
> 
> 
> On RH-E-WS-4, in the Input chain, I send icmp type 8
> to -j QUEUE, where my function DROPs the first three,
> and ACCEPTs all thereafter.  The debug print in the
> function shows that when I accept, my queue function
> is called a second time (a total of two times for
> each ping).  Is this to be expected?  If so, this
> will be a problem for the ultimate intended use,
> which is a complex, stateful filter for some nasty
> stuff on port 80.
> 
> Thanks in advance for your help.
> Mike.
> --
> Michael D. Berger
> m.d.berger@ieee.org 
> 
> 
> 
> 



