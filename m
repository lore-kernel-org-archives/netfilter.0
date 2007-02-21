From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: -s THIS ? (address belongs to one of of interfaces of local
	machine)
Date: Wed, 21 Feb 2007 14:39:29 -0500
Message-ID: <20070221193929.GC6207@salty>
References: <f36b08ee0702210408h5db5027bmb1105d0d7d74cb17@mail.gmail.com>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <f36b08ee0702210408h5db5027bmb1105d0d7d74cb17@mail.gmail.com>
	(from
	+nfcan+jimlaur+16eee38966.iler.ml#gmail.com@spamgourmet.com on
	Wed, Feb 21, 2007 at 07:08:17 -0500)
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
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="us-ascii"
To: netfilter@lists.netfilter.org

On 2007.02.21 07:08, Yakov Lerner - iler.ml@gmail.com wrote:
> Is there an easy way to specify '-s LOCAL', meaning
> not 127.0.0.1, but meaning that address matches any of
> addresses of interfaces belonging this this machine ?

In the filter table this distinction is implicit
in the choice of the Input/Output or Forward chains.
So 'Local' packets do not normally traverse Forward.
Is that enough?

-- 
Jim Laurino
nfcan.x.jimlaur@dfgh.net
Please reply to the list.
Only mail from the listserver reaches this address.

