From: Frederic de Villamil <neuro@seclab.jp>
Subject: Re: -m tcp
Date: Wed, 24 Mar 2004 19:39:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040324183937.GB20010@jesus.seclab.jp>
References: <017e01c411cd$c358a170$0300a8c0@max2>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <017e01c411cd$c358a170$0300a8c0@max2>
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
Content-Transfer-Encoding: 7bit
To: "j.travis" <skynet@psinode.com>
Cc: netfilter@lists.netfilter.org

On Wed, 24 Mar 2004, j.travis wrote:

> Is  there any (functional) difference between these two statements?
>
> -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
>
> -A INPUT -p tcp --dport 80 -j ACCEPT
>

No. Absolutely not.

--
http://www.seclab.jp

