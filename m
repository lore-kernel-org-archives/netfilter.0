From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IP Alias with iptables
Date: Tue, 20 Apr 2004 19:27:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404201927.14766.Antony@Soft-Solutions.co.uk>
References: <EMEKLOMJOPNJPAFKHEDJGECHCDAA.rhaces_chistes@yahoo.com.mx> <200404192231.42723.Antony@Soft-Solutions.co.uk> <16517.26251.561739.758706@saint.heaven.net>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <16517.26251.561739.758706@saint.heaven.net>
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

On Tuesday 20 April 2004 7:06 pm, Dick St.Peters wrote:

(Quoted from Alistair Tonner):

> > > 	Aliased (stacked) interfaces ARE NOT SECURE.  Period.

(Quoted from me):

> > Indeed.   I would like to see this emphasised more in the netfilter
> > howtos & tutorials.   Multiple addresses on one interface are all very
> > well, so long as they exist within the same subnet; however anyone trying
> > to use multiple *network* addresses on one physical interface is
> > defeating their security by ignoring what the different OSI network
> > layers mean.
>
> I want to add some qualification to these statements.  Aliased
> interfaces do not inherently introduce any insecurity in cases
> where you don't care about subnet separation.

I agree.   However, Alistair and I were not claiming that aliased interfaces 
introduce an insecurity where you don't require any security - we were simply 
saying that you cannot (should not) use them where you require to have secure 
separation of your subnets.

If you want to overlap two logical networks on one physical infrastructure, 
and you do not require any security between them, then aliased interfaces are 
ideal for the job.

However, if you are trying to keep two logical networks securely separate from 
each other (as the original poster wanted to do), then aliased interfaces 
will defeat your attempts at this.

Regards,

Antony.

-- 
There are two possible outcomes:

 If the result confirms the hypothesis, then you've made a measurement.
 If the result is contrary to the hypothesis, then you've made a discovery.

 - Enrico Fermi

                                                     Please reply to the list;
                                                           please don't CC me.


