From: Fabrice MARIE <fabrice@celestix.com>
Subject: Re: patch-o-matic:  newnat and h323
Date: Wed, 25 Sep 2002 18:34:51 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209251834.51533.fabrice@celestix.com>
References: <3D8DF73A.7020408@iol.it> <003e01c26263$bcbef230$8201a8c0@lw1dqwin> <02af01c2647a$d3f37250$6e69690a@rimas>
Reply-To: fabrice@celestix.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <02af01c2647a$d3f37250$6e69690a@rimas>
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
To: Rimas <rmocius@auste.elnet.lt>, netfilter@lists.netfilter.org

On Wednesday 25 September 2002 18:03, Rimas wrote:
>  Hi,
> What "patch-o-matic" patches I have to install for "newnat" and "h323"
> patches on kernel 2.4.19?
> Regards
> Rimas

Hello Rimas,

Install the p-o-m patches in pending (this includes but is not limited to newnat).
Then install extra/h323-conntrack-nat.patch
If you don't know how to use p-o-m, then you can read the netfilter-extensions-HOWTO:
http://www.netfilter.org/documentation/HOWTO/netfilter-extensions-HOWTO.html

./runme --batch pending
./runme extra/h323-conntrack-nat.patch
should do the trick.

Have a nice day,

Fabrice.
--
Fabrice MARIE
Senior R&D Engineer
Celestix Networks
http://www.celestix.com/

"Silly hacker, root is for administrators"
       -Unknown

