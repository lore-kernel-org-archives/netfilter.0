From: Jason Opperisano <opie@817west.com>
Subject: Re: iptables and wireless card in promiscuous mode
Date: Wed, 1 Dec 2004 11:16:06 -0500
Message-ID: <20041201161606.GA971@bender.817west.com>
References: <424BCB4EA242A1429A8AF0548E8CFF0E123999@apexexchange.ApexSoftware.Com>
	<41ADD672.1090303@eurecom.fr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <41ADD672.1090303@eurecom.fr>
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

On Wed, Dec 01, 2004 at 03:34:26PM +0100, Claudio Lavecchia wrote:
> BTW you are right, filtering at a lower layer is the most 
> straightforward approach.
> Can anyone tell me how to set up a simple filter using BPF that blocks 
> all the packets coming from a given MAC address?
> 
> Thx a lot

man pages?  *we* don't need no stinking man pages...

  not ether host XX:XX:XX:XX:XX:XX

-j

--
"Mmmm...free goo."
        --The Simpsons

