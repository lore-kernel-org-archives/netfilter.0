From: Jean-Christian Imbeault <jc@mega-bucks.co.jp>
Subject: Re: New user and MRTG error help
Date: Wed, 06 Aug 2003 07:19:32 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F302D74.8000405@mega-bucks.co.jp>
References: <3F3029D8.4060903@bigpond.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F3029D8.4060903@bigpond.net.au>
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
To: Paul Baxter <ppabaxte@bigpond.net.au>
Cc: netfilter@lists.netfilter.org

Paul Baxter wrote:
> Does anyone know what this warning means, the interface is working I'm 
> using it now.

Uh ... these are mrtg problems not netfilters related.

The errors mean that the script you are using to feed data to mrtg is
feeding it error messages. Run the script from the command line and
you'll see what the error message is exactly.

Jean-Christian Imbeault


