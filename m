From: <hamals@infinito.it>
Subject: Re: web server in DMZ
Date: Wed, 29 Sep 2004 11:35:04 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <web-6704233@infinito.it>
References: <web-6416739@infinito.it>
	<1096381048.2330.47.camel@wolfpack.ljm.dom>
	<web-6491079@infinito.it>
	<1096383819.2330.50.camel@wolfpack.ljm.dom>
	<41597FEE.9010401@cisco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41597FEE.9010401@cisco.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marek Dohojda <mdohojda@cisco.com>
Cc: netfilter@lists.netfilter.org

On Tue, 28 Sep 2004 08:14:54 -0700
  Marek Dohojda <mdohojda@cisco.com> wrote:
> Just create SNAT to that webserver so that whenever they 
>try to go to the external address it get mangled and 
>visible via its internal IP.  Or you could play with 
>advance routing wihch is a pain in this case.


I've just create a snat for my internal hosts so they go 
to outside with a public ip, but this solutions is not 
working.

_______________________________________
Connessione ed e-mail gratuita da 10 mb
consultabile tramite web e tramite pop.
www.infinito.it vieni a scoprire tutti 
i nostri servizi!

http://www.infinito.it/xmail


