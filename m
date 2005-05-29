From: "Gary W. Smith" <gary@primeexalia.com>
Subject: Re: more than one pptp connection to the same ip
Date: Sun, 29 May 2005 11:01:36 -0700
Message-ID: <BEBF5190.4686%gary@primeexalia.com>
References: <20050529170403.F1C2F8EDCEB@smtp.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050529170403.F1C2F8EDCEB@smtp.sterenborg.info>
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
To: Rob Sterenborg <rob@sterenborg.info>, 'Jorge Santos' <jorge.santos@duriussoft.com>, netfilter@lists.netfilter.org

The latest pptp-conntrack patch seems to work quite well under 2.6.9.  We
have been running it for a few weeks and during testing had several
connections up from different internal machines.

YMMV

Gary Smith


On 5/29/05 10:05 AM, "Rob Sterenborg" <rob@sterenborg.info> wrote:

> netfilter-bounces@lists.netfilter.org <> scribbled on :
> 
>> I have to problems very similar :
>> 
>> 1. I am using clarkconnect . what  should I do to be able to
>> have more than 1 client using the same gateway to be able to
>> make a pptp connection to the same IP?
>> 
>> 2. What should I do to make the vpn server to accept more
>> than one connection from the same IP ?
> 
> Look on the Netfilter website.
> http://www.netfilter.org/patch-o-matic/pom-extra.html#pom-extra-pptp-con
> ntrack-nat
> 
> You have to patch and compile a new kernel and iptables for use with
> PPTP conntrack. This patch is available for 2.4 kernels (last time I
> heard it didn't work that well for 2.6 kernels).
> 
> 
> Gr,
> Rob
> 
> 


