From: Michael Atighetchi <matighet@bbn.com>
Subject: Re: Modification to iptables (block IP addresses)
Date: Mon, 28 Oct 2002 15:11:38 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021028201138.GJ26387@bbn.com>
References: <3DBD94CF.C0F8E7E2@lanl.gov>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3DBD94CF.C0F8E7E2@lanl.gov>
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
To: rwc@lanl.gov
Cc: netfilter@lists.samba.org

We have implemented and Red Team tested such a defense against TCP
connection floods. The software is available open-source at 
http://apod.bbn.com/release/latest
and documented at
http://apod.bbn.com/release/latest/docs/quo/apod/docs/manual/pdf/ApodToolkit.pdf
in section 3.9

Michael

On Mon, Oct 28, 2002 at 12:49:35PM -0700, rwc@lanl.gov wrote:
> Is anyone working on the following modification to iptables?
> 
> Dynamically watch for connections coming from any source IP addresses
> that exceeds a
> predefined number of connections per unit time.  When seen, block all
> subsequent connections from that source for a predefined period of time
> or
> indefinitely.  Currently, one can do this for specific predefined source
> IP
> addresses, but it would be good to have the ability to do this without
> having prior knowledge of the offending IP source.
> 
> 
> 
> 

-- 
matighet@bbn.com   BBN Technologies

