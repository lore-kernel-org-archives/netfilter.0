From: Carlos Villegas <villegas@math.gatech.edu>
Subject: Re: Question about REJECT in FORWARD rule
Date: Wed, 11 Aug 2004 16:00:45 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040811200045.GA6472@uglabng.math.gatech.edu>
References: <D5C9032B2B09C64EA2409D6214E91AC905126E@asimail2.alphanumeric.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC905126E@asimail2.alphanumeric.com>
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
To: Jason Opperisano <Jopperisano@alphanumeric.com>
Cc: netfilter@lists.netfilter.org

On Wed, Aug 11, 2004 at 12:30:50PM -0400, Jason Opperisano wrote:
> is not narrowing down the interface/source, and is hit before any connection tracking occurs.  i've never used "-j REJECT --reject-with tcp-reset" without also specifying "--syn" as it could have very odd results (and also doesn't make sense from a TCP perspective)...

Really? I thought "-j REJECT --reject-with tcp-reset" would always do
the right thing, even without specifying --syn (of course, it wouldn't
be a bad idea to specify it anyway). I have several systems running fine
without the --syn option explicitly mentioned. Could any of the "core"
guys say if my assumption is wrong? 

Carlos


