From: Jason Opperisano <opie@817west.com>
Subject: Re: problem with hook function for DHCP
Date: Tue, 30 Nov 2004 15:41:31 -0500
Message-ID: <20041130204131.GA28305@bender.817west.com>
References: <81703d8a041129235876acd876@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <81703d8a041129235876acd876@mail.gmail.com>
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

On Mon, Nov 29, 2004 at 11:58:44PM -0800, Subhash Gopinath wrote:
> Hello all,
> 
> I am facing problems capturing DHCP packets sent from a client to a server....
> Basically, the hook function (defined below) is not getting called for
> each packet going out of the system.. Any ideas ?

my idea:  DHCP packets are generated and processed at the BPF layer
(which is below netfilter in the stack); and never pass through any
netfilter hooks.

-j

--
"Default! The two sweetest words in the English language!"
        --The Simpsons

