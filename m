From: Benny Amorsen <benny+usenet@amorsen.dk>
Subject: Re: Transparent proxy setup with apache on the nat gateway
Date: 07 Jun 2006 10:42:26 +0200
Message-ID: <m3ac8pgxvx.fsf@ursa.amorsen.dk>
References: <02BB8A4AC86C564C89C7F14CF98CE0C49C73@knowledge.wizdom.nu>
	<1149500883.6397.9.camel@rousalka.dyndns.org>
	<44841133.90004@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

>>>>> "PH" == Pascal Hambourg <pascal.mail@plouf.fr.eu.org> writes:

PH> The question is : are you sure that Apache can act as a
PH> _transparent_ proxy, like Squid ?

Apache can work as a transparent proxy only if it has an upstream
proxy to forward to. I use it that way, but I would prefer to only
have one proxy.


/Benny



