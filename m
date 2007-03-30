From: Pablo Sanchez <pablo@blueoakdb.com>
Subject: Re: Band limit without squid
Date: Fri, 30 Mar 2007 17:33:37 -0400
Message-ID: <200703301733.38276.pablo@blueoakdb.com>
References: <200703301822.56518.davividal@siscompar.com.br>
	<Pine.LNX.4.61.0703302327570.31834@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0703302327570.31834@yvahk01.tjqt.qr>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Friday 30 March 2007 at 5:28 pm, Jan Engelhardt wrote:
> On Mar 30 2007 18:22, Davi wrote:
> >Hi all!
> >
> >I would like to reserve some band to some services.
> >Like 30 Kb to HTTP, 60 Kb to POP/IMAP, 20 Kb to SMTP and FTP, i.e.
> >
> >Can I do this using iptables + iproute or I must use Squid?
>
> No to all three questions.

... so you should take a look at doing some traffic shaping.  

Point your browser to a search engine and type:

      Linux traffic shaping

You'll get oodles of information.

Cheers,
--
pablo


