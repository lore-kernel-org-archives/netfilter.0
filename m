From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Subject: Re: IPtables l7 string
Date: Thu, 12 Apr 2007 16:29:48 -0300
Message-ID: <20070412162948.3093b5c7@pulsar.inexo.com.br>
References: <3da957060704112139i476fcbc1q1d22c698e538514a@mail.gmail.com>
	<20070412094111.5a89eb79@pulsar.inexo.com.br>
	<3da957060704120912s3719b9bcs56d426ce771a5060@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3da957060704120912s3719b9bcs56d426ce771a5060@mail.gmail.com>
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
To: Stephan Higuti <higuti.sam@gmail.com>
Cc: netfilter@lists.netfilter.org

On Thu, 12 Apr 2007 13:12:22 -0300
"Stephan Higuti" <higuti.sam@gmail.com> wrote:

> > from iptables man page:
> >
> > --algo  bm|kmp
> >            Select the pattern matching strategy. (bm = Boyer-Moore,
> >              kmp  = Knuth-Pratt-Morris)
> >
> > Ethy
> 
> So, should i use --algo bm or --algo kmp right?
> Wich is better?

Depends on what you are triyng to achieve.
Take some time to read the first lines from lib/ts_bm.c and lib/ts_kmp.c
under kernel tree. 
The answer is there (I think!).

Ethy


