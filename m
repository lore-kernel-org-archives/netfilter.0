From: Stephen J Smoogen <smoogen@lanl.gov>
Subject: Re: [ANNOUNCE] Proceedings of Netfilter Developer Workshop 2004
Date: Mon, 27 Sep 2004 10:51:59 -0600
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4158452F.1040904@lanl.gov>
References: <20040925213322.GJ3236@sunbeam.de.gnumonks.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040925213322.GJ3236@sunbeam.de.gnumonks.org>
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
To: Harald Welte <laforge@netfilter.org>
Cc: netfilter@lists.netfilter.org

Harald Welte wrote:
> Hi!
> 
> I finally finished writing up the proceedings of the 2004 Netfilter
> Developer Workshop, based on the notes taken by various attendees.
> 
> They are available in DocBook XML, HTML, Postscript, PDF and ASCII
> Versions at
> http://www.netfilter.org/documentation/index.html#documentation-events
> 
> For your convenience, the ASCII version is attached to this email.
> 

Is there more publishing on Rober Olsson's benchmarks and findings. We 
are doing various testing here and while the numbers look similar, I 
would like to get an established testing methodology so that we can 
confirm/help results from baseline tests.

Our next line of testing is to find out which network cards will give us 
the best bang for the buck on 10 gig testing. We currently have 300kpps 
at 1 gig (E1000 + 2.4.2x kernel) but not sure if we are reaching the 
limitations of the E1000 fibre optics or the PCI-X bus.

-- 
Stephen John Smoogen	        | CCN-5 Security Team
LANL SIRT Team Leader           | SMTP:  smoogen@lanl.gov
Los Alamos National Laboratory  | Voice: 505.664.0645
Ta-03 SM-1498 MS: B255 DP 10S   | FAX:   505.665.7793
Los Alamos, NM 87545            |

