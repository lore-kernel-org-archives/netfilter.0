From: Jason Opperisano <opie@817west.com>
Subject: Re: ROUTE target and --continue
Date: Tue, 22 Feb 2005 11:14:41 -0500
Message-ID: <20050222161441.GA7469@bender.817west.com>
References: <20050222105012.GA16180@rayleigh.systella.fr>
	<1109082245.6098.7.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1109082245.6098.7.camel@hubcap.ljm.dom>
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

On Tue, Feb 22, 2005 at 09:24:05AM -0500, Jason Opperisano wrote:
> again--you don't specify which chain of mangle your ROUTE rule is in,
> but if it's in POSTROUTING, even if it worked the way you are assuming,
> mangle POSTROUTING is *after* nat POSTROUTING.

for the sake of the archives--i'm a moron:  nat POSTROUTING is after
mangle POSTROUTING.  beautiful coffee has opened mine eyes to the truth.

-j

--
"Let us celebrate our agreement with the adding of chocolate to milk."
        --The Simpsons

